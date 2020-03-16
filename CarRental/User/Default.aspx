<%@ Page Title="User" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CarRental.User.Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Welcome, <%: Title %>. Choose the function from the list below</h2>
    <hr />
    <div class="btn-group-vertical center-block">
        <asp:LinkButton runat="server" Text="View and Book Cars" CssClass="btn btn-primary btn-lg" PostBackUrl="~/User/ViewAndBookCars.aspx"/>
        <asp:LinkButton runat="server" Text="Manage Bookings" CssClass="btn btn-primary btn-lg" PostBackUrl="~/User/ManageBookings.aspx"/>
    </div>

</asp:Content>
