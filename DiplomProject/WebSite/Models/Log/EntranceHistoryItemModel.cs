using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace WebSite.Models.Log
{
    public class EntranceHistoryItemModel
    {
        [Display(Name = "UserName", ResourceType = typeof(Resources.Resources))]
        public string UserName { get; set; }

        [Display(Name = "Date", ResourceType = typeof(Resources.Resources))]
        public string Date { get; set; }

        [Display(Name = "Time", ResourceType = typeof(Resources.Resources))]
        public string Time { get; set; }

        [Display(Name = "CardNumber", ResourceType = typeof(Resources.Resources))]
        public string CardNumber { get; set; }

        [Display(Name = "Status", ResourceType = typeof(Resources.Resources))]
        public bool EntryStatus { get; set; }

        [Display(Name = "Facility", ResourceType = typeof(Resources.Resources))]
        public string FacilityName { get; set; }
    }
}