using CarRental.DataModel;
using Microsoft.AspNet.Identity;
using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarRental.User
{
    public partial class ViewAndBookCars : System.Web.UI.Page
    {
        private readonly CarRepository carRepository = new CarRepository();

        private readonly BookingRepository bookingRepository = new BookingRepository();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.IsInRole(nameof(RoleType.User)))
            {
                Response.Redirect(GetRouteUrl("Default", null));
            }
            if (!IsPostBack)
            {
                StartDateFilter.Attributes["min"] = DateTime.Now.ToLocalTime().AddHours(6).ToString("yyyy-MM-ddTHH:mm");
                StartDateFilter.Attributes["max"] = DateTime.Now.ToLocalTime().AddDays(30).ToString("yyyy-MM-ddTHH:mm");
                StartDateFilter.Text = DateTime.Now.ToLocalTime().AddHours(6).ToString("yyyy-MM-ddTHH:mm");

                EndDateFilter.Attributes["min"] = DateTime.Now.ToLocalTime().AddHours(6).ToString("yyyy-MM-ddTHH:mm");
                EndDateFilter.Attributes["max"] = DateTime.Now.ToLocalTime().AddDays(30).ToString("yyyy-MM-ddTHH:mm");
                EndDateFilter.Text = DateTime.Now.ToLocalTime().AddHours(6).AddDays(7).ToString("yyyy-MM-ddTHH:mm");

                foreach (var type in Enum.GetNames(typeof(CarType)))
                {
                    TypeFilter.Items.Add(new ListItem(type, type));
                }
            }
        }

        protected void Date_ServerValidate(object source, ServerValidateEventArgs args)
        {
            var startDate = DateTime.Parse(StartDateFilter.Text);
            var endDate = DateTime.Parse(EndDateFilter.Text);
            if (startDate > endDate)
            {
                ErrorMessage.Text = "End Date cannot be less than Begin Date";
                args.IsValid = false;
            }
            else if ((endDate - startDate).TotalDays > 7.0)
            {
                ErrorMessage.Text = "The maximum days that any car can be booked is 7 days";
                args.IsValid = false;
            }
            else
            {
                ErrorMessage.Text = "";
                args.IsValid = true;
            }
        }

        protected void FilterButton_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                var startDate = DateTime.Parse(StartDateFilter.Text);
                var endDate = DateTime.Parse(EndDateFilter.Text);
                var type = TypeFilter.Text;
                var price = PriceFilter.Text;

                var cars = carRepository.GetAvailableCars();
                var filterCar = cars.Where(car =>
                {
                    foreach (var booking in car.Bookings)
                    {
                        if ((booking.StartDate >= startDate && booking.StartDate < endDate) ||
                            (booking.StartDate <= startDate && booking.EndDate >= startDate) &&
                            booking.Status == nameof(BookingStatus.Booked))
                        {
                            return false;
                        }
                    }
                    return true;
                });
                if (!string.IsNullOrEmpty(type))
                {
                    filterCar = filterCar.Where(car => car.Type == type);
                }
                if (price == "Increasing")
                {
                    filterCar = filterCar.OrderBy(car => car.Price);
                }
                else if (price == "Decreasing")
                {
                    filterCar = filterCar.OrderByDescending(car => car.Price);
                }
                CarGridView.DataSource = filterCar;
                CarGridView.DataBind();
            }
        }

        protected void CarGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Book"))
            {
                try
                {
                    GridViewRow row = (GridViewRow)(((Control)e.CommandSource).NamingContainer);
                    var startDate = DateTime.Parse(StartDateFilter.Text);
                    var endDate = DateTime.Parse(EndDateFilter.Text);
                    var price = double.Parse((row.FindControl("Price_Item") as Label).Text);
                    var totalDay = Math.Ceiling((endDate - startDate).TotalDays);
                    var carId = int.Parse((row.FindControl("Id_Item") as Label).Text);
                    var userId = User.Identity.GetUserId();

                    Booking booking = new Booking
                    {
                        StartDate = startDate,
                        EndDate = endDate,
                        Status = nameof(BookingStatus.Booked),
                        Cost = price * totalDay,
                        CarId = carId,
                        UserId = userId
                    };
                    bookingRepository.AddBooking(booking);
                    Response.Redirect(GetRouteUrl("Default", null));
                }
                catch (Exception ex)
                {
                    ErrorMessage.Text = ex.Message;
                }
            }
        }
    }
}