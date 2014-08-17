using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace WebSite.EntityFramework
{
    public class BaseApiController : ApiController
    {
        private EntityHelpers entityHelpers = new EntityHelpers();

        public EntityHelpers EntityHelper
        {
            get { return entityHelpers; }
        }

        public ExtendedDBContext DB
        {
            get { return entityHelpers.DB; }
        }
    }
}
