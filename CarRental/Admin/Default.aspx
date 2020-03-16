<%@ Page Title="Admin" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CarRental.Admin.Default" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Welcome, <%: Title %>. Choose the function from the list below</h2>
    <hr />
    <div class="btn-group-vertical center-block">
        <asp:LinkButton runat="server" Text="Manage User" CssClass="btn btn-primary btn-lg" PostBackUrl="~/Admin/ManageUsers.aspx"/>
        <asp:LinkButton runat="server" Text="Manage Car Inventory" CssClass="btn btn-primary btn-lg" PostBackUrl="~/Admin/ManageCarInventory.aspx"/>
        <asp:LinkButton runat="server" Text="Manage Bookings" CssClass="btn btn-primary btn-lg" PostBackUrl="~/Admin/ManageBookings.aspx"/>
    </div>
</asp:Content>
