<%@ Page Language="C#" MasterPageFile="~/MasterPages/ThreeColumn.master" AutoEventWireup="true"
    Inherits="NopSolutions.NopCommerce.Web.CheckoutConfirmPage" CodeBehind="CheckoutConfirm.aspx.cs"
     %>

<%@ Register Src="~/Modules/OrderProgress.ascx" TagName="OrderProgress" TagPrefix="nopCommerce" %>
<%@ Register TagPrefix="nopCommerce" TagName="CheckoutConfirm" Src="~/Modules/CheckoutConfirm.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="OrderSummary" Src="~/Modules/OrderSummary.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cph1" runat="Server"> <div class="rightCol">
      
      
      <div class="whiteboxBg">
    <div class="checkout-page">
        <%--<nopCommerce:OrderProgress ID="OrderProgressControl" runat="server" OrderProgressStep="Confirm" />--%>
        <div class="clear">
        </div>
        <div class="page-title">
            <h1><%=GetLocaleResourceString("Checkout.ConfirmYourOrder")%></h1>
        </div>
        <div class="clear">
        </div>
        <nopCommerce:CheckoutConfirm ID="ctrlCheckoutConfirm" runat="server" />
        <div class="clear">
        </div>
        <div class="order-summary-title">
            <%=GetLocaleResourceString("Checkout.OrderSummary")%>
        </div>
        <div class="clear">
        </div>
        <div class="order-summary-body">
            <nopCommerce:OrderSummary ID="OrderSummaryControl" runat="server" IsShoppingCart="false">
            </nopCommerce:OrderSummary>
        </div>
    </div></div></div>
</asp:Content>
