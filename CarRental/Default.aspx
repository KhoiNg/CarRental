<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CarRental._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <h1 class="text-center">
        Welcome to the Car Rental Application
    </h1>
     <asp:Button ID="Cheat" runat="server" onclick="Cheat_Button" Text="Cheat" /> 
</asp:Content>
