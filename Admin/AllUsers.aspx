<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AllUsers.aspx.cs" Inherits="Craftglow.Admin.AllUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row m-2 d-flex justify-content-center">
        <div class="col-sm-12 col-xl-10">
            <div class="bg-light rounded h-100 p-4">
                <h6 class="mb-4">Users List</h6>
                <asp:GridView ID="users_grid" CssClass="userslist" runat="server" AllowPaging="True" AutoGenerateColumns="False" HeaderStyle-CssClass="category_header" RowStyle-CssClass="category_row" DataKeyNames="userid">
                    <Columns>
                        <asp:BoundField DataField="userid" HeaderText="User ID"></asp:BoundField>
                        <asp:BoundField DataField="name" HeaderText="Name"></asp:BoundField>
                        <asp:BoundField DataField="email" HeaderText="Email"></asp:BoundField>
                        <asp:BoundField DataField="dnt" HeaderText="Created at"></asp:BoundField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
