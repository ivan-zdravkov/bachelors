using InternalDAL;
using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;
using WebSite.EntityFramework;
using WebSite.Models.Subscription;

namespace WebSite.Controllers
{
    public class SubscriptionController : BaseController
    {
        [Authorize]
        public ActionResult Index()
        {
            string userId = String.Empty;

            userId = HttpContext.User.Identity.GetUserId();
            AspNetUser user = DB.AspNetUsers.Find(userId);

            PersonalDetail personalDetail = user.PersonalDetail;
            SubscriptionCreditsModel model = new SubscriptionCreditsModel
            {
                ActiveUntil = personalDetail.SubscriptionPlan.ActiveUntil,
                Credits = personalDetail.SubscriptionPlan.Credits,
                UnlimitedAccess = personalDetail.SubscriptionPlan.UnlimitedAccess
            };

            return View(model);          
        }

        [NonAction]
        public SubscriptionCreditsModel GetSubscriptionCredits(string userId)
        {
            AspNetUser user = DB.AspNetUsers.Find(userId);

            if (user != null)
            {
                PersonalDetail personalDetail = user.PersonalDetail;

                if (personalDetail == null)
                {
                    Address address = DB.Addresses.Add(new Address() { });
                    Contact contact = DB.Contacts.Add(new Contact() { });
                    SubscriptionPlan subscriptionPlan = DB.SubscriptionPlans.Add(new SubscriptionPlan() 
                    { 
                        Credits = 0, 
                        ActiveUntil = DateTime.Today.AddDays(-1), 
                        UnlimitedAccess = false 
                    });
                    
                    personalDetail = DB.PersonalDetails.Add(new PersonalDetail() 
                    { 
                        FirstName = "",
                        LastName = "",
                        AddressId = address.Id,
                        ContactId = contact.Id, 
                        SubscriptionPlanId = subscriptionPlan.Id, 
                    });

                    user.PersonalDetailsId = personalDetail.Id;

                    DB.SaveChanges();
                }

                SubscriptionCreditsModel model = new SubscriptionCreditsModel()
                {
                    ActiveUntil = personalDetail.SubscriptionPlan.ActiveUntil,
                    Credits = personalDetail.SubscriptionPlan.Credits,
                    UnlimitedAccess = personalDetail.SubscriptionPlan.UnlimitedAccess,
                };

                return model;
            }
            else
            {
                return null;
            }
        }
	}
}