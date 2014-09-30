using InternalDAL;
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
        public HttpResponseMessage CardDetected (AccessControlModel model)
        {
            HttpResponseMessage response = new HttpResponseMessage();

            Facility facility = DB.Facilities.Where(f => f.DeviceId == model.Icdev).SingleOrDefault();
            Card card = DB.Cards.Where(c => c.CardId == model.CardNumber && c.IsActive).SingleOrDefault();
            AspNetUser user = DB.AspNetUsers.Find((new Guid(model.UserDetails)).ToString());

            if (facility == null || card == null || user == null)
            {
                response.StatusCode = HttpStatusCode.BadRequest;
                return response;
            }

            decimal price = DB.Products.Where(p => p.Name == "PracticeCostCredits" && p.IsActive == true).FirstOrDefault().Value;

            List<EntranceHistory> entrances = DB.EntranceHistories.Where(eh => eh.Card.CardId == model.CardNumber).ToList();
            foreach (var entrance in entrances)
            {
                if (entrance.CreatedAt.Value.AddHours(2) > DateTime.Now)
                {
                    return response;
                }
            }

            if (user.PersonalDetail.SubscriptionPlan.UnlimitedAccess)
            {
                return response;
            }
            else if (user.PersonalDetail.SubscriptionPlan.ActiveUntil >= DateTime.Today)
            {
                return response;
            }
            else if (user.PersonalDetail.SubscriptionPlan.Credits >= price)
            {
                int priceInt = int.Parse(price.ToString().Split('.')[0].Split(',')[0]);
                user.PersonalDetail.SubscriptionPlan.Credits = user.PersonalDetail.SubscriptionPlan.Credits - priceInt;
            }
            else 
            {
                DB.EntranceHistories.Add(new EntranceHistory
                {
                    CardId = card.Id,
                    FacilityId = facility.Id,
                    EntryStatus = true,
                });
                DB.SaveChanges();

                response.StatusCode = HttpStatusCode.BadRequest;
                return response;
            }

            DB.EntranceHistories.Add(new EntranceHistory
            {
                CardId = card.Id,
                FacilityId = facility.Id,
                EntryStatus = true,
            });

            DB.SaveChanges();

            return response;
        }

        [HttpPost]
        public HttpResponseMessage IsOpen (int facilityId)
        {
            HttpResponseMessage response = new HttpResponseMessage();

            return response;
        }
    }
}