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
                    Response.Redirect("~/Admin/");
                }
                else if (User.IsInRole(nameof(RoleType.User)))
                {
                    Response.Redirect("~/User/");
                }
            }
        }

        protected void Cheat_Button(object sender, EventArgs e)
        {
            var userRepository = new UserRepository();
            userRepository.CreateUser("admin@com", "admin@com", "123456", "Admin");
        }
    }
}