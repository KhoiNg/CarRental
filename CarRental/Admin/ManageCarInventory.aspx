<%@ Page Title="Manage Car Inventory" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageCarInventory.aspx.cs" Inherits="CarRental.Admin.ManageCarInventory" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:LinkButton runat="server" Text="Back" CssClass="btn btn-primary btn-lg marginTopSmall" PostBackUrl="~/Admin/Default.aspx" CausesValidation="false" />
    <hr />
    <h2><%: Title %>.</h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <asp:GridView ID="CarInventoryGridView" runat="server" CellPadding="4" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" ShowFooter="True" EmptyDataText="No Record found"
        OnRowDataBound="CarInventoryGridView_RowDataBound" CssClass="table table-hover table-bordered marginTopBig"
        OnRowEditing="CarInventoryGridView_RowEditing" OnRowUpdating="CarInventoryGridView_RowUpdating" OnRowCancelingEdit="CarInventoryGridView_RowCancelingEdit"
        OnRowDeleting="CarInventoryGridView_RowDeleting" OnRowCommand="CarInventoryGridView_RowCommand" ForeColor="#333333" GridLines="None">
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />

        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />

        <Columns>
            <asp:TemplateField HeaderText="Id">
                <ItemTemplate>
                    <asp:Label runat="server" ID="Id_Item" Text='<%#Bind("CarId") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Make">
                <ItemTemplate>
                    <asp:Label runat="server" ID="Make_Item" Text='<%#Bind("Make") %>' />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox runat="server" ID="Make_Edit" Text='<%#Bind("Make") %>' CssClass="form-control" />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox runat="server" ID="Make_Footer" CssClass="form-control" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Model">
                <ItemTemplate>
                    <asp:Label runat="server" ID="Model_Item" Text='<%#Bind("Model") %>' />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox runat="server" ID="Model_Edit" Text='<%#Bind("Model") %>' CssClass="form-control" />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox runat="server" ID="Model_Footer" CssClass="form-control" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Year">
                <ItemTemplate>
                    <asp:Label runat="server" ID="Year_Item" Text='<%#Bind("Year") %>' />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox runat="server" ID="Year_Edit" Text='<%#Bind("Year") %>' type="number" CssClass="form-control" />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox runat="server" ID="Year_Footer" type="number" CssClass="form-control" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Color">
                <ItemTemplate>
                    <asp:Label runat="server" ID="Color_Item" Text='<%#Bind("Color") %>' />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox runat="server" ID="Color_Edit" Text='<%#Bind("Color") %>' CssClass="form-control" />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox runat="server" ID="Color_Footer" CssClass="form-control" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="VIN">
                <ItemTemplate>
                    <asp:Label runat="server" ID="VIN_Item" Text='<%#Bind("VIN") %>' />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox runat="server" ID="VIN_Edit" Text='<%#Bind("VIN") %>' CssClass="form-control" />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox runat="server" ID="VIN_Footer" CssClass="form-control" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Mileage">
                <ItemTemplate>
                    <asp:Label runat="server" ID="Mileage_Item" Text='<%#Bind("Mileage") %>' />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox runat="server" ID="Mileage_Edit" Text='<%#Bind("Mileage") %>' type="number" CssClass="form-control" />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox runat="server" ID="Mileage_Footer" type="number" CssClass="form-control" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Type" ItemStyle-Width="100px">
                <ItemTemplate>
                    <asp:Label runat="server" ID="Type_Item" Text='<%#Bind("Type") %>' />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList runat="server" ID="Type_Edit" AppendDataBoundItems="true" CssClass="form-control" />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:DropDownList runat="server" ID="Type_Footer" CssClass="form-control" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Price">
                <ItemTemplate>
                    <asp:Label runat="server" ID="Price_Item" Text='<%#Bind("Price") %>' />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox runat="server" ID="Price_Edit" Text='<%#Bind("Price") %>' CssClass="form-control" />
                    <asp:RegularExpressionValidator runat="server" ValidationExpression="^[1-9]\d*(\.\d+)?$"
                        ErrorMessage="Decimal only" ControlToValidate="Price_Edit" />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox runat="server" ID="Price_Footer" CssClass="form-control" />
                    <asp:RegularExpressionValidator runat="server" ValidationExpression="^[1-9]\d*(\.\d+)?$"
                        ErrorMessage="Decimal only" ControlToValidate="Price_Footer" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Available">
                <ItemTemplate>
                    <asp:Label runat="server" ID="IsAvailable_Item" Text='<%#Bind("IsAvailable") %>' />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:CheckBox runat="server" ID="IsAvailable_Edit" Checked='<%#Bind("IsAvailable") %>' />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:CheckBox runat="server" ID="IsAvailable_Footer" Checked="true" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button runat="server" Text="Edit" CommandName="Edit" CssClass="btn btn-primary btn-sm" CausesValidation="false" />
                    <asp:Button runat="server" Text="Delete" CommandName="Delete" CssClass="btn btn-primary btn-sm" CausesValidation="false" />
                    <asp:Button runat="server" Text="Calendar" CommandName="ViewCalendar" CssClass="btn btn-primary btn-sm" CausesValidation="false" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Button runat="server" Text="Update" CommandName="Update" CssClass="btn btn-primary btn-sm" />
                    <asp:Button runat="server" Text="Cancel" CommandName="Cancel" CssClass="btn btn-primary btn-sm" CausesValidation="false" />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:Button runat="server" Text="Add New" CommandName="AddNew" CssClass="btn btn-primary btn-sm" />
                </FooterTemplate>
            </asp:TemplateField>

        </Columns>
    </asp:GridView>

</asp:Content>
