using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace WebSite.Models.Subscription
{
    public class SubscriptionCreditsModel
    {
        [Display(Name = "ActiveUntil", ResourceType = typeof(Resources.Resources))]
        public DateTime? ActiveUntil { get; set; }

        [Display(Name = "Credits", ResourceType = typeof(Resources.Resources))]
        public int Credits { get; set; }

        [Display(Name = "UnlimitedAccess", ResourceType = typeof(Resources.Resources))]
        public bool UnlimitedAccess { get; set; }
    }
}