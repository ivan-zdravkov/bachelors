using InternalDAL;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Net;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Mvc;
using WebSite.EntityFramework;
using WebSite.Models.Payment;
using WebSite.Models.Subscription;

namespace WebSite.Controllers
{
    [AllowAnonymous]
    public class PaymentController : BaseController
    {
        //[EnableCors("*", "*", "*")]
        public EmptyResult PayPalPaymentNotification(PayPalCheckoutInfo payPalCheckoutInfo)
        {
            PayPalListenerModel model = new PayPalListenerModel();
            model._PayPalCheckoutInfo = payPalCheckoutInfo;
            byte[] parameters = Request.BinaryRead(Request.ContentLength);

            if (parameters != null)
            {
                model.GetStatus(parameters);
            }

            int productId = int.Parse(payPalCheckoutInfo.custom.Split('_')[0]);
            string userId = payPalCheckoutInfo.custom.Split('_')[1];

            Product product = DB.Products.Where(p => p.Id == productId).SingleOrDefault();
            if (product != null)
            {
                DB.PaymentHistories.Add(new PaymentHistory
                {
                    Product = product,
                    RecepientId = userId,
                    IssuerId = userId,
                    PayPalEmail = payPalCheckoutInfo.payer_email
                });

                AspNetUser user = DB.AspNetUsers.Find(userId);
                if (user != null)
                {
                    SubscriptionPlan plan = user.PersonalDetail.SubscriptionPlan;

                    if (product.ProductTypeId == 1) // Credits
                    {
                        plan.Credits += int.Parse(product.Display);
                    }
                    else if (product.ProductTypeId == 2) // Subscription
                    {
                        if (plan.ActiveUntil.HasValue && plan.ActiveUntil.Value > DateTime.Today)
                        {
                            plan.ActiveUntil = plan.ActiveUntil.Value.AddMonths(int.Parse(product.Display));
                        }
                        else
                        {
                            plan.ActiveUntil = DateTime.Today.AddMonths(int.Parse(product.Display));
                        }
                    }
                }

                DB.SaveChanges();
            }

            return new EmptyResult();
        } 

        [NonAction]
        public string ConvertBGNToGBP(string amountString)
        {
            decimal amount = decimal.Parse(amountString, CultureInfo.InvariantCulture);
            string fromCurrency = "BGN";
            string toCurrency = "GBP";

            WebClient web = new WebClient();
            Uri uri = new Uri(string.Format("http://finance.yahoo.com/d/quotes.csv?s={0}{1}=X&f=l1", fromCurrency, toCurrency));
            string response = web.DownloadString(uri);

            decimal rate = Convert.ToDecimal(response.Replace("/r/n", ""), CultureInfo.InvariantCulture);
            return (amount * rate).ToString("F").Replace(",", ".");
        }
	}
}