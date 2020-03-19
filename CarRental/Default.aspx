<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CarRental._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <h1 class="text-center">Welcome to the Car Rental Application
    </h1>
    <div class="text-center">
        <asp:Button ID="Cheat" runat="server" OnClick="Cheat_Button" Text="Cheat Button" CssClass="btn btn-default marginTopBig"/>
    </div>
</asp:Content>
