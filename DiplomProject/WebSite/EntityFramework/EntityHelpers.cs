using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebSite.EntityFramework
{
    public class EntityHelpers
    {
        public ExtendedDBContext DB { get; set; }

        public EntityHelpers()
        {
            this.DB = new ExtendedDBContext();
        }

    }
}