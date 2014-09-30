using InternalDAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebSite.EntityFramework;
using WebSite.Models.Manage;

namespace WebSite.Controllers
{
    [Authorize(Roles = "Administrator, FacilityManager, Receptionist")]
    public class ManageController : BaseController
    {
        public ActionResult Index()
        {
            return View();
        }

        [AllowAnonymous]
        public JsonResult GetUsers()
        {
            IEnumerable<AspNetUser> users = DB.AspNetUsers.ToList();
            List<UserItemModel> data = new List<UserItemModel>();
            foreach (AspNetUser user in users)
            {
                data.Add(new UserItemModel
                {
                    UserName = user.UserName,
                    Name = EntityHelper.GetFullName(user.Id),
                    CardData = EntityHelper.TransformUserIdToHex(user.Id),
                    CardNumber = user.Cards.Where(card => card.IsActive).SingleOrDefault() != null ? user.Cards.Where(card => card.IsActive).SingleOrDefault().CardId : null
                });
            }

            return Json(data, JsonRequestBehavior.AllowGet);
        }

        [AllowAnonymous]
        public ActionResult ChangeCard(NewCardModel model)
        {
            string userId = new Guid(model.UserId).ToString();
            AspNetUser user = DB.AspNetUsers.Find(userId);

            IEnumerable<Card> cards = user.Cards.Where(card => card.UserProfileId == user.Id).ToList();
            foreach (Card card in cards)
            {
                card.IsActive = false;
            }

            user.Cards.Add(new Card()
            {
                CardId = model.CardId,
                UserProfileId = user.Id,
                IsActive = true,
            });

            JsonResult result = new JsonResult();

            try
            {
                DB.SaveChanges();

                result.Data = true;
                return result; 
            }
            catch (Exception ex)
            {
                result.Data = false;
                return result; 
            }
        }
    }
}