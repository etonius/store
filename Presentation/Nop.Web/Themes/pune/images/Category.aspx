<%@ Page Language="C#" MasterPageFile="~/MasterPages/ThreeColumn.master" AutoEventWireup="true"
    Inherits="NopSolutions.NopCommerce.Web.CategoryPage" CodeBehind="Category.aspx.cs" %>

<%@ Register TagPrefix="nopCommerce" TagName="MiniShoppingCartBox" Src="~/Modules/MiniShoppingCartBox.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="CategoryNavigation" Src="~/Modules/CategoryNavigation.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="ManufacturerNavigation" Src="~/Modules/ManufacturerNavigation.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="RecentlyViewedProducts" Src="~/Modules/RecentlyViewedProductsBox.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="HorizontalMenu" Src="~/Modules/HorizontalMenu.ascx" %>
<asp:Content ID="Content3" ContentPlaceHolderID="CategoryBC" runat="server">
    <style type="text/css">
        .Loading
        {
            top: 300px;
            left: 275px;
            position: fixed;
            z-index: 1000;
            display: none;
        }
        #shopping_cart_loader
        {
            background-color: #D5D2D2;
            opacity: 0.5;
            position: relative;
            z-index: 9999998;
            width: 260px;
            height: 333px;
            border-radius: 6px 10px 6px 10px;
        }
        
        #portamento_container
        {
            position: absolute;
            top: 0;
        }
        /* take the absolute positioning of the sidebar */
        
        #leftCol
        {
            top: 0px;
            position: absolute;
        }
        
        #portamento_container #leftCol
        {
        }
        #portamento_container #leftCol.fixed
        {
            position: fixed;
            right: auto;
            top: auto;
        }
    </style>
    <div class="contentWrapper">
        <nopCommerce:HorizontalMenu ID="HorizontalMenu1" runat="server"></nopCommerce:HorizontalMenu>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph2" runat="server">
    <%-- <nopCommerce:CategoryNavigation ID="ctrlCategoryNavigation" runat="server" />--%>
    <div class="clear">
    </div>
    <%-- <nopCommerce:ManufacturerNavigation ID="ctrlManufacturerNavigation" runat="server" />
    <div class="clear">
    </div>--%>
    <%-- <nopCommerce:RecentlyViewedProducts ID="ctrlRecentlyViewedProducts" runat="server" />
    <div class="clear">
    </div>--%>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="cph1" runat="Server">
   
            <div id="categorypage" style="overflow: hidden; position: relative; margin-top: 53px;"><div id="rightCol" class="rightCol">
    <div class="whiteboxBg">
                <asp:PlaceHolder runat="server" ID="CategoryPlaceHolder"></asp:PlaceHolder></div></div>
                <%--<asp:UpdateProgress runat="server" ID="categoryUpdateProgress">
                <ProgressTemplate>
                    <div id="shopping_cart_loader">
                        <img src="../images/UpdateProgress.gif" alt="Loading..." style="margin-left: 115px;
                            margin-top: 148px;" />
                    </div>
                </ProgressTemplate>
            </asp:UpdateProgress>
                --%><nopCommerce:MiniShoppingCartBox ID="ctrlMiniShoppingCartBox" runat="server" />
            </div>
            <div class="clear">
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
    <script src="../Scripts/portamento.js" type="text/javascript"></script>
    <script type="text/javascript">
        jQuery.noConflict();
        jQuery(document).ready(function () {
            jQuery("#leftCol").portamento(
          { wrapper: $("#categorypage") }
          );
        });
	</script>
</asp:Content>
