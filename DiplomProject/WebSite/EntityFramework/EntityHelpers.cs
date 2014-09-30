using InternalDAL;
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

        public string GetFullName(string userId)
        {
            AspNetUser user = this.DB.AspNetUsers.Find(userId);
            if (user.PersonalDetail != null)
            {
                return user.PersonalDetail.FirstName + " " + user.PersonalDetail.LastName;
            }
            else
            {
                return String.Empty;
            }
        }

        public string TransformUserIdToHex(string userId)
        {
            return new Guid(userId).ToString("N");
        }
    }
}