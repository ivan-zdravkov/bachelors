using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace WebSite.Models.Log
{
    public class PaymentHistoryItemModel
    {
        [Display(Name = "Date", ResourceType = typeof(Resources.Resources))]
        public string Date { get; set; }

        [Display(Name = "Time", ResourceType = typeof(Resources.Resources))]
        public string Time { get; set; }

        [Display(Name = "Issuer", ResourceType = typeof(Resources.Resources))]
        public string IssuerName { get; set; }

        [Display(Name = "Recepient", ResourceType = typeof(Resources.Resources))]
        public string RecepientName { get; set; }

        [Display(Name = "Product", ResourceType = typeof(Resources.Resources))]
        public string ProductName { get; set; }

        [Display(Name = "PayPalEmail", ResourceType = typeof(Resources.Resources))]
        public string PayPalEmail { get; set; }
    }
}