using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using WebSite.EntityFramework;
using WebSite.Models;

namespace WebSite.WebApi
{
    [AllowAnonymous]
    public class AccessControlController : BaseApiController
    {
        [HttpPost]
        public HttpResponseMessage PostTest_Authorize_OK(string token)
        {
            HttpResponseMessage response = new HttpResponseMessage();
            response.StatusCode = HttpStatusCode.OK;

            return response;
        }

        [HttpGet]
        public HttpResponseMessage GetTest_Authorize_OK(string token)
        {
            HttpResponseMessage response = new HttpResponseMessage();
            response.StatusCode = HttpStatusCode.OK;

            return response;
        }

        [HttpPost]
        public HttpResponseMessage PostTest_Authorize_Unathorized(string token)
        {
            HttpResponseMessage response = new HttpResponseMessage();
            response.StatusCode = HttpStatusCode.Unauthorized;

            return response;
        }

        [HttpGet]
        public HttpResponseMessage GetTest_Authorize_Unathorized(string token)
        {
            HttpResponseMessage response = new HttpResponseMessage();
            response.StatusCode = HttpStatusCode.Unauthorized;

            return response;
        }

        [HttpPost]
        public HttpResponseMessage CardDetected (AccessControlModel model)
        {
            HttpResponseMessage response = new HttpResponseMessage();

            return response;
        }
    }
}