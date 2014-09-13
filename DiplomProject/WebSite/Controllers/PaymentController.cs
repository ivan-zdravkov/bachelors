using InternalDAL;
using System;
using System.Collections.Generic;
using System.Linq;
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
                    Amount = Decimal.Parse(payPalCheckoutInfo.mc_gross),

                });

            return new EmptyResult();
        } 

        public ActionResult Index()
        {
            return View();
        }
	}
}