<%@ Page Title="" Language="C#" MasterPageFile="~/UserSite1.Master" AutoEventWireup="true" CodeBehind="AddCart.aspx.cs" Inherits="E_shopping_Website.AddCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
<div style="padding-top:50px;">

    <div class="col-md-9">
        <h4 class="proNameViewCart" runat="server" id="h4Noitems"> </h4>
        <asp:Repeater ID="rptrcartproducts" runat="server">
            <ItemTemplate>
       <%-- show cart details start--%>
        <div class="media" style="border:1px solid black;">
            <div class="media-left">
                <a href="ProductView.aspx?PID=<%# Eval("PID") %>" target="_blank">
                    <img class="media-object" width="100px" src="Images/ProductImages/inside images/<%# Eval("PID") %>/<%# Eval("Name") %><%# Eval("Extension") %>" alt="<%# Eval("Name") %>" onerror="this.src='Images/ProductImages/inside images/nothing.jpg'"/>
                </a>
            </div>

            <div class="media-body">
                <h4 class="media-heading proNameViewCart"><%# Eval("PName") %></h4>
                <p class="proPriceDiscountView"><%# Eval("SizeNamee") %></p>
                <span class="proPriceView"><%#Eval("PSellPrice","{0:c}") %></span>
                <span class="proOgPriceView"><%#Eval("PPrice","{0:c}") %></span>
                <p>
                   <asp:Button ID="btnRemoveCart" CssClass="RemoveButton1" runat="server" Text="Remove" />
                </p>
            </div>
        </div>
                </ItemTemplate>
            </asp:Repeater>
       <%-- show cart details ending--%>
    </div>

    <div class="col-md-3 pt-5" runat="server" id="divpricedetails">
            <div style="border-bottom: 1px solid #eaeaec;">

        <%---------------------------------%>
        <div>
            <h5>Price Details</h5>

            <div>
                <label>Cart Total</label>
                <span id="spanCartTotal" class="pull-right priceGray" runat="server"> </span>
            </div>

            <div>
                <label>Cart Discount</label>
                <span id="spanDiscount" class="pull-right priceGreen" runat="server"> </span>
            </div>
        </div>

        <%---------------------------------%>

        <div>
            <div class="proPriceView">
                <label>Cart Total</label>
                <span id="spanTotal" class="pull-right" runat="server"> </span>
            </div>

            <div>
                <asp:Button ID="btnBuy" CssClass="buyNowbtn" runat="server" Text="Buy Now" OnClick="btnBuy_Click"/>
            </div>

        </div>

    </div>
</div>
</asp:Content>
