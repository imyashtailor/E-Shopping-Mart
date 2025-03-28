<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite1.Master" AutoEventWireup="true" CodeBehind="AddGender.aspx.cs" Inherits="E_shopping_Website.AddGender" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--------Add Gender Details---------->
    <div class="container">
        <div class="form-horizontal">
            <br /><br />
            <h2>Add Gender</h2>
            <hr />
            <div class="form-group">
                <asp:Label ID="Label1" CssClass="col-md-2 control-label" runat="server" Text="Gender"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtGender" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorGender" runat="server" CssClass="text-danger" ErrorMessage="Please Enter Gender" ControlToValidate="txtGender" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <div class="col-md-2"></div>
                <div class="col-md-6">
                    <asp:Button ID="btnAddGender" CssClass="btn btn-success" runat="server" Text="Add" OnClick="btnAddGender_Click" />
                </div>
            </div>
        </div>
        <h1>Gender</h1>
        <hr />
        <div class="panel panel-default">
            <div class="panel-heading">Genders</div>
            <asp:Repeater ID="rptrGender" runat="server">
                <HeaderTemplate>
                    <table class="table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Gender</th>
                        <%--<th>Gender Name</th>--%>
                        <th>Edit</th>
                    </tr>
                </thead>

                <tbody>
                </HeaderTemplate>

                <ItemTemplate>
                    <tr>
                        <th> <%# Eval("GenderId") %> </th>
                        <td> <%# Eval("GenderName") %> </td>
                        <%--<td> <%# Eval("CatName") %> </td>--%>
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
<!--------Add Gender Details End---------->

<!-----Footer content start---->

        <footer class="footer-pos">
            <div class="container">
                <p class="pull-right"><a href="#">Back to top</a></p>
                <p>&copy;2025 EShopping.in &middot; <a href="Default.aspx">Home</a>&middot;<a href="#">About</a>&middot;<a href="#">Contact</a>&middot; <a href="#">Products</a> </p>
            </div>
            </footer>
<!-----Footer Content end---->


</asp:Content>
