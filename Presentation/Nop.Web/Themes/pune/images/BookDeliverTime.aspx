<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ThreeColumn.master"
    AutoEventWireup="true" CodeBehind="BookDeliverTime.aspx.cs" Inherits="NopSolutions.NopCommerce.Web.BookDeliverTime" %>

<asp:Content ID="Content3" ContentPlaceHolderID="cph1" runat="server">
    <div class="rightCol">
        <div class="whiteboxBg">
            <h1>
                Select Delivery Time</h1>
            <div id="dvselectTime" runat="server" class="deliveryTime">
                <table width="699" border="0" cellspacing="0" cellpadding="0">
                    <tr class="orangeStrip">
                        <td style="border: none;">
                            Day / Date
                        </td>
                        <td colspan="4" style="border: none;">
                            Select Time
                        </td>
                    </tr>
                    <tr>
                        <td class="deliveryDay">
                            <asp:Literal ID="ltSun" runat="server"></asp:Literal>
                        </td>
                        <td>
                            <asp:CheckBox ID="CheckBox1" runat="server" Text="7 A.M - 9.30 A.M" />
                        </td>
                        <td>
                            <asp:CheckBox ID="CheckBox2" runat="server" Text="10 A.M - 12:30 P.M" />
                        </td>
                        <td>
                            <asp:CheckBox ID="CheckBox3" runat="server" Text="5 P.M - 7:30 P.M" />
                        </td>
                        <td>
                            <asp:CheckBox ID="CheckBox4" runat="server" Text="7:30 P.M - 10 P.M" />
                        </td>
                    </tr>
                    <tr>
                        <td class="deliveryDay">
                            <asp:Literal ID="ltMon" runat="server"></asp:Literal>
                        </td>
                        <td>
                            <asp:CheckBox ID="CheckBox5" runat="server" Text="7 A.M - 9.30 A.M" />
                        </td>
                        <td>
                            <asp:CheckBox ID="CheckBox6" runat="server" Text="10 A.M - 12:30 P.M" />
                        </td>
                        <td>
                            <asp:CheckBox ID="CheckBox7" runat="server" Text="5 P.M - 7:30 P.M" />
                        </td>
                        <td>
                            <asp:CheckBox ID="CheckBox8" runat="server" Text="7:30 P.M - 10 P.M" />
                        </td>
                    </tr>
                    <tr>
                        <td class="deliveryDay">
                            <asp:Literal ID="ltTue" runat="server"></asp:Literal>
                        </td>
                        <td>
                            <asp:CheckBox ID="CheckBox9" runat="server" Text="7 A.M - 9.30 A.M" />
                        </td>
                        <td>
                            <asp:CheckBox ID="CheckBox10" runat="server" Text="10 A.M - 12:30 P.M" />
                        </td>
                        <td>
                            <asp:CheckBox ID="CheckBox11" runat="server" Text="5 P.M - 7:30 P.M" />
                        </td>
                        <td>
                            <asp:CheckBox ID="CheckBox12" runat="server" Text="7:30 P.M - 10 P.M" />
                        </td>
                    </tr>
                    <tr>
                        <td class="deliveryDay">
                            <asp:Literal ID="ltWed" runat="server"></asp:Literal>
                        </td>
                        <td>
                            <asp:CheckBox ID="CheckBox13" runat="server" Text="7 A.M - 9.30 A.M" />
                        </td>
                        <td>
                            <asp:CheckBox ID="CheckBox14" runat="server" Text="10 A.M - 12:30 P.M" />
                        </td>
                        <td>
                            <asp:CheckBox ID="CheckBox15" runat="server" Text="5 P.M - 7:30 P.M" />
                        </td>
                        <td>
                            <asp:CheckBox ID="CheckBox16" runat="server" Text="7:30 P.M - 10 P.M" />
                        </td>
                    </tr>
                    <tr>
                        <td class="deliveryDay">
                            <asp:Literal ID="ltThur" runat="server"></asp:Literal>
                        </td>
                        <td>
                            <asp:CheckBox ID="CheckBox17" runat="server" Text="7 A.M - 9.30 A.M" />
                        </td>
                        <td>
                            <asp:CheckBox ID="CheckBox18" runat="server" Text="10 A.M - 12:30 P.M" />
                        </td>
                        <td>
                            <asp:CheckBox ID="CheckBox19" runat="server" Text="5 P.M - 7:30 P.M" />
                        </td>
                        <td>
                            <asp:CheckBox ID="CheckBox20" runat="server" Text="7:30 P.M - 10 P.M" />
                        </td>
                    </tr>
                    <tr>
                        <td class="deliveryDay">
                            <asp:Literal ID="ltFri" runat="server"></asp:Literal>
                        </td>
                        <td>
                            <asp:CheckBox ID="CheckBox21" runat="server" Text="7 A.M - 9.30 A.M" />
                        </td>
                        <td>
                            <asp:CheckBox ID="CheckBox22" runat="server" Text="10 A.M - 12:30 P.M" />
                        </td>
                        <td>
                            <asp:CheckBox ID="CheckBox23" runat="server" Text="5 P.M - 7:30 P.M" />
                        </td>
                        <td>
                            <asp:CheckBox ID="CheckBox24" runat="server" Text="7:30 P.M - 10 P.M" />
                        </td>
                    </tr>
                    <tr>
                        <td class="deliveryDay">
                            <asp:Literal ID="ltSat" runat="server"></asp:Literal>
                        </td>
                        <td>
                            <asp:CheckBox ID="CheckBox25" runat="server" Text="7 A.M - 9.30 A.M" />
                        </td>
                        <td>
                            <asp:CheckBox ID="CheckBox26" runat="server" Text="10 A.M - 12:30 P.M" />
                        </td>
                        <td>
                            <asp:CheckBox ID="CheckBox27" runat="server" Text="5 P.M - 7:30 P.M" />
                        </td>
                        <td>
                            <asp:CheckBox ID="CheckBox28" runat="server" Text="7:30 P.M - 10 P.M" />
                        </td>
                    </tr>
                </table>
            </div>
            <div>
                <asp:CheckBox ID="chkQuickDelivery" Checked="true" Text="Quick Delivery" runat="server" />
            </div>
            <div>
                <div class="bookTime">
                    <asp:Button ID="btnPaymentOption" class="booktimeButton" runat="server" Text="Payment Option"
                        OnClick="btnPaymentOption_Click" />
                    <%--   <a href="#" id="apaymentOption" runat="server" ></a></div>--%>
                </div>
            </div>
            <div>
                <asp:Label ID="lblError" runat="server" Text="Please select only 1 booking slot."
                    ForeColor="Red" Visible="false"></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>
