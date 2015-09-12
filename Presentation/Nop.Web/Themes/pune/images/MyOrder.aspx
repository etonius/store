<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyOrder.aspx.cs" Inherits="NopSolutions.NopCommerce.Web.MyOrder" %>

<%@ Register TagPrefix="nopCommerce" TagName="GoogleCheckoutButton" Src="~/Modules/GoogleCheckoutButton.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="OrderTotals" Src="~/Modules/OrderTotals.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="CheckoutAttributes" Src="~/Modules/CheckoutAttributes.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="EstimateShipping" Src="~/Modules/EstimateShipping.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductBox1" Src="~/Modules/ProductBox1.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="App_Themes/Store/styles.css" rel="stylesheet" type="text/css" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager runat="server" ID="ScriptManager1">
    </asp:ScriptManager>
    <div class="rightCol">
        <div class="whiteboxBg">
            <h1>
                My Shopping Cart</h1>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="orderTable">
                        <asp:Panel class="order-summary-content" runat="server" ID="pnlCart">
                            <asp:Panel runat="server" ID="pnlCommonWarnings" CssClass="warning-box" EnableViewState="false"
                                Visible="false">
                                <asp:Label runat="server" ID="lblCommonWarning" CssClass="warning-text" EnableViewState="false"
                                    Visible="false"></asp:Label>
                            </asp:Panel>
                            <table width="699" border="0" cellspacing="0" cellpadding="0">
                                <colgroup>
                                    <col width="1" />
                                    <%if (this.SettingManager.GetSettingValueBoolean("Display.Products.ShowSKU"))
                                      {%>
                                    <col width="1" />
                                    <%} %>
                                    <%if (this.SettingManager.GetSettingValueBoolean("Display.ShowProductImagesOnShoppingCart"))
                                      {%>
                                    <col width="1" />
                                    <%} %>
                                    <col />
                                    <col width="1" />
                                    <col width="1" />
                                    <col width="1" />
                                    <thead>
                                        <tr class="orangeStrip">
                                            <%if (this.SettingManager.GetSettingValueBoolean("Display.Products.ShowSKU"))
                                              {%>
                                            <th>
                                                <%=GetLocaleResourceString("ShoppingCart.SKU")%>
                                            </th>
                                            <%} %>
                                            <%if (this.SettingManager.GetSettingValueBoolean("Display.ShowProductImagesOnShoppingCart"))
                                              {%>
                                            <th class="picture">
                                            </th>
                                            <%} %>
                                            <th>
                                                <%=GetLocaleResourceString("ShoppingCart.Product(s)")%>
                                            </th>
                                            <th>
                                                <%=GetLocaleResourceString("ShoppingCart.Quantity")%>
                                            </th>
                                            <th>
                                                <%=GetLocaleResourceString("ShoppingCart.UnitPrice")%>
                                            </th>
                                            <th class="end">
                                                <%=GetLocaleResourceString("ShoppingCart.ItemTotal")%>
                                            </th>
                                            <th>
                                                <%=GetLocaleResourceString("ShoppingCart.Remove")%>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="rptShoppingCart" runat="server" OnItemCommand="rptShoppingCart_ItemCommand">
                                            <ItemTemplate>
                                                <tr class="cart-item-row">
                                                    <%if (this.SettingManager.GetSettingValueBoolean("Display.Products.ShowSKU"))
                                                      {%>
                                                    <td style="white-space: nowrap;">
                                                        <%#Server.HtmlEncode(((ShoppingCartItem)Container.DataItem).ProductVariant.SKU)%>
                                                    </td>
                                                    <%} %>
                                                    <%if (this.SettingManager.GetSettingValueBoolean("Display.ShowProductImagesOnShoppingCart"))
                                                      {%>
                                                    <td class="productpicture">
                                                        <asp:Image ID="iProductVariantPicture" runat="server" AlternateText="Product picture"
                                                            ImageUrl="<%#GetProductVariantImageUrl((ShoppingCartItem)Container.DataItem)%>" />
                                                    </td>
                                                    <%} %>
                                                    <td class="product">
                                                        <a href="javascript:ShowProductDetails('<%#GetProductUrl((ShoppingCartItem)Container.DataItem)%>')"
                                                            title="View details">
                                                            <%#Server.HtmlEncode(GetProductVariantName((ShoppingCartItem)Container.DataItem))%>
                                                        </a>
                                                        <%#GetAttributeDescription((ShoppingCartItem)Container.DataItem)%>
                                                        <%#GetRecurringDescription((ShoppingCartItem)Container.DataItem)%>
                                                        <asp:Panel ID="pnlWarnings" runat="server" CssClass="warning-box" EnableViewState="false"
                                                            Visible="false">
                                                            <asp:Label ID="lblWarning" runat="server" CssClass="warning-text" EnableViewState="false"
                                                                Visible="false"></asp:Label>
                                                        </asp:Panel>
                                                    </td>
                                                    <td style="white-space: nowrap;">
                                                        <asp:TextBox ID="txtQuantity" runat="server" size="4" SkinID="ShoppingCartQuantityText"
                                                            Text='<%# Eval("Quantity") %>' />
                                                    </td>
                                                    <td style="white-space: nowrap;">
                                                        <%#GetShoppingCartItemUnitPriceString((ShoppingCartItem)Container.DataItem)%>
                                                    </td>
                                                    <td class="end" style="white-space: nowrap;">
                                                        <%#GetShoppingCartItemSubTotalString((ShoppingCartItem)Container.DataItem)%>
                                                        <asp:Label ID="lblShoppingCartItemId" runat="server" Text='<%# Eval("ShoppingCartItemId") %>'
                                                            Visible="false" />
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="cbRemoveFromCart" runat="server" Visible="false" />
                                                        <asp:Button ID="btnRemove" runat="server" BackColor="Transparent" BorderStyle="None"
                                                            CommandArgument='<%# Eval("ShoppingCartItemId") %>' CssClass="removebutton" ForeColor="Transparent"
                                                            Text="" ValidationGroup="ProductDetails" />
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </tbody>
                                </colgroup>
                            </table>
                            <div class="clear">
                            </div>
                          <%--  <div class="selected-checkout-attributes">
                                <%=GetCheckoutAttributeDescription()%>
                            </div>--%>
                            <div class="clear">
                            </div>
                            <div class="cart-footer">
                                <div class="common-buttons">
                                    <asp:Button ID="btnUpdate" OnClick="btnUpdate_Click" runat="server" Text="<% $NopResources:ShoppingCart.UpdateCart %>"
                                        CssClass="updatecartbutton" />
                                    <div class="continueBtn">
                                        <%--<a href="../Default.aspx">Continue Shopping</a>--%>
                                        <a href='javascript:$("#myOrderDiv").hide();'>Continue Shopping</a>
                                        <asp:Button ID="btnContinueShopping" OnClick="btnContinueShopping_Click" Visible="false"
                                            runat="server" Text="<% $NopResources:ShoppingCart.ContinueShopping %>" CssClass="continueBtn" /></div>
                                    <div class="bookTime">
                                        <a href="BookDeliverTime.aspx">Book Delivery Time</a></div>
                                </div>
                                <div class="clear">
                                </div>
                                <asp:PlaceHolder runat="server" ID="phMinOrderSubtotalAmount">
                                    <div class="min-amount-warning">
                                        <asp:Label runat="server" ID="lMinOrderSubtotalAmount" />
                                    </div>
                                </asp:PlaceHolder>
                                <div class="clear">
                                </div>
                         <%--       <nopCommerce:CheckoutAttributes Visible="false" ID="ctrlCheckoutAttributes" runat="server" />--%>
                                <div class="clear">
                                </div>
                                <div class="totals">
                                    <nopCommerce:OrderTotals runat="server" ID="ctrlOrderTotals" />
                                    <div class="clear">
                                    </div>
                                    <%if (this.SettingManager.GetSettingValueBoolean("Checkout.TermsOfServiceEnabled"))
                                      { %>
                                    <script language="javascript" type="text/javascript">
                                        function accepttermsofservice(msg) {
                                            if (!document.getElementById('<%=cbTermsOfService.ClientID%>').checked) {
                                                alert(msg);
                                                return false;
                                            }
                                            else
                                                return true;
                                        }
                                    </script>
                                    <div class="terms-of-service">
                                        <asp:CheckBox runat="server" ID="cbTermsOfService" />
                                        <asp:Literal runat="server" ID="lTermsOfService" />
                                    </div>
                                    <div class="clear">
                                    </div>
                                    <div class="checkout-buttons">
                                        <asp:Button ID="btnCheckout" OnClick="btnCheckout_Click" runat="server" Text="<% $NopResources:ShoppingCart.Checkout %>"
                                            CssClass="checkoutbutton" />
                                    </div>
                                    <div class="addon-buttons">
                                        <nopCommerce:GoogleCheckoutButton runat="server" ID="btnGoogleCheckoutButton"></nopCommerce:GoogleCheckoutButton>
                                    </div>
                                    <%} %>
                                </div>
                                <div class="cart-collaterals">
                                    <div class="deals">
                                        <%if (this.SettingManager.GetSettingValueBoolean("Display.Checkout.DiscountCouponBox"))
                                          { %>
                                        <asp:Panel runat="server" ID="phCoupon" CssClass="coupon-box">
                                            <b>
                                                <%=GetLocaleResourceString("ShoppingCart.DiscountCouponCode")%></b>
                                            <br />
                                            <%=GetLocaleResourceString("ShoppingCart.DiscountCouponCode.Tooltip")%>
                                            <br />
                                            <asp:TextBox ID="txtDiscountCouponCode" runat="server" Width="125px" />&nbsp;
                                            <asp:Button runat="server" ID="btnApplyDiscountCouponCode" OnClick="btnApplyDiscountCouponCode_Click"
                                                Text="<% $NopResources:ShoppingCart.ApplyDiscountCouponCodeButton %>" CssClass="applycouponcodebutton"
                                                CausesValidation="false" />
                                            <asp:Panel runat="server" ID="pnlDiscountWarnings" CssClass="warning-box" EnableViewState="false"
                                                Visible="false">
                                                <br />
                                                <asp:Label runat="server" ID="lblDiscountWarning" CssClass="warning-text" EnableViewState="false"
                                                    Visible="false"></asp:Label>
                                            </asp:Panel>
                                        </asp:Panel>
                                        <%} %>
                                        <%if (this.SettingManager.GetSettingValueBoolean("Display.Checkout.GiftCardBox"))
                                          { %>
                                        <asp:Panel runat="server" ID="phGiftCards" CssClass="giftcard-box">
                                            <b>
                                                <%=GetLocaleResourceString("ShoppingCart.GiftCards")%></b>
                                            <br />
                                            <%=GetLocaleResourceString("ShoppingCart.GiftCards.Tooltip")%>
                                            <br />
                                            <asp:TextBox ID="txtGiftCardCouponCode" runat="server" Width="125px" />&nbsp;
                                            <asp:Button runat="server" ID="btnApplyGiftCardsCouponCode" OnClick="btnApplyGiftCardCouponCode_Click"
                                                Text="<% $NopResources:ShoppingCart.ApplyGiftCardCouponCodeButton %>" CssClass="applycouponcodebutton"
                                                CausesValidation="false" />
                                            <asp:Panel runat="server" ID="pnlGiftCardWarnings" CssClass="warning-box" EnableViewState="false"
                                                Visible="false">
                                                <br />
                                                <asp:Label runat="server" ID="lblGiftCardWarning" CssClass="warning-text" EnableViewState="false"
                                                    Visible="false"></asp:Label>
                                            </asp:Panel>
                                        </asp:Panel>
                                        <%} %>
                                    </div>
                                    <div class="shipping">
                                        <nopCommerce:EstimateShipping ID="ctrlEstimateShipping" runat="server" />
                                    </div>
                                </div>
                                <div class="clear">
                                </div>
                                <div class="product-grid">
                                    <asp:DataList ID="dlCrossSells" runat="server" RepeatColumns="2" RepeatDirection="Horizontal"
                                        RepeatLayout="Table" ItemStyle-CssClass="item-box">
                                        <HeaderTemplate>
                                            <span class="crosssells-title">
                                                <%=GetLocaleResourceString("ShoppingCart.CrossSells")%></span>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <nopCommerce:ProductBox1 ID="ctrlProductBox" Product='<%# Container.DataItem %>'
                                                runat="server" RedirectCartAfterAddingProduct="True" />
                                        </ItemTemplate>
                                    </asp:DataList>
                                </div>
                                <div class="clear">
                                </div>
                            </div>
                        </asp:Panel>
                        <%--  <table width="699" border="0" cellspacing="0" cellpadding="0">
                    <tr class="orangeStrip">
                        <td style="border: none;">
                            Product Name
                        </td>
                        <td style="border: none;">
                            Quantity
                        </td>
                        <td style="border: none; text-align: right;">
                            Our Price
                        </td>
                        <td style="border: none; text-align: right;">
                            Subtotal
                        </td>
                        <td style="border: none; text-align: right;">
                            Saving
                        </td>
                        <td style="border: none;">
                            Remove
                        </td>
                    </tr>
                    <tr>
                        <td class="ordertitle" colspan="6" style="border: none;">
                            Personal Care
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Huggies Diapers Large 8-14 Kg 30 nos
                        </td>
                        <td>
                            <input type="text" name="your-name" value="" class="txtsmall">
                        </td>
                        <td style="text-align: right;">
                            000.00
                        </td>
                        <td style="text-align: right;">
                            000.00
                        </td>
                        <td class="greeText" style="text-align: right;">
                            000.00
                        </td>
                        <td style="text-align: center;">
                            <a href="#">
                                <img src="images/delete-icon.png" alt="Delete" /></a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Huggies Diapers Large 8-14 Kg 30 nos
                        </td>
                        <td>
                            <input type="text" name="your-name" value="" class="txtsmall">
                        </td>
                        <td style="text-align: right;">
                            000.00
                        </td>
                        <td style="text-align: right;">
                            000.00
                        </td>
                        <td class="greeText" style="text-align: right;">
                            000.00
                        </td>
                        <td style="text-align: center;">
                            <a href="#">
                                <img src="images/delete-icon.png" alt="Delete" /></a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Huggies Diapers Large 8-14 Kg 30 nos
                        </td>
                        <td>
                            <input type="text" name="your-name" value="" class="txtsmall">
                        </td>
                        <td style="text-align: right;">
                            000.00
                        </td>
                        <td style="text-align: right;">
                            000.00
                        </td>
                        <td class="greeText" style="text-align: right;">
                            000.00
                        </td>
                        <td style="text-align: center;">
                            <a href="#">
                                <img src="images/delete-icon.png" alt="Delete" /></a>
                        </td>
                    </tr>
                    <tr>
                        <td class="ordertitle" colspan="6" style="border: none;">
                            Personal Care
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Huggies Diapers Large 8-14 Kg 30 nos
                        </td>
                        <td>
                            <input type="text" name="your-name" value="" class="txtsmall">
                        </td>
                        <td style="text-align: right;">
                            000.00
                        </td>
                        <td style="text-align: right;">
                            000.00
                        </td>
                        <td class="greeText" style="text-align: right;">
                            000.00
                        </td>
                        <td style="text-align: center;">
                            <a href="#">
                                <img src="images/delete-icon.png" alt="Delete" /></a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Huggies Diapers Large 8-14 Kg 30 nos
                        </td>
                        <td>
                            <input type="text" name="your-name" value="" class="txtsmall">
                        </td>
                        <td style="text-align: right;">
                            000.00
                        </td>
                        <td style="text-align: right;">
                            000.00
                        </td>
                        <td class="greeText" style="text-align: right;">
                            000.00
                        </td>
                        <td style="text-align: center;">
                            <a href="#">
                                <img src="images/delete-icon.png" alt="Delete" /></a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Huggies Diapers Large 8-14 Kg 30 nos
                        </td>
                        <td>
                            <input type="text" name="your-name" value="" class="txtsmall">
                        </td>
                        <td style="text-align: right;">
                            000.00
                        </td>
                        <td style="text-align: right;">
                            000.00
                        </td>
                        <td class="greeText" style="text-align: right;">
                            000.00
                        </td>
                        <td style="text-align: center;">
                            <a href="#">
                                <img src="images/delete-icon.png" alt="Delete" /></a>
                        </td>
                    </tr>
                    <tr class="totalBottom">
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td style="text-align: right;">
                            <strong>Total Amount</strong>
                        </td>
                        <td style="text-align: right;">
                            0000.00
                        </td>
                        <td class="greeText" style="text-align: right;">
                            0000.00
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>--%>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    </form>
</body>
</html>
