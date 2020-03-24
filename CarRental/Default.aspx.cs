using CarRental.Account;
using CarRental.DataModel;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarRental
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated)
            {
                if (User.IsInRole(nameof(RoleType.Admin)))
                {
                    Response.Redirect(GetRouteUrl("Admin_Default", null));
                }
                else if (User.IsInRole(nameof(RoleType.User)))
                {
                    Response.Redirect(GetRouteUrl("User_Default", null));
                }
            }
        }

        protected void Cheat_Button(object sender, EventArgs e)
        {
            var userRepository = new UserRepository();
            userRepository.CreateUser("admin@com", "Admin", "9999999999", "123 St", "admin@com", "123456", "Admin");
        }
    }
}