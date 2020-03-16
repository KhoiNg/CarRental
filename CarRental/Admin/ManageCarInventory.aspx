<%@ Page Title="Manage Car Inventory" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageCarInventory.aspx.cs" Inherits="CarRental.Admin.ManageCarInventory" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:LinkButton runat="server" Text="Back" CssClass="btn btn-primary btn-lg" PostBackUrl="~/Admin/Default.aspx" />
    <hr />
    <h2><%: Title %>.</h2>
    <asp:GridView ID="CarInventoryGridView" runat="server" CellPadding="4" AutoGenerateColumns="false"
        BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" ShowHeaderWhenEmpty="true" ShowFooter="true" EmptyDataText="No Record found"
        OnRowDataBound="CarInventoryGridView_RowDataBound"
        OnRowEditing="CarInventoryGridView_RowEditing" OnRowUpdating="CarInventoryGridView_RowUpdating" OnRowCancelingEdit="CarInventoryGridView_RowCancelingEdit"
        OnRowDeleting="CarInventoryGridView_RowDeleting" OnRowCommand="CarInventoryGridView_RowCommand">
        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#330099" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
        <SortedAscendingCellStyle BackColor="#FEFCEB" />
        <SortedAscendingHeaderStyle BackColor="#AF0101" />
        <SortedDescendingCellStyle BackColor="#F6F0C0" />
        <SortedDescendingHeaderStyle BackColor="#7E0000" />

        <Columns>
            <asp:TemplateField HeaderText="Id">
                <ItemTemplate>
                    <asp:Label runat="server" ID="Id_Item" Text='<%#Eval("CarId") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Make">
                <ItemTemplate>
                    <asp:Label runat="server" ID="Make_Item" Text='<%#Eval("Make") %>' />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox runat="server" ID="Make_Edit" Text='<%#Eval("Make") %>' />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox runat="server" ID="Make_Footer" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Model">
                <ItemTemplate>
                    <asp:Label runat="server" ID="Model_Item" Text='<%#Eval("Model") %>' />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox runat="server" ID="Model_Edit" Text='<%#Eval("Model") %>' />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox runat="server" ID="Model_Footer" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Year">
                <ItemTemplate>
                    <asp:Label runat="server" ID="Year_Item" Text='<%#Eval("Year") %>' />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox runat="server" ID="Year_Edit" Text='<%#Eval("Year") %>' type="number" />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox runat="server" ID="Year_Footer" type="number" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Color">
                <ItemTemplate>
                    <asp:Label runat="server" ID="Color_Item" Text='<%#Eval("Color") %>' />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox runat="server" ID="Color_Edit" Text='<%#Eval("Color") %>' />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox runat="server" ID="Color_Footer" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="VIN">
                <ItemTemplate>
                    <asp:Label runat="server" ID="VIN_Item" Text='<%#Eval("VIN") %>' />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox runat="server" ID="VIN_Edit" Text='<%#Eval("VIN") %>' />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox runat="server" ID="VIN_Footer" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Mileage">
                <ItemTemplate>
                    <asp:Label runat="server" ID="Mileage_Item" Text='<%#Eval("Mileage") %>' />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox runat="server" ID="Mileage_Edit" Text='<%#Eval("Mileage") %>' type="number" />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox runat="server" ID="Mileage_Footer" type="number" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Type">
                <ItemTemplate>
                    <asp:Label runat="server" ID="Type_Item" Text='<%#Eval("Type") %>' />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList runat="server" ID="Type_Edit" AppendDataBoundItems="true" />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:DropDownList runat="server" ID="Type_Footer" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Price">
                <ItemTemplate>
                    <asp:Label runat="server" ID="Price_Item" Text='<%#Eval("Price") %>' />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox runat="server" ID="Price_Edit" Text='<%#Eval("Price") %>' />
                    <asp:RegularExpressionValidator runat="server" ValidationExpression="((\d+)+(\.\d+))$"
                        ErrorMessage="Decimal only" ControlToValidate="Price_Edit" Display="Dynamic" />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox runat="server" ID="Price_Footer" />
                    <asp:RegularExpressionValidator runat="server" ValidationExpression="((\d+)+(\.\d+))$"
                        ErrorMessage="Decimal only" ControlToValidate="Price_Footer" Display="Dynamic" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Available">
                <ItemTemplate>
                    <asp:Label runat="server" ID="IsAvailable_Item" Text='<%#Eval("IsAvailable") %>' />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:CheckBox runat="server" ID="IsAvailable_Edit" Checked='<%#Eval("IsAvailable") %>' />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:CheckBox runat="server" ID="IsAvailable_Footer" Checked="true" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button runat="server" Text="Edit" CommandName="Edit" />
                    <asp:Button runat="server" Text="Delete" CommandName="Delete" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Button runat="server" Text="Update" CommandName="Update" />
                    <asp:Button runat="server" Text="Cancel" CommandName="Cancel" />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:Button runat="server" Text="Add New" CommandName="AddNew" />
                </FooterTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>
</asp:Content>
