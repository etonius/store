<%@ Page Language="C#" MasterPageFile="~/MasterPages/ThreeColumn.master" AutoEventWireup="true"
    Inherits="NopSolutions.NopCommerce.Web.ContactUsPage" CodeBehind="ContactUs.aspx.cs"
     %>

<%@ Register TagPrefix="nopCommerce" TagName="ContactUs" Src="~/Modules/ContactUs.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cph1" runat="Server">
<div class="rightCol">
    <div class="whiteboxBg">

    <nopCommerce:ContactUs ID="ctrlContactUs" runat="server" /></div></div>
</asp:Content>
