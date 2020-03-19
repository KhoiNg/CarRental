using CarRental.DataModel;
using System;
using System.Collections.Generic;
using System.Web.Routing;
using System.Web.UI;

namespace CarRental.Admin
{
    public partial class ViewCarCalendar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.IsInRole(nameof(RoleType.Admin)))
            {
                Response.Redirect(GetRouteUrl("Default", null));
            }
            if (!IsPostBack)
            {
                try
                {
                    var carId = int.Parse(RouteData.Values["carId"].ToString());
                    BookingRepository bookingRepository = new BookingRepository();
                    CarCalendarGridView.DataSource = bookingRepository.GetBookingsByCar(carId);
                }
                catch (Exception ex)
                {
                    ErrorMessage.Text = ex.Message;
                    CarCalendarGridView.DataSource = new List<Booking>();
                }
                finally
                {
                    CarCalendarGridView.DataBind();
                }
            }
        }
    }
}