using System;
using System.Threading;
using System.Web;
using System.Web.Mvc;
namespace WebSite.EntityFramework
{
    public class BaseController : Controller
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

        protected override IAsyncResult BeginExecuteCore(AsyncCallback callback, object state)
        {
            string cultureName = null;

            HttpCookie cultureCookie = Request.Cookies["_culture"];
            if (cultureCookie != null)
            {
                cultureName = cultureCookie.Value;
            }
            else
            {
                cultureName = (Request.UserLanguages != null && Request.UserLanguages.Length > 0) ? Request.UserLanguages[0] : null; // obtain it from HTTP header AcceptLanguages        
            }

            cultureName = WebSite.Helpers.CultureHelper.GetImplementedCulture(cultureName);
       
            Thread.CurrentThread.CurrentCulture = new System.Globalization.CultureInfo(cultureName);
            Thread.CurrentThread.CurrentUICulture = Thread.CurrentThread.CurrentCulture;

            return base.BeginExecuteCore(callback, state);
        }
    }
}