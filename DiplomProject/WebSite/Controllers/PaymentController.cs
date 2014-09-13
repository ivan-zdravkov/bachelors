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
        public EmptyResult PayPalPaymentNotification(PayPalCheckoutInfo payPalCheckoutInfo)
        {
            PayPalListenerModel model = new PayPalListenerModel();
            model._PayPalCheckoutInfo = payPalCheckoutInfo;
            byte[] parameters = Request.BinaryRead(Request.ContentLength);

            if (parameters != null)
            {
                model.GetStatus(parameters);
            }

            string userId = payPalCheckoutInfo.custom;

            Product product = DB.Products.Where(p => p.Name == payPalCheckoutInfo.item_name1).SingleOrDefault();
            if (product != null)
            {
                DB.PaymentHistories.Add(new PaymentHistory
                {
                    Product = product,
                    RecepientId = userId,
                    IssuerId = userId,
                    PayPalEmail = payPalCheckoutInfo.payer_email
                });
            }


            AspNetUser user = DB.AspNetUsers.Find(userId);
            if (user != null)
            {
                SubscriptionPlan plan = user.PersonalDetail.SubscriptionPlan;

                switch (payPalCheckoutInfo.item_name1)
                {
                    case "50 Credits":
                        plan.Credits += 50;
                        break;
                    case "100 Credits":
                        plan.Credits += 100;
                        break;
                    case "200 Credits":
                        plan.Credits += 200;
                        break;
                    case "500 Credits":
                        plan.Credits += 500;
                        break;
                    case "1 Month Subscription":
                        if (plan.ActiveUntil.HasValue && plan.ActiveUntil.Value > DateTime.Today)
                        {
                            plan.ActiveUntil.Value.AddMonths(1);
                        }
                        else
                        {
                            plan.ActiveUntil = DateTime.Today.AddMonths(1);
                        }
                        break;
                    case "3 Month Subscription":
                        if (plan.ActiveUntil.HasValue && plan.ActiveUntil.Value > DateTime.Today)
                        {
                            plan.ActiveUntil.Value.AddMonths(3);
                        }
                        else
                        {
                            plan.ActiveUntil = DateTime.Today.AddMonths(3);
                        }
                        break;
                    case "6 Month Subscription":
                        if (plan.ActiveUntil.HasValue && plan.ActiveUntil.Value > DateTime.Today)
                        {
                            plan.ActiveUntil.Value.AddMonths(6);
                        }
                        else
                        {
                            plan.ActiveUntil = DateTime.Today.AddMonths(6);
                        }
                        break;
                    case "12 Month Subscription":
                        if (plan.ActiveUntil.HasValue && plan.ActiveUntil.Value > DateTime.Today)
                        {
                            plan.ActiveUntil.Value.AddMonths(12);
                        }
                        else
                        {
                            plan.ActiveUntil = DateTime.Today.AddMonths(12);
                        }
                        break;
                }
            }

            DB.SaveChanges();
    
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
        public ActionResult Index()
        {
            return View();
        }
	}
}