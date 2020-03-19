using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CarRental.DataModel;

namespace CarRental.Admin
{
    public partial class ManageCarInventory : System.Web.UI.Page
    {
        private CarRepository carRepository = new CarRepository();

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
            CarInventoryGridView.DataSource = carRepository.GetCars();
            CarInventoryGridView.DataBind();
        }

        protected void CarInventoryGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                {
                    DropDownList typeList = e.Row.FindControl("Type_Edit") as DropDownList;
                    foreach (var type in Enum.GetNames(typeof(CarType)))
                    {
                        typeList.Items.Add(new ListItem(type, type));
                    }
                    typeList.DataBind();

                    var typeText = (e.Row.DataItem as Car).Type;
                    typeList.Items.FindByValue(typeText).Selected = true;
                }
            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {
                DropDownList typeList = e.Row.FindControl("Type_Footer") as DropDownList;
                foreach (var type in Enum.GetNames(typeof(CarType)))
                {
                    typeList.Items.Add(new ListItem(type, type));
                }
                typeList.DataBind();
            }
        }

        protected void CarInventoryGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            CarInventoryGridView.EditIndex = e.NewEditIndex;
            LoadData();
        }

        protected void CarInventoryGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                var id = int.Parse((CarInventoryGridView.Rows[e.RowIndex].FindControl("Id_Item") as Label).Text);
                var make = (CarInventoryGridView.Rows[e.RowIndex].FindControl("Make_Edit") as TextBox).Text;
                var model = (CarInventoryGridView.Rows[e.RowIndex].FindControl("Model_Edit") as TextBox).Text;
                var year = int.Parse((CarInventoryGridView.Rows[e.RowIndex].FindControl("Year_Edit") as TextBox).Text);
                var color = (CarInventoryGridView.Rows[e.RowIndex].FindControl("Color_Edit") as TextBox).Text;
                var vin = (CarInventoryGridView.Rows[e.RowIndex].FindControl("VIN_Edit") as TextBox).Text;
                var mileage = int.Parse((CarInventoryGridView.Rows[e.RowIndex].FindControl("Mileage_Edit") as TextBox).Text);
                var type = (CarInventoryGridView.Rows[e.RowIndex].FindControl("Type_Edit") as DropDownList).SelectedValue;
                var price = double.Parse((CarInventoryGridView.Rows[e.RowIndex].FindControl("Price_Edit") as TextBox).Text);
                var isAvailable = (CarInventoryGridView.Rows[e.RowIndex].FindControl("IsAvailable_Edit") as CheckBox).Checked;
                Car car = new Car
                {
                    CarId = id,
                    Make = make,
                    Model = model,
                    Year = year,
                    Color = color,
                    VIN = vin,
                    Mileage = mileage,
                    Type = type,
                    Price = price,
                    IsAvailable = isAvailable
                };
                carRepository.UpdateCar(car);
                CarInventoryGridView.EditIndex = -1;
                LoadData();
            }
            catch (Exception ex)
            {
                ErrorMessage.Text = ex.Message;
            }
        }

        protected void CarInventoryGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            CarInventoryGridView.EditIndex = -1;
            LoadData();
        }

        protected void CarInventoryGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                var id = int.Parse((CarInventoryGridView.Rows[e.RowIndex].FindControl("Id_Item") as Label).Text);
                carRepository.RemoveCar(id);
                LoadData();
            }
            catch (Exception ex)
            {
                ErrorMessage.Text = ex.Message;
            }
        }

        protected void CarInventoryGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("AddNew"))
            {
                try
                {
                    var make = (CarInventoryGridView.FooterRow.FindControl("Make_Footer") as TextBox).Text;
                    var model = (CarInventoryGridView.FooterRow.FindControl("Model_Footer") as TextBox).Text;
                    var year = int.Parse((CarInventoryGridView.FooterRow.FindControl("Year_Footer") as TextBox).Text);
                    var color = (CarInventoryGridView.FooterRow.FindControl("Color_Footer") as TextBox).Text;
                    var vin = (CarInventoryGridView.FooterRow.FindControl("VIN_Footer") as TextBox).Text;
                    var mileage = int.Parse((CarInventoryGridView.FooterRow.FindControl("Mileage_Footer") as TextBox).Text);
                    var type = (CarInventoryGridView.FooterRow.FindControl("Type_Footer") as DropDownList).SelectedValue;
                    var price = double.Parse((CarInventoryGridView.FooterRow.FindControl("Price_Footer") as TextBox).Text);
                    var isAvailable = (CarInventoryGridView.FooterRow.FindControl("IsAvailable_Footer") as CheckBox).Checked;
                    Car car = new Car
                    {
                        Make = make,
                        Model = model,
                        Year = year,
                        Color = color,
                        VIN = vin,
                        Mileage = mileage,
                        Type = type,
                        Price = price,
                        IsAvailable = isAvailable
                    };
                    carRepository.AddCar(car);
                    LoadData();
                }
                catch (Exception ex)
                {
                    ErrorMessage.Text = ex.Message;
                }
            }
            else if (e.CommandName.Equals("ViewCalendar"))
            {
                try
                {
                    GridViewRow row = (GridViewRow)(((Control)e.CommandSource).NamingContainer);
                    var carId = (row.FindControl("Id_Item") as Label).Text;
                    string url = GetRouteUrl("Admin_ViewCarCalendar", new { carId });
                    Response.Redirect(url);
                }
                catch (Exception ex)
                {
                    ErrorMessage.Text = ex.Message;
                }
            }
        }
    }
}