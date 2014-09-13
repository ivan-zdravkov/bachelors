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
            DB.PaymentHistories.Add(new PaymentHistory
                {
                    Amount = decimal.Parse(payPalCheckoutInfo.mc_gross, CultureInfo.InvariantCulture),
                    RecepientId = userId,
                    IssuerId = userId,
                    Currency = "GBP",
                    PayPalEmail = payPalCheckoutInfo.payer_email
                });

            AspNetUser user = DB.AspNetUsers.Find(userId);
            if (user != null)
            {
                SubscriptionPlan plan = user.PersonalDetail.SubscriptionPlan;

                switch (payPalCheckoutInfo.item_name1)
                {
                    case "credits50":
                        plan.Credits += 50;
                        break;
                    case "credits100":
                        plan.Credits += 100;
                        break;
                    case "credits200":
                        plan.Credits += 200;
                        break;
                    case "credits500":
                        plan.Credits += 500;
                        break;
                    case "subscription1month":
                        if (plan.ActiveUntil.HasValue && plan.ActiveUntil.Value > DateTime.Today)
                        {
                            plan.ActiveUntil.Value.AddMonths(1);
                        }
                        else
                        {
                            plan.ActiveUntil = DateTime.Today.AddMonths(1);
                        }
                        break;
                    case "subscription3month":
                        if (plan.ActiveUntil.HasValue && plan.ActiveUntil.Value > DateTime.Today)
                        {
                            plan.ActiveUntil.Value.AddMonths(3);
                        }
                        else
                        {
                            plan.ActiveUntil = DateTime.Today.AddMonths(3);
                        }
                        break;
                    case "subscription6month":
                        if (plan.ActiveUntil.HasValue && plan.ActiveUntil.Value > DateTime.Today)
                        {
                            plan.ActiveUntil.Value.AddMonths(6);
                        }
                        else
                        {
                            plan.ActiveUntil = DateTime.Today.AddMonths(6);
                        }
                        break;
                    case "subscription12month":
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
            return (amount * rate).ToString().Substring(0, 4).Replace(",", ".");
        }
        public ActionResult Index()
        {
            return View();
        }
	}
}