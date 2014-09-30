using InternalDAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebSite.EntityFramework;
using WebSite.Helpers;
using WebSite.Models;

namespace WebSite.Controllers
{
    public class HomeController : BaseController
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";
            ViewBag.PracticeCostCredits = DB.Products.Where(product => product.Name == "PracticeCostCredits").FirstOrDefault().Value.ToString().Split('.')[0].Split(',')[0];

            return View();
        }

        public ActionResult Contact()
        {
            IEnumerable<ContactModel> model = DB.Facilities.Select(facility => new ContactModel
            {
                Name = facility.Name,
                ManagerName = facility.AspNetUser.PersonalDetail.FirstName + " " + facility.AspNetUser.PersonalDetail.LastName,
                Address = facility.Address.Country + ", " + facility.Address.PostCode + " - " + facility.Address.Town + ", " + facility.Address.Address1,
                GSM = facility.Contact.GSM,
                Phone = facility.Contact.Phone
            }).ToList();

            return View(model);
        }

        public ActionResult SetCulture(string culture)
        {
            culture = CultureHelper.GetImplementedCulture(culture);

            HttpCookie cookie = Request.Cookies["_culture"];
            if (cookie != null)
                cookie.Value = culture;   // update cookie value
            else
            {
                cookie = new HttpCookie("_culture");
                cookie.Value = culture;
                cookie.Expires = DateTime.Now.AddYears(1);
            }
            Response.Cookies.Add(cookie);

            return Redirect(Request.UrlReferrer.AbsoluteUri);
        }       
    }
}