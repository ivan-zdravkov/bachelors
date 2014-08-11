using System.Web.Mvc;
namespace WebSite.EntityFramework
{
    public class BaseController : Controller
    {
        private EntityHelpers entityHelpers = new EntityHelpers();

        public EntityHelpers EntityHelper
        {
            get { return entityHelpers; }
        }

        public ExtendedDBContext DB
        {
            get { return entityHelpers.DB; }
        }
    }
}