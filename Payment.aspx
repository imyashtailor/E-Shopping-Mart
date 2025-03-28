<%@ Page Title="" Language="C#" MasterPageFile="~/UserSite1.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="E_shopping_Website.Payment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:HiddenField ID="hdCartAmount" runat="server" />
    <asp:HiddenField ID="hdCartDiscount" runat="server" />
    <asp:HiddenField ID="hdTotalPayed" runat="server" />
    <asp:HiddenField ID="hdPidSizeId" runat="server" />

    <br />
    <br />

    <div class="row" style="padding-top:20px;">
        <div class="col-md-9">
            <div class="form-horizontal">
                <br />
                <h3>Delivery Address</h3>
                <hr />
                <div class="form-group">
                    <asp:Label ID="Label1" runat="server" CssClass="control-label" Text="Name"></asp:Label>
                    <asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtName"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label2" runat="server" CssClass="control-label" Text="Address"></asp:Label>
                    <asp:TextBox ID="txtAddress" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtAddress"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label3" runat="server" CssClass="control-label" Text="Pin Code"></asp:Label>
                    <asp:TextBox ID="txtPinCode" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtPinCode"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label4" runat="server" CssClass="control-label" Text="Mobile Number"></asp:Label>
                    <asp:TextBox ID="txtMobileNumber" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtMobileNumber"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <asp:Button ID="btnCheckout" CssClass="buyNowbtn" runat="server" Text="Place Order" OnClick="btnCheckout_Click" />
                </div>
                <!-- Label to display success message -->
                <asp:Label ID="lblOrderStatus" runat="server" CssClass="text-success" Visible="false"></asp:Label>
            </div>
        </div>

        <div class="col-md-3" runat="server" id="divPriceDetails">
            <div style="border-bottom:1px solid #eaeaec;">
                <h5 class="proNameViewCart">Price Details</h5>
                <div>
                    <label>Cart Total:</label>
                    <span id="spanCartTotal" class="float-right priceGray" runat="server"></span>
                </div>
                <div>
                    <label>Cart Discount:</label>
                    <span id="spanDiscount" class="float-right priceGreen" runat="server"></span>
                </div>
            </div>

            <div>
                <div class="proPriceView">
                    <label>Total:</label>
                    <span id="spanTotal" class="float-right" runat="server"></span>
                </div>
            </div>
        </div>

        <div class="col-md-12">
            <h3>Choose Payment Mode</h3>
            <hr />
            <ul class="nav nav-tabs">
                <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#wallets">WALLETS</a></li>
                <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#cards">CREDIT/DEBIT CARDS</a></li>
                <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#cod">CASH ON DELIVERY</a></li>
            </ul>
            <div class="tab-content">
                <div id="wallets" class="tab-pane fade show active">
                    <h3>HOME</h3>
                    <p>Some content.</p>
                    <asp:Button ID="btnPaytm" OnClick="btnPaytm_Click" runat="server" Text="Pay With Paytm" />
                </div>

                <div id="cards" class="tab-pane fade">
                    <h3>Debit Card</h3>
                    <p>Debit card Content here.</p>
                </div>

                <div id="cod" class="tab-pane fade">
                    <h3>Credit Card</h3>
                    <p>Credit Card Payment here.</p>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
