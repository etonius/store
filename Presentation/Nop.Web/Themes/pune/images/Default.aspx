<%@ Page Language="C#" MasterPageFile="~/MasterPages/ThreeColumn.master" AutoEventWireup="true"
    Inherits="NopSolutions.NopCommerce.Web.Default" CodeBehind="Default.aspx.cs" %>

<%@ Register TagPrefix="nopCommerce" TagName="HomePagePoll" Src="~/Modules/HomePagePoll.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="HomePageNews" Src="~/Modules/HomePageNews.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="HomePageCategories" Src="~/Modules/HomePageCategories.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="HomePageProducts" Src="~/Modules/HomePageProducts.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="BestSellers" Src="~/Modules/BestSellers.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="Topic" Src="~/Modules/Topic.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductBox1" Src="~/Modules/ProductBox3.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cph1" runat="Server">
    <script src="Scripts/jquery-1.2.6.min.js" type="text/javascript"></script>
    <script type="text/javascript">


        function slideSwitch() {
            var $active = $('#slideshow DIV.active');

            if ($active.length == 0) $active = $('#slideshow DIV:last');

            // use this to pull the divs in the order they appear in the markup
            var $next = $active.next().length ? $active.next()
        : $('#slideshow DIV:first');

            // uncomment below to pull the divs randomly
            // var $sibs  = $active.siblings();
            // var rndNum = Math.floor(Math.random() * $sibs.length );
            // var $next  = $( $sibs[ rndNum ] );


            $active.addClass('last-active');

            $next.css({ opacity: 0.0 })
        .addClass('active')
        .animate({ opacity: 1.0 }, 1000, function () {
            $active.removeClass('active last-active');
        });
        }

        $(function () {
            setInterval("slideSwitch()", 4000);
        });

    </script>
    <div class="rightCol">
        <div class="scrollBg">
            <marquee scrollamount="4" onmouseover="this.stop()" onmouseout="this.start()" direction="left"
                behavior="scroll" align="middle">
        <a class="marq" href="http://billing.mahadiscom.in/" target="_blank">Pay Electricity Bill</a> | <a class="marq" href="#" target="_blank">Your Link Here</a> | <a class="marq" href="#" target="_blank">Your Link Here</a>
        </marquee>
        </div>
        <div class="whiteboxBg">
            <div id="slideshow">
                <div class="active">
                    <img src="images/banner1.png" alt="Slideshow Image 1" />
                </div>
                <div>
                    <img src="images/banner2.png" alt="Slideshow Image 2" />
                </div>
                <div>
                    <img src="images/banner1.png" alt="Slideshow Image 3" />
                </div>
                <div>
                    <img src="images/banner2.png" alt="Slideshow Image 4" />
                </div>
            </div>
        </div>
        <div class="clear">
        </div>
        <div class="whiteboxBg">
            <asp:GridView ID="rptrCategory" runat="server" OnRowDataBound="rptrCategory_OnRowDataBound"
                OnPageIndexChanging="rptrCategory_OnPageIndexChanging" AllowPaging="true" PageSize="8"
                AutoGenerateColumns="false">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                          
                                <h1>
                                    <%# Eval("Name") %></h1>
                                <div class="boxProduct" style="margin-left: 0px;">
                                    <asp:DataList ID="dlSubCategories" runat="server" RepeatColumns="4" RepeatDirection="Horizontal"
                                        RepeatLayout="Table" OnItemDataBound="dlSubCategories_ItemDataBound" ItemStyle-CssClass="item-box">
                                        <ItemTemplate>
                                        <div class="product-item">
                                            <div class="image1" >
                                                <asp:HyperLink style="width:125px; height:125px" ID="hlImageLink" runat="server" />
                                            </div>
                                            <div class="boxproductinner">
                                                <asp:HyperLink ID="hlCategory" rel="facebox" runat="server" />
                                            </div></div>
                                            <%--<div class="sub-category-item">
                                                <h2 class="category-title">
                                                    <asp:HyperLink ID="hlCategory" runat="server" />
                                                </h2>
                                                <div class="picture">
                                                </div>
                                            </div>--%>
                                        </ItemTemplate>
                                    </asp:DataList>
                                </div>
                                <%--<div class="boxProduct" style="margin-left:0px;">
                                <asp:DataList ID="dlProducts" runat="server" RepeatColumns="4" RepeatDirection="Horizontal"
                                    RepeatLayout="Table" ItemStyle-CssClass="item-box">
                                    <ItemTemplate>
                                        <nopCommerce:ProductBox1 ID="ctrlProductBox" Product='<%# Container.DataItem %>'
                                            runat="server" />
                                    </ItemTemplate>
                                </asp:DataList>
                            </div>--%>
                            
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <nopCommerce:Topic ID="topicHomePageText" runat="server" TopicName="HomePageText"
            OverrideSEO="false"></nopCommerce:Topic>
        <div class="clear">
        </div>
        <%--   <nopCommerce:HomePageCategories ID="ctrlHomePageCategories" runat="server" />
        <div class="clear">
        </div>--%>
        <%--<nopCommerce:HomePageProducts ID="ctrlHomePageProducts" runat="server" />
        <div class="clear">
        </div>--%>
        <nopCommerce:BestSellers ID="ctrlBestSellers" runat="server" />
        <div class="clear">
        </div>
        <nopCommerce:HomePageNews ID="ctrlHomePageNews" runat="server" />
        <div class="clear">
        </div>
        <nopCommerce:HomePagePoll ID="ctrlPolls" runat="server" />
    </div>
</asp:Content>
