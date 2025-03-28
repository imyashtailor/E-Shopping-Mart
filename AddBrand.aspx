<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite1.Master" AutoEventWireup="true" CodeBehind="AddBrand.aspx.cs" Inherits="E_shopping_Website.AddBrand" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<!--------BrandName Details---------->
    <div class="container">
        <div class="form-horizontal">
            <br /><br />
            <h2>Add Brand</h2>
            <hr />
            <div class="form-group">
                <asp:Label ID="Label1" CssClass="col-md-2 control-label" runat="server" Text="BrandName"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtBrand" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorBrandname" runat="server" CssClass="text-danger" ErrorMessage="Please Enter Brandname" ControlToValidate="txtBrand" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <div class="col-md-2"></div>
                <div class="col-md-6">
                    <asp:Button ID="btnAddBrand" CssClass="btn btn-success" runat="server" Text="Add Brand" OnClick="btnAddBrand_Click" />
                </div>
            </div>
        </div>
        <h1>Brands</h1>
        <hr />
        <div class="panel panel-default">
            <div class="panel-heading">All Brands</div>
            <asp:Repeater ID="rptrBrands" runat="server">
                <HeaderTemplate>
                    <table class="table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Brand</th>
                        <th>Edit</th>
                    </tr>
                </thead>

                <tbody>
                </HeaderTemplate>

                <ItemTemplate>
                    <tr>
                        <th> <%# Eval("BrandId") %> </th>
                        <td> <%# Eval("Name") %> </td>
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
<!--------BrandName Details End---------->

<!-----Footer content start---->

        <footer class="footer-pos">
            <div class="container">
                <p class="pull-right"><a href="#">Back to top</a></p>
                <p>&copy;2025 EShopping.in &middot; <a href="Default.aspx">Home</a>&middot;<a href="#">About</a>&middot;<a href="#">Contact</a>&middot; <a href="#">Products</a> </p>
            </div>
            </footer>
<!-----Footer Content end---->

</asp:Content>
