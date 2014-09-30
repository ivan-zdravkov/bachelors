using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebSite.EntityFramework;
using Microsoft.AspNet.Identity;
using InternalDAL;
using WebSite.Models.Log;
using System.Globalization;

namespace WebSite.Controllers
{
    [Authorize(Roles = "Client")]
    public class LogController : BaseController
    {
        public ActionResult Visits()
        {
            string userID = this.User.Identity.GetUserId();

            AspNetUser user = DB.AspNetUsers.Find(userID);
            IEnumerable<EntranceHistoryItemModel> model = new List<EntranceHistoryItemModel>();
            if (user != null)
            {
                List<EntranceHistory> entranceHistories = new List<EntranceHistory>();
                foreach (Card card in user.Cards)
                {
                    entranceHistories.AddRange(card.EntranceHistories);
                }

                model = entranceHistories.OrderBy(entranceHistory => entranceHistory.CreatedAt).
                    Select(entranceHistory => new EntranceHistoryItemModel
                {
                    UserName = EntityHelper.GetFullName(user.Id),
                    Date = entranceHistory.CreatedAt.HasValue ? entranceHistory.CreatedAt.Value.ToString("dd/MM/yyyy", CultureInfo.InvariantCulture) : String.Empty,
                    Time = entranceHistory.CreatedAt.HasValue ? entranceHistory.CreatedAt.Value.ToString("hh:mm", CultureInfo.InvariantCulture) : String.Empty,
                    CardNumber = entranceHistory.Card.CardId,
                    EntryStatus = entranceHistory.EntryStatus,
                    FacilityName = entranceHistory.Facility.Name,
                }).ToList();
            }

            return View(model);
        }

        public ActionResult Payments()
        {
            string userID = this.User.Identity.GetUserId();

            AspNetUser user = DB.AspNetUsers.Find(userID);
            IEnumerable<PaymentHistoryItemModel> model = new List<PaymentHistoryItemModel>();
            if (user != null)
            {
                model = user.PaymentHistories.OrderBy(paymentHistory => paymentHistory.CreatedAt).Select(paymentHistory => new PaymentHistoryItemModel
                {
                    Date = paymentHistory.CreatedAt.HasValue ? paymentHistory.CreatedAt.Value.ToString("dd/MM/yyyy", CultureInfo.InvariantCulture) : String.Empty,
                    Time = paymentHistory.CreatedAt.HasValue ? paymentHistory.CreatedAt.Value.ToString("hh:mm", CultureInfo.InvariantCulture) : String.Empty,
                    IssuerName = EntityHelper.GetFullName(paymentHistory.IssuerId),
                    RecepientName = EntityHelper.GetFullName(paymentHistory.RecepientId),
                    ProductName = paymentHistory.Product.Name,
                    PayPalEmail = paymentHistory.PayPalEmail
                }).ToList();
            }

            return View(model);
        }
    }
}