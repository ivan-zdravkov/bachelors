using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace WebSite.Models
{
    public class ContactModel
    {
        [Display(Name = "Facility", ResourceType = typeof(Resources.Resources))]
        public string Name { get; set; }

        [Display(Name = "Manager", ResourceType = typeof(Resources.Resources))]
        public string ManagerName { get; set; }

        [Display(Name = "Address", ResourceType = typeof(Resources.Resources))]
        public string Address { get; set; }

        public string Phone { get; set; }

        public string GSM { get; set; }
    }
}