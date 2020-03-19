<%@ Page Title="Booking A Car" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewAndBookCars.aspx.cs" Inherits="CarRental.User.ViewAndBookCars" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:LinkButton runat="server" Text="Back" CssClass="btn btn-primary btn-lg marginTopSmall" PostBackUrl="~/User/Default.aspx" />
    <hr />
    <h2><%: Title %>.</h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div class="well marginTopSmall">
        <h3 class="marginTopSmall">Filter </h3>
        <div class="row">
            <div class="form-group col-sm-3">
                <h4>Start Date</h4>
                <asp:TextBox ID="StartDateFilter" runat="server" TextMode="DateTimeLocal" CssClass="form-control" />
            </div>
            <div class="form-group col-sm-3">
                <h4>End Date</h4>
                <asp:TextBox ID="EndDateFilter" runat="server" TextMode="DateTimeLocal" CssClass="form-control" />
            </div>
            <div class="form-group col-sm-3">
                <h4>Type</h4>
                <asp:DropDownList ID="TypeFilter" runat="server" CssClass="form-control">
                    <asp:ListItem Text="" Value="" />
                </asp:DropDownList>
            </div>
            <div class="form-group col-sm-3">
                <h4>Price</h4>
                <asp:DropDownList ID="PriceFilter" runat="server" CssClass="form-control">
                    <asp:ListItem Text="" Value="" />
                    <asp:ListItem Text="Increasing" Value="Increasing" />
                    <asp:ListItem Text="Decreasing" Value="Decreasing" />
                </asp:DropDownList>
            </div>
        </div>
        <asp:Button ID="FilterButton" runat="server" Text="Search" OnClick="FilterButton_Click" CssClass="btn btn-primary btn-lg " />
        <h4 class="marginTopBig">Note: You can only book a car more than 6 hours and less than 30 days away from current time. In addition,
            the maximum days that any car can be booked is 7 days.
        </h4>
    </div>

    <asp:GridView ID="CarGridView" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None"
        AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" EmptyDataText="No Record found"
        OnRowCommand="CarGridView_RowCommand" CssClass="table table-hover table-bordered marginTopBig">
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
                    <asp:Label runat="server" ID="Id_Item" Text='<%#Bind("CarId") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Make">
                <ItemTemplate>
                    <asp:Label runat="server" ID="Make_Item" Text='<%#Bind("Make") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Model">
                <ItemTemplate>
                    <asp:Label runat="server" ID="Model_Item" Text='<%#Bind("Model") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Year">
                <ItemTemplate>
                    <asp:Label runat="server" ID="Year_Item" Text='<%#Bind("Year") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Color">
                <ItemTemplate>
                    <asp:Label runat="server" ID="Color_Item" Text='<%#Bind("Color") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Type">
                <ItemTemplate>
                    <asp:Label runat="server" ID="Type_Item" Text='<%#Bind("Type") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Price">
                <ItemTemplate>
                    <asp:Label runat="server" ID="Price_Item" Text='<%#Bind("Price") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button runat="server" Text="Book" CommandName="Book" CssClass="btn btn-primary btn-sm"
                        OnClientClick="return confirm('Are you sure you want to book?'); " />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
