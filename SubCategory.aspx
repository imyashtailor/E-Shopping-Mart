<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite1.Master" AutoEventWireup="true" CodeBehind="SubCategory.aspx.cs" Inherits="E_shopping_Website.SubCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--------Add SubCategory Name Details---------->
    <div class="container">
        <div class="form-horizontal">
            <br /><br />
            <h2>Add SubCategory</h2>
            <hr />
            <div class="form-group">
                <asp:Label ID="Label2" CssClass="col-md-2 control-label" runat="server" Text="Main CategoryID"></asp:Label>
                <div class="col-md-3">
                    <asp:DropDownList ID="ddlMainCatID" CssClass="form-control" runat="server"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorMainCatID" runat="server" CssClass="text-danger" ErrorMessage="Please Enter Main CategoryID" ControlToValidate="ddlMainCatID" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>


            <div class="form-group">
                <asp:Label ID="Label1" CssClass="col-md-2 control-label" runat="server" Text="SubCategory Name"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtSubCategory" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorSubCategoryName" runat="server" CssClass="text-danger" ErrorMessage="Please Enter SubCategory" ControlToValidate="txtSubCategory" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <div class="col-md-2"></div>
                <div class="col-md-6">
                    <asp:Button ID="btnAddSubCategory" CssClass="btn btn-success" runat="server" Text="Add SubCategory" OnClick="btnAddSubCategory_Click"   />
                </div>
            </div>
        </div>
        <h1>Sub Categories</h1>
        <hr />
        <div class="panel panel-default">
            <div class="panel-heading">All SubCategories Brands</div>
            <asp:Repeater ID="rptrSubCategory" runat="server">
                <HeaderTemplate>
                    <table class="table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Sub Category</th>
                        <th>Main Category</th>
                        <th>Edit</th>
                    </tr>
                </thead>

                <tbody>
                </HeaderTemplate>

                <ItemTemplate>
                    <tr>
                        <th> <%# Eval("SubCatId") %> </th>
                        <td> <%# Eval("SubCatName") %> </td>
                        <td> <%# Eval("CatName") %> </td>
                        <td>Edit</td>
                    </tr>
                </ItemTemplate>

                <FooterTemplate>
                     </tbody>
                   </table>
                </FooterTemplate>

            </asp:Repeater>
        </div>

    </div>
<!--------Add SubCategory Name Details End---------->
<!-----Footer content start---->
        <footer class="footer-pos">
            <div class="container">
                <p class="pull-right"><a href="#">Back to top</a></p>
                <p>&copy;2025 EShopping.in &middot; <a href="Default.aspx">Home</a>&middot;<a href="#">About</a>&middot;<a href="#">Contact</a>&middot; <a href="#">Products</a> </p>
            </div>
            </footer>
<!-----Footer Content end---->

</asp:Content>
