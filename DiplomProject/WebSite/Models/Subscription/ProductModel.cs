using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebSite.Models.Subscription
{
    public class ProductModel
    {
        public int ProductTypeId { get; set; }

        public string Name { get; set; }

        public decimal Value { get; set; }

        public string Currency { get; set; }

        public string Display { get; set; }
    }
}