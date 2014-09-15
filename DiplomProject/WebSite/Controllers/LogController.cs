using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebSite.EntityFramework;

namespace WebSite.Controllers
{
    public class LogController : BaseController
    {
        public ActionResult Visits()
        {
            return View();
        }

        public ActionResult Payments()
        {
            return View();
        }
	}
}