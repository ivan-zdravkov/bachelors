using InternalDAL;
using Microsoft.CSharp.RuntimeBinder;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.Entity;
using System.Data.Entity.Core.Objects;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Text;
using System.Web;
using WebSite.Global;

namespace WebSite.EntityFramework
{
    public class ExtendedDBContext : InternalDBEntities
    {
        public override int SaveChanges()
        {
            ChangeTracker.DetectChanges();
            string currentUserId = this.GetCurrentUserId();
            
            ObjectContext ctx = ((IObjectContextAdapter)this).ObjectContext;
            List<ObjectStateEntry> objectStateEntryList = ctx.ObjectStateManager.GetObjectStateEntries(EntityState.Added | EntityState.Modified | EntityState.Deleted).ToList();

            foreach (ObjectStateEntry entry in objectStateEntryList)
            {
                if (entry.State == EntityState.Added)
                {
                    if (entry.Entity.GetType().GetProperties().Where(t => t.Name == "CreatedBy").Any())
                    {
                        Type type = entry.Entity.GetType();
                        type.GetProperties().Where(t => t.Name == "CreatedBy").First().SetValue(entry.Entity, currentUserId);
                    }

                    if (entry.Entity.GetType().GetProperties().Where(t => t.Name == "CreatedAt").Any())
                    {
                        Type type = entry.Entity.GetType();
                        type.GetProperties().Where(t => t.Name == "CreatedAt").First().SetValue(entry.Entity, DateTime.Now);
                    }
                }
            }

            var trackables = ChangeTracker.Entries();
            foreach (var entry in trackables.Where(t => t.State == EntityState.Modified))
            {
                if (entry.Entity.GetType().GetProperties().Where(t => t.Name == "LastModifiedBy").Any())
                {
                    Type type = entry.Entity.GetType();
                    type.GetProperties().Where(t => t.Name == "LastModifiedBy").First().SetValue(entry.Entity, currentUserId);
                }

                if (entry.Entity.GetType().GetProperties().Where(t => t.Name == "LastModifiedAt").Any())
                {
                    Type type = entry.Entity.GetType();
                    type.GetProperties().Where(t => t.Name == "LastModifiedAt").First().SetValue(entry.Entity, DateTime.Now);
                }
            }

            return base.SaveChanges();
        }

        private string GetCurrentUserId()
        {
            string currentUserId = null;

            if (HttpContext.Current != null && HttpContext.Current.User != null && HttpContext.Current.User.Identity != null)
            {
                currentUserId = HttpContext.Current.User.Identity.GetUserId();
            }

            if (currentUserId == null)
            {
                currentUserId = GlobalConstants.SystemAdministratorId.ToString();
            }

            return currentUserId;
        }
    }
}
