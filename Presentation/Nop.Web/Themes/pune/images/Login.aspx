<%@ Page Language="C#" MasterPageFile="~/MasterPages/ThreeColumn.master" AutoEventWireup="true"
    Inherits="NopSolutions.NopCommerce.Web.LoginPage" Title="Login" CodeBehind="Login.aspx.cs" %>

<%@ Register TagPrefix="nopCommerce" TagName="CustomerLogin" Src="~/Modules/CustomerLogin.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cph1" runat="Server">
    <div class="rightCol">
        <div class="whiteboxBg">
            <nopCommerce:CustomerLogin ID="ctrlCustomerLogin" runat="server" />
        </div>
    </div>
</asp:Content>
