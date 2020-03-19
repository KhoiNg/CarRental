using Microsoft.AspNet.FriendlyUrls;
using System;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;

namespace CarRental
{
    public class Global : HttpApplication
    {
        private void Application_Start(object sender, EventArgs e)
        {
            RegisterRoutes(RouteTable.Routes);

            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }

        private void RegisterRoutes(RouteCollection routes)
        {
            routes.MapPageRoute(
                "Default",
                "",
                "~/Default.aspx");

            routes.MapPageRoute(
                "Login",
                "Account/Login",
                "~/Account/Login.aspx");

            routes.MapPageRoute(
                "Register",
                "Account/Register",
                "~/Account/Register.aspx");

            routes.MapPageRoute(
                "Admin_Default",
                "Admin",
                "~/Admin/Default.aspx");

            routes.MapPageRoute(
                "Admin_ManageBookings",
                "Admin/ManageBookings",
                "~/Admin/ManageBookings.aspx");

            routes.MapPageRoute(
                "Admin_ManageCarInventory",
                "Admin/ManageCarInventory",
                "~/Admin/ManageCarInventory.aspx");

            routes.MapPageRoute(
                "Admin_ManageUsers",
                "Admin/ManageUsers",
                "~/Admin/ManageUsers.aspx");

            routes.MapPageRoute(
                "Admin_ViewCarCalendar",
                "Admin/ViewCarCalendar/{carId}",
                "~/Admin/ViewCarCalendar.aspx");

            routes.MapPageRoute(
                "User_Default",
                "User",
                "~/User/Default.aspx");

            routes.MapPageRoute(
                "User_ManageBookings",
                "User/ManageBookings",
                "~/User/ManageBookings.aspx");

            routes.MapPageRoute(
                "User_ViewAndBookCars",
                "User/ViewAndBookCars",
                "~/User/ViewAndBookCars.aspx");
        }
    }


}