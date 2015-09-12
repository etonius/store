<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ThreeColumn.master"
    AutoEventWireup="true" CodeBehind="CheckoutAddOtherDetails.aspx.cs" Inherits="NopSolutions.NopCommerce.Web.CheckoutAddOtherDetails" %>

<%@ Register TagPrefix="nopCommerce" TagName="DatePicker2" Src="~/Administration/Modules/DatePicker.ascx" %>
<asp:Content ID="Content3" ContentPlaceHolderID="cph1" runat="server">
   <%-- <ajaxToolkit:ToolkitScriptManager runat="server" ID="sm1" EnableScriptGlobalization="true"
        EnableScriptLocalization="true" ScriptMode="Release" CompositeScript-ScriptMode="Release" />
   --%> <div class="rightCol">
        <div class="whiteboxBg">
            <div class="compulsory">
                <span>*</span> Field are compulsory</div>
            <h1>
                Delivery schedule</h1>
            <div class="boxRegister">
                <div class="regBox">
                    <label>
                        Name :</label>
                    <asp:TextBox ID="txtName" runat="server" class="txt"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvNmame" runat="server" ValidationGroup="ProductDetails"
                        ControlToValidate="txtName" ErrorMessage=""></asp:RequiredFieldValidator>
                    <small>*</small>
                </div>
                <div class="regBox">
                    <label>
                        Surname :</label>
                    <asp:TextBox ID="txtLastName" class="txt" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="ProductDetails"
                        ControlToValidate="txtLastName" ErrorMessage=""></asp:RequiredFieldValidator>
                    <small>*</small></div>
                <div class="regBox">
                    <label>
                        complete address :</label>
                    <asp:TextBox ID="txtAddress1" class="txt" TextMode="MultiLine" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="ProductDetails"
                        ControlToValidate="txtAddress1" ErrorMessage=""></asp:RequiredFieldValidator>
                    <small>*</small>
                </div>
                <div class="regBox">
                    <label>
                        Landmark :</label>
                    <asp:TextBox ID="txtAddress2" class="txt" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="ProductDetails"
                        ControlToValidate="txtAddress2" ErrorMessage=""></asp:RequiredFieldValidator>
                </div>
                <h2>
                    Delivery Shedule</h2>
                <div class="regboxBottom" style="line-height: 27px;">
                    <ul>
                        <li>
                            <input type="radio" runat="server" name="news_status" id="chkQuick" value="False">
                            Quick Delivery (RS 35 Extra For Quick Delivery, Within 1.5Hr, 9AM to 7PM)</li>
                        <li><strong>Regular Delivery</strong></li>
                        <li>
                            <input type="radio" runat="server" name="news_status" value="True" id="rbSlot1">
                            Slots 9AM to 1PM</li>
                        <li>
                            <input type="radio" name="news_status" runat="server" value="False" id="rbSlot2">
                            Slots 4PM to 9PM</li>
                    </ul>
                    <div class="datepicker regBox">
                        <label style="padding: 0px">
                            Date :
                        </label>
                        <nopCommerce:DatePicker2 runat="server" ID="dtDeliveryDate" />
                    </div>
                </div>
            </div>
            <div class="registerMe">
                <asp:LinkButton runat="server" ID="btnContinue" Text="Continue" BackColor="Transparent"
                    BorderStyle="None" CssClass="button" ValidationGroup="ProductDetails" OnClick="btnContinue_Click" />
            </div>
        </div>
</asp:Content>
