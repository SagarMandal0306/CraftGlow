<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="Craftglow.Admin.AddProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2"  ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   

        <div class="row m-2 d-flex justify-content-center">
          <div class="col-sm-12 col-xl-9">
             <div class="bg-light rounded h-100 p-4">
                 <h6 class="mb-4">Product Form</h6>
                 <div>
                     <asp:Label ID="product_error" CssClass="text-danger error"  runat="server" Text=""></asp:Label>
                     <div class="mb-3">
                         <div class="mb-3">
                             <asp:HiddenField ID="HiddenID" runat="server"  />
                         <asp:TextBox ID="ProductName" PlaceHolder="Product Name" CssClass="form-control"  runat="server"></asp:TextBox>
                             </div>
                         <div class="mb-3">
                         <asp:TextBox ID="ProductDesc" PlaceHolder="Product Description" CssClass="form-control"  runat="server"></asp:TextBox>
                         </div>
                         <div class="mb-3">
                         <asp:TextBox ID="ProductKeyWords" PlaceHolder="Product Keywords" CssClass="form-control"  runat="server"></asp:TextBox>
                             </div> 
                         <div class="mb-3">
                         <asp:TextBox ID="ProductPrice" PlaceHolder="Product Price" CssClass="form-control"  runat="server"></asp:TextBox>
                             </div>
                         <div class="mb-3">
                             <asp:DropDownList ID="ProductCategory" runat="server"  CssClass="form-select mb-3"></asp:DropDownList>
                          </div>
                        <div class="mb-3 d-flex justify-content-center">
                            <asp:FileUpload ID="ProductImg" runat="server"  CssClass="form-control ProductImg" ClientIDMode="Static"/>
                            <asp:Image ID="SelectedProductImage" CssClass="SelectedProductImage" runat="server" ImageUrl="#"  AlternateText="Image not select"/>
                        </div> 
                         <%
                        if (Request.QueryString["action"] == "edit")
                        {
                        %>
                              <asp:Button ID="ProductUpdate" CssClass="btn btn-warning " runat="server" Text="Update Product" OnClick="ProductUpdate_Click" />
                         <%
                        }
                        else
                        {
                         %>
                             <asp:Button ID="ProductSubmit" CssClass="btn btn-primary" runat="server" Text="Add Product" OnClick="ProductSubmit_Click" />
                         <%
                        }
                         %>
                     </div>
                 </div>

             </div>
         </div>
     
     </div>

   
</asp:Content>
