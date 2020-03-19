<%@ Page Title="Manage Users" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageUsers.aspx.cs" Inherits="CarRental.Admin.ManageUsers" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:LinkButton runat="server" Text="Back" CssClass="btn btn-primary btn-lg marginTopSmall" PostBackUrl="~/Admin/Default.aspx" />
    <hr />
    <h2><%: Title %>.</h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <asp:GridView ID="ManageUsersGridView" runat="server" CellPadding="4" CssClass="table table-hover table-bordered marginTopBig"
        AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" ShowFooter="True" EmptyDataText="No Record found"
        OnRowDataBound="ManageUsersGridView_RowDataBound"
        OnRowEditing="ManageUsersGridView_RowEditing" OnRowUpdating="ManageUsersGridView_RowUpdating" OnRowCancelingEdit="ManageUsersGridView_RowCancelingEdit"
        OnRowDeleting="ManageUsersGridView_RowDeleting" OnRowCommand="ManageUsersGridView_RowCommand" ForeColor="#333333" GridLines="None">
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle ForeColor="#333333" BackColor="#F7F6F3" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />

        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />

        <Columns>
            <asp:TemplateField Visible="false">
                <ItemTemplate>
                    <asp:Label runat="server" ID="Id_Item" Text='<%#Bind("Id") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="User Name">
                <ItemTemplate>
                    <asp:Label runat="server" ID="Username_Item" Text='<%#Bind("Username") %>' />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox runat="server" ID="Username_Edit" Text='<%#Bind("Username") %>' CssClass="form-control" />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox runat="server" ID="Username_Footer" CssClass="form-control" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Email">
                <ItemTemplate>
                    <asp:Label runat="server" ID="Email_Item" Text='<%#Bind("Email") %>' />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox runat="server" ID="Email_Edit" Text='<%#Bind("Email") %>' type="Email" CssClass="form-control" />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox runat="server" ID="Email_Footer" type="Email" CssClass="form-control" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Password">
                <EditItemTemplate>
                    <asp:TextBox runat="server" ID="Password_Edit" Text="" CssClass="form-control" />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox runat="server" ID="Password_Footer" CssClass="form-control" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Role">
                <ItemTemplate>
                    <asp:Label runat="server" ID="Role_Item" Text='<%#Bind("Role") %>' />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="Role_Edit" runat="server" AppendDataBoundItems="true" CssClass="form-control" />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:DropDownList ID="Role_Footer" runat="server" CssClass="form-control" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button runat="server" Text="Edit" CommandName="Edit" CssClass="btn btn-primary btn-sm" />
                    <asp:Button runat="server" Text="Delete" CommandName="Delete" CssClass="btn btn-primary btn-sm" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Button runat="server" Text="Update" CommandName="Update" CssClass="btn btn-primary btn-sm" />
                    <asp:Button runat="server" Text="Cancel" CommandName="Cancel" CssClass="btn btn-primary btn-sm" />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:Button runat="server" Text="Add New" CommandName="AddNew" CssClass="btn btn-primary btn-sm" />
                </FooterTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>


</asp:Content>
