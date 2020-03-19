using CarRental.DataModel;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarRental.Account
{
    public partial class Register : System.Web.UI.Page
    {
        private readonly UserRepository userRepository = new UserRepository();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (User.Identity.IsAuthenticated)
                {
                    AlreadyLoginSection.Visible = true;
                }
                else
                {
                    RegisterSection.Visible = true;
                }
            }
        }

        protected void CreateUser(object sender, EventArgs e)
        {
            var result = userRepository.CreateUser(Email.Text, Email.Text, Password.Text, nameof(RoleType.User));
            if (result.Succeeded)
            {
                var userManager = new UserManager<IdentityUser>(new UserStore<IdentityUser>());
                var user = userManager.Find(Email.Text, Password.Text);

                if (user != null)
                {
                    var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
                    var userIdentity = userManager.CreateIdentity(user, DefaultAuthenticationTypes.ApplicationCookie);
                    authenticationManager.SignIn(new AuthenticationProperties() { IsPersistent = false }, userIdentity);
                    Response.Redirect(GetRouteUrl("Default", null));
                }
                else
                {
                    ErrorMessage.Text = "Unknown Error";
                }
            }
            else
            {
                ErrorMessage.Text = result.Errors.FirstOrDefault();
            }
        }
    }
}