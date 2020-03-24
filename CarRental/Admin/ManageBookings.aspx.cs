using CarRental.DataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarRental.Admin
{
    public partial class ManageBookings : System.Web.UI.Page
    {
        BookingRepository bookingRepository = new BookingRepository();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.IsInRole(nameof(RoleType.Admin)))
            {
                Response.Redirect(GetRouteUrl("Default", null));
            }
            if (!IsPostBack)
            {
                LoadData();
            }
        }

        protected void LoadData()
        {
            ManageBookingGridView.DataSource = bookingRepository.GetAllBookingInfos();
            ManageBookingGridView.DataBind();
        }

        protected bool IsEditable(string status)
        {
            return status == nameof(BookingStatus.Booked);
        }

        protected void ManageBookingGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                {
                    TextBox startDateTextBox = e.Row.FindControl("StartDate_Edit") as TextBox;
                    var startDate = (e.Row.DataItem as BookingInfo).StartDate;
                    startDateTextBox.Text = startDate.ToString("yyyy-MM-ddTHH:mm");

                    TextBox endDateTextBox = e.Row.FindControl("EndDate_Edit") as TextBox;
                    var endDate = (e.Row.DataItem as BookingInfo).EndDate;
                    endDateTextBox.Text = endDate.ToString("yyyy-MM-ddTHH:mm");

                    DropDownList statusList = e.Row.FindControl("Status_Edit") as DropDownList;
                    foreach (var type in Enum.GetNames(typeof(BookingStatus)))
                    {
                        statusList.Items.Add(new ListItem(type, type));
                    }
                    statusList.DataBind();
                }
            }
        }

        protected void ManageBookingGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            ManageBookingGridView.EditIndex = e.NewEditIndex;
            LoadData();
        }

        protected void ManageBookingGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                var id = int.Parse((ManageBookingGridView.Rows[e.RowIndex].FindControl("Id_Item") as Label).Text);
                var startDate = DateTime.Parse((ManageBookingGridView.Rows[e.RowIndex].FindControl("StartDate_Edit") as TextBox).Text);
                var endDate = DateTime.Parse((ManageBookingGridView.Rows[e.RowIndex].FindControl("EndDate_Edit") as TextBox).Text);
                var status = (ManageBookingGridView.Rows[e.RowIndex].FindControl("Status_Edit") as DropDownList).Text;
                var cost = double.Parse((ManageBookingGridView.Rows[e.RowIndex].FindControl("Cost_Edit") as TextBox).Text);
                if (startDate > endDate)
                {
                    throw new Exception("Start Date cannot be more than End Date");
                }
                bookingRepository.UpdatingBooking(id, startDate, endDate, status, cost);
                ManageBookingGridView.EditIndex = -1;
                LoadData();
            }
            catch(Exception Ex)
            {
                ErrorMessage.Text = Ex.Message;
            }
        }

        protected void ManageBookingGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            ManageBookingGridView.EditIndex = -1;
            LoadData();
        }
    }
}