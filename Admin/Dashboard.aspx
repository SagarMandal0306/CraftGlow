<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Craftglow.Admin.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
            <div class="container-fluid pt-4 px-4">
                <div class="row g-4">
                    <div class="col-sm-6 col-xl-3">
                        <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa fa-users fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">Total Users</p>
                                <h6 class="mb-0" runat="server" id="NoOfUsers"></h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-xl-3">
                        <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fab fa-blackberry fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">Total Orders</p>
                                <h6 class="mb-0" runat="server" id="NoOfOrders"></h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-xl-3">
                        <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa fa-th fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">Total Products</p>
                                <h6 class="mb-0" runat="server" id="TotalProducts" ></h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-xl-3">
                        <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fas fa-list fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">Total Category</p>
                                <h6 class="mb-0" runat="server" id="TotalCategory"></h6>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

</asp:Content>
