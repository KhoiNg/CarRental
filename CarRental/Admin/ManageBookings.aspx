<%@ Page Title="Manage Booking" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageBookings.aspx.cs" Inherits="CarRental.Admin.ManageBookings" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:LinkButton runat="server" Text="Back" CssClass="btn btn-primary btn-lg marginTopSmall" PostBackUrl="~/Admin/Default.aspx" CausesValidation="false" />
    <hr />
    <h2><%: Title %>.</h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <asp:GridView ID="ManageBookingGridView" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="table table-hover table-bordered marginTopBig"
        AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" EmptyDataText="No Record found"
        OnRowDataBound="ManageBookingGridView_RowDataBound"
        OnRowEditing="ManageBookingGridView_RowEditing" OnRowUpdating="ManageBookingGridView_RowUpdating" OnRowCancelingEdit="ManageBookingGridView_RowCancelingEdit">
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
            <asp:TemplateField HeaderText="Id">
                <ItemTemplate>
                    <asp:Label runat="server" ID="Id_Item" Text='<%#Bind("BookingId") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Start Date">
                <ItemTemplate>
                    <asp:Label runat="server" ID="Make_Item" Text='<%#Bind("StartDate") %>' />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="StartDate_Edit" runat="server" TextMode="DateTimeLocal" CssClass="form-control" />
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="End Date">
                <ItemTemplate>
                    <asp:Label runat="server" ID="Model_Item" Text='<%#Bind("EndDate") %>' />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="EndDate_Edit" runat="server" TextMode="DateTimeLocal" Text='<%#Bind("EndDate") %>' CssClass="form-control" />
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Status">
                <ItemTemplate>
                    <asp:Label runat="server" ID="Status_Item" Text='<%#Bind("Status") %>' />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList runat="server" ID="Status_Edit" AppendDataBoundItems="true" CssClass="form-control" />
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Cost">
                <ItemTemplate>
                    <asp:Label runat="server" ID="Cost_Item" Text='<%#Bind("Cost") %>' />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox runat="server" ID="Cost_Edit" Text='<%#Bind("Cost") %>' CssClass="form-control" />
                    <asp:RegularExpressionValidator runat="server" ValidationExpression="^[1-9]\d*(\.\d+)?$"
                        ErrorMessage="Decimal only" ControlToValidate="Cost_Edit" />
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Car Id">
                <ItemTemplate>
                    <asp:Label runat="server" ID="CarId_Item" Text='<%#Bind("CarId") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Full Name">
                <ItemTemplate>
                    <asp:Label runat="server" ID="FullName_Item" Text='<%#Bind("FullName") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button runat="server" Text="Edit" CommandName="Edit" CausesValidation="false"
                        Enabled='<%# IsEditable(Eval("Status").ToString()) %>' CssClass="btn btn-primary btn-sm" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Button runat="server" Text="Update" CommandName="Update" CssClass="btn btn-primary btn-sm" />
                    <asp:Button runat="server" Text="Cancel" CommandName="Cancel" CausesValidation="false" CssClass="btn btn-primary btn-sm" />
                </EditItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

</asp:Content>
