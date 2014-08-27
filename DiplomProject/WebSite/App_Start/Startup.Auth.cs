using Microsoft.AspNet.Identity;
using Microsoft.Owin;
using Microsoft.Owin.Security.Cookies;
using Microsoft.Owin.Security.Google;
using Owin;

namespace WebSite
{
    public partial class Startup
    {
        // For more information on configuring authentication, please visit http://go.microsoft.com/fwlink/?LinkId=301864
        public void ConfigureAuth(IAppBuilder app)
        {
            // Enable the application to use a cookie to store information for the signed in user
            app.UseCookieAuthentication(new CookieAuthenticationOptions
            {
                AuthenticationType = DefaultAuthenticationTypes.ApplicationCookie,
                LoginPath = new PathString("/Account/Login")
            });
            // Use a cookie to temporarily store information about a user logging in with a third party login provider
            app.UseExternalSignInCookie(DefaultAuthenticationTypes.ExternalCookie);

            // Uncomment the following lines to enable logging in with third party login providers
            //app.UseMicrosoftAccountAuthentication(
            //    clientId: "",
            //    clientSecret: "");

            app.UseFacebookAuthentication(
               appId: "784318734952476",
               appSecret: "4b513e63cf379aa47c240cd108bbe258");

            app.UseTwitterAuthentication(
               consumerKey: "g4r5pZijNxkGwtfQ52RUUk0zq",
               consumerSecret: "k0C4aiD4yQj8zxBkvBj5dcUUXlmNQCnkgmxe3uyIAdlATXLckC");

            app.UseGoogleAuthentication(new GoogleOAuth2AuthenticationOptions()
            {
                ClientId = "801642808328-tsntm1bquhtasphkbtfmco1h037hdc4o.apps.googleusercontent.com",
                ClientSecret = "w0eptdrc-2ouR-vhydOmtcr1"
            });
        }
    }
}