using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using WebSite.EntityFramework;

namespace WebSite.WebApi
{
    public class PaymentSystemController : BaseApiController
    {
        public HttpResponseMessage LoadBalance(string userId, decimal amount)
        {
            return new HttpResponseMessage();
        }

        public HttpResponseMessage Subscribe(string userId, int numberOfMonths)
        {
            return new HttpResponseMessage();
        }
    }
}
