<%@ Page Title="Manage Users" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageUsers.aspx.cs" Inherits="CarRental.Admin.ManageUsers" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:LinkButton runat="server" Text="Back" CssClass="btn btn-primary btn-lg" PostBackUrl="~/Admin/Default.aspx" />
    <hr />
    <h2><%: Title %>.</h2>

    <asp:GridView ID="ManageUsersGridView" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3"
        AutoGenerateColumns="False" ShowHeaderWhenEmpty="true" ShowFooter="true" EmptyDataText="No Record found"
        OnRowDataBound="ManageUsersGridView_RowDataBound"
        OnRowEditing="ManageUsersGridView_RowEditing" OnRowUpdating="ManageUsersGridView_RowUpdating" OnRowCancelingEdit="ManageUsersGridView_RowCancelingEdit"
        OnRowDeleting="ManageUsersGridView_RowDeleting" OnRowCommand="ManageUsersGridView_RowCommand">
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <RowStyle ForeColor="#000066" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />

        <Columns>
            <asp:TemplateField Visible="false">
                <ItemTemplate>
                    <asp:Label runat="server" ID="Id_Item" Text='<%#Eval("Id") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="User Name">
                <ItemTemplate>
                    <asp:Label runat="server" ID="Username_Item" Text='<%#Eval("Username") %>' />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox runat="server" ID="Username_Edit" Text='<%#Eval("Username") %>' />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox runat="server" ID="Username_Footer" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Email">
                <ItemTemplate>
                    <asp:Label runat="server" ID="Email_Item" Text='<%#Eval("Email") %>' />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox runat="server" ID="Email_Edit" Text='<%#Eval("Email") %>' type="Email" />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox runat="server" ID="Email_Footer" type="Email" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Password">
                <EditItemTemplate>
                    <asp:TextBox runat="server" ID="Password_Edit" Text="" />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox runat="server" ID="Password_Footer" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Role">
                <ItemTemplate>
                    <asp:Label runat="server" ID="Role_Item" Text='<%#Eval("Role") %>' />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="Role_Edit" runat="server" AppendDataBoundItems="true" />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:DropDownList ID="Role_Footer" runat="server" />
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
