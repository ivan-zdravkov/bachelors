using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebSite.Models.Subscription
{
    public class SubscriptionsCreditsViewModel
    {
        public SubscriptionCreditsModel SubscriptionCreditsModel { get; set; }

        public IEnumerable<ProductModel> Products { get; set; }
    }
}