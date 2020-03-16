<%@ Page Title="Booking A Car" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewAndBookCars.aspx.cs" Inherits="CarRental.User.ViewAndBookCars" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:LinkButton runat="server" Text="Back" CssClass="btn btn-primary btn-lg" PostBackUrl="~/User/Default.aspx" />
    <hr />
    <h2><%: Title %>.</h2>
    <hr />
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>
    <div class="well">
        <h3>Filter </h3>
        <asp:TextBox ID="StartDateFilter" runat="server" TextMode="DateTimeLocal" />
        <asp:TextBox ID="EndDateFilter" runat="server" TextMode="DateTimeLocal" />
        <asp:DropDownList ID="TypeFilter" runat="server">
            <asp:ListItem Text="" Value="" />
        </asp:DropDownList>
        <asp:Button ID="FilterButton" runat="server" Text="Search" OnClick="FilterButton_Click" />
        <h5>You can only book a car more than 6 hours and less than 30 days from current time</h5>
    </div>

    <asp:GridView ID="CarGridView" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None"
        AutoGenerateColumns="false" ShowHeaderWhenEmpty="true" EmptyDataText="No Record found"
        OnRowCommand="CarGridView_RowCommand">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />

        <Columns>
            <asp:TemplateField Visible="false">
                <ItemTemplate>
                    <asp:Label runat="server" ID="Id_Item" Text='<%#Eval("CarId") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Make">
                <ItemTemplate>
                    <asp:Label runat="server" ID="Make_Item" Text='<%#Eval("Make") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Model">
                <ItemTemplate>
                    <asp:Label runat="server" ID="Model_Item" Text='<%#Eval("Model") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Year">
                <ItemTemplate>
                    <asp:Label runat="server" ID="Year_Item" Text='<%#Eval("Year") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Color">
                <ItemTemplate>
                    <asp:Label runat="server" ID="Color_Item" Text='<%#Eval("Color") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Type">
                <ItemTemplate>
                    <asp:Label runat="server" ID="Type_Item" Text='<%#Eval("Type") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Price">
                <ItemTemplate>
                    <asp:Label runat="server" ID="Price_Item" Text='<%#Eval("Price") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button runat="server" Text="Book" CommandName="Book" OnClientClick="return confirm('Are you sure you want to book?'); " />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
