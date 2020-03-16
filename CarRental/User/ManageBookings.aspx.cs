using CarRental.DataModel;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarRental.User
{
    public partial class ManageBookings : System.Web.UI.Page
    {
        private readonly BookingRepository bookingRepository = new BookingRepository();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }
        }

        protected void LoadData()
        {
            var userId = User.Identity.GetUserId();
            var bookings = bookingRepository.GetBookingsByUser(userId);
            ManageBookingsGridView.DataSource = bookings;
            ManageBookingsGridView.DataBind();
        }

        protected void ManageBookingsGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("CancelBooking"))
            {
                try
                {
                    GridViewRow row = (GridViewRow)(((Control)e.CommandSource).NamingContainer);
                    var bookingId = int.Parse((row.FindControl("Id_Item") as Label).Text);
                    bookingRepository.CancelBooking(bookingId);
                    LoadData();
                }
                catch(Exception ex)
                {
                    ErrorMessage.Text = ex.Message;
                }
            }
        }
    }
}