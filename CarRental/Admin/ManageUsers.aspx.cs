using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CarRental.DataModel;
using CarRental.Account;
using System.Data;

namespace CarRental.Admin
{
    public partial class ManageUsers : System.Web.UI.Page
    {
        private readonly UserRepository userRepository = new UserRepository();

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
            ManageUsersGridView.DataSource = userRepository.GetAllUsers();
            ManageUsersGridView.DataBind();
        }

        protected void ManageUsersGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                {
                    DropDownList roleList = e.Row.FindControl("Role_Edit") as DropDownList;
                    foreach (var role in Enum.GetNames(typeof(RoleType)))
                    {
                        roleList.Items.Add(new ListItem(role, role));
                    }
                    roleList.DataBind();

                    var roleText = (e.Row.DataItem as UserInfo).Role;
                    roleList.Items.FindByValue(roleText).Selected = true;
                }
            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {
                DropDownList roleList = e.Row.FindControl("Role_Footer") as DropDownList;
                foreach (var role in Enum.GetNames(typeof(RoleType)))
                {
                    roleList.Items.Add(new ListItem(role, role));
                }
                roleList.DataBind();
            }
        }

        protected void ManageUsersGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            ManageUsersGridView.EditIndex = e.NewEditIndex;
            LoadData();
        }

        protected void ManageUsersGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                var id = (ManageUsersGridView.Rows[e.RowIndex].FindControl("Id_Item") as Label).Text;
                var username = (ManageUsersGridView.Rows[e.RowIndex].FindControl("Username_Edit") as TextBox).Text;
                var fullName = (ManageUsersGridView.Rows[e.RowIndex].FindControl("FullName_Edit") as TextBox).Text;
                var phoneNumber = (ManageUsersGridView.Rows[e.RowIndex].FindControl("PhoneNumber_Edit") as TextBox).Text;
                var address = (ManageUsersGridView.Rows[e.RowIndex].FindControl("Address_Edit") as TextBox).Text;
                var email = (ManageUsersGridView.Rows[e.RowIndex].FindControl("Email_Edit") as TextBox).Text;
                var password = (ManageUsersGridView.Rows[e.RowIndex].FindControl("Password_Edit") as TextBox).Text;
                var role = (ManageUsersGridView.Rows[e.RowIndex].FindControl("Role_Edit") as DropDownList).SelectedValue;
                var result = userRepository.UpdateUserInfo(id, username, fullName, phoneNumber, address, email, password, role);
                if (!result.Succeeded)
                {
                    throw new Exception("Cannot Update User Info");
                }
                ManageUsersGridView.EditIndex = -1;
                LoadData();
            }
            catch (Exception ex)
            {
                ErrorMessage.Text = ex.Message;
            }
        }

        protected void ManageUsersGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            ManageUsersGridView.EditIndex = -1;
            LoadData();
        }

        protected void ManageUsersGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("AddNew"))
            {
                try
                {
                    var username = (ManageUsersGridView.FooterRow.FindControl("Username_Footer") as TextBox).Text;
                    var fullName = (ManageUsersGridView.FooterRow.FindControl("FullName_Footer") as TextBox).Text;
                    var phoneNumber = (ManageUsersGridView.FooterRow.FindControl("PhoneNumber_Footer") as TextBox).Text;
                    var address = (ManageUsersGridView.FooterRow.FindControl("Address_Footer") as TextBox).Text;
                    var email = (ManageUsersGridView.FooterRow.FindControl("Email_Footer") as TextBox).Text;
                    var password = (ManageUsersGridView.FooterRow.FindControl("Password_Footer") as TextBox).Text;
                    var role = (ManageUsersGridView.FooterRow.FindControl("Role_Footer") as DropDownList).SelectedValue;

                    var result = userRepository.CreateUser(username, fullName, phoneNumber, address, email, password, role);
                    if (!result.Succeeded)
                    {
                        throw new Exception("Cannot Add New User");
                    }
                    LoadData();
                }
                catch (Exception ex)
                {
                    ErrorMessage.Text = ex.Message;
                }
            }
        }
    }
}