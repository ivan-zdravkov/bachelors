using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using WebSite.EntityFramework;

namespace WebSite.WebApi
{
    public class AccessControlController : BaseApiController
    {
        [HttpPost]
        public HttpResponseMessage Authorize(string token)
        {
            // Decode and do actions with token

            bool authorized = true;

            HttpResponseMessage response = new HttpResponseMessage();
            if (authorized)
            {
                response.StatusCode = HttpStatusCode.OK;

                var info = new {
                    Balance = "50 BGN",
                    ActiveUntil = DateTime.Now.ToString("dd/MM/yyyy"),
                    Reason = "Active Subscribtion",
                };

                string serializedInfo = JsonConvert.SerializeObject(info);
                response.Content = new StringContent(serializedInfo);
            }
            else
            {
                response.StatusCode = HttpStatusCode.Unauthorized;

                var info = new
                {
                    Balance = "0 BGN",
                    ActiveUntil = DateTime.Now.ToString("dd/MM/yyyy"),
                    Reason = "Subscription ended, Balance 0",
                };

                string serializedInfo = JsonConvert.SerializeObject(info);
                response.Content = new StringContent(serializedInfo);
            }

            return response;
        }
    }
}