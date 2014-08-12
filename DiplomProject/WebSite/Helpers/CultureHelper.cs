using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;

namespace WebSite.Helpers
{
    public static class CultureHelper
    {
        private static readonly List<string> ValidCultures = new List<string> { "bg", "en" };
        
        // Include ONLY cultures you are implementing
        private static readonly List<string> Cultures = new List<string> { "bg", "en" };

        public static string GetImplementedCulture(string name)
        {
            if (string.IsNullOrEmpty(name))
            {
                return GetDefaultCulture();
            }
            if (ValidCultures.Where(c => c.Equals(name, StringComparison.InvariantCultureIgnoreCase)).Count() == 0)
            {
                return GetDefaultCulture(); // return Default culture if it is invalid
            }
            if (Cultures.Where(c => c.Equals(name, StringComparison.InvariantCultureIgnoreCase)).Count() > 0)
            {
                return name;
            }

            return GetDefaultCulture(); // return Default culture as no match found
        }

        public static string GetDefaultCulture()
        {
            return Cultures[0]; // return Default culture
        }
        public static string GetCurrentCulture()
        {
            return Thread.CurrentThread.CurrentCulture.Name;
        }
        public static string GetCurrentNeutralCulture()
        {
            return GetNeutralCulture(Thread.CurrentThread.CurrentCulture.Name);
        }
        public static string GetNeutralCulture(string name)
        {
            if (!name.Contains("-")) return name;

            return name.Split('-')[0]; // Read first part only. E.g. "en", "es"
        }
    }
}