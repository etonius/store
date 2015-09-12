using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NopSolutions.NopCommerce.Web
{
    public partial class BookDeliverTime : BaseNopFrontendPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Redirect("ShoppingCart.aspx");
            if (!IsPostBack)
            {
                BindInitialData();
            }
        }

        private void BindInitialData()
        {
            dvselectTime.Disabled = true;
            DateTime currentSunday = DateTime.Now;
            if (currentSunday.DayOfWeek == DayOfWeek.Monday)
                currentSunday = currentSunday.AddDays(-1);
            else if (currentSunday.DayOfWeek == DayOfWeek.Tuesday)
                currentSunday = currentSunday.AddDays(-2);
            else if (currentSunday.DayOfWeek == DayOfWeek.Wednesday)
                currentSunday = currentSunday.AddDays(-3);
            else if (currentSunday.DayOfWeek == DayOfWeek.Thursday)
                currentSunday = currentSunday.AddDays(-4);
            else if (currentSunday.DayOfWeek == DayOfWeek.Friday)
                currentSunday = currentSunday.AddDays(-5);
            else if (currentSunday.DayOfWeek == DayOfWeek.Saturday)
                currentSunday = currentSunday.AddDays(-6);
            ltSun.Text = currentSunday.ToString("ddd, dd/MM/yyyy");
            ltMon.Text = currentSunday.AddDays(1).ToString("ddd, dd/MM/yyyy");
            ltTue.Text = currentSunday.AddDays(2).ToString("ddd, dd/MM/yyyy");
            ltWed.Text = currentSunday.AddDays(3).ToString("ddd, dd/MM/yyyy");
            ltThur.Text = currentSunday.AddDays(4).ToString("ddd, dd/MM/yyyy");
            ltFri.Text = currentSunday.AddDays(5).ToString("ddd, dd/MM/yyyy");
            ltSat.Text = currentSunday.AddDays(6).ToString("ddd, dd/MM/yyyy");
        }

        protected void btnPaymentOption_Click(object sender, EventArgs e)
        {
            List<string> dates = new List<string>();

            dates = ValidateBookingSlots(dates, CheckBox1, ltSun.Text);
            dates = ValidateBookingSlots(dates, CheckBox2, ltSun.Text);
            dates = ValidateBookingSlots(dates, CheckBox3, ltSun.Text);
            dates = ValidateBookingSlots(dates, CheckBox4, ltSun.Text);
            dates = ValidateBookingSlots(dates, CheckBox5, ltMon.Text);
            dates = ValidateBookingSlots(dates, CheckBox6, ltMon.Text);
            dates = ValidateBookingSlots(dates, CheckBox7, ltMon.Text);
            dates = ValidateBookingSlots(dates, CheckBox8, ltMon.Text);
            dates = ValidateBookingSlots(dates, CheckBox9, ltTue.Text);
            dates = ValidateBookingSlots(dates, CheckBox10, ltTue.Text);
            dates = ValidateBookingSlots(dates, CheckBox11, ltTue.Text);
            dates = ValidateBookingSlots(dates, CheckBox12, ltTue.Text);
            dates = ValidateBookingSlots(dates, CheckBox13, ltWed.Text);
            dates = ValidateBookingSlots(dates, CheckBox14, ltWed.Text);
            dates = ValidateBookingSlots(dates, CheckBox15, ltWed.Text);
            dates = ValidateBookingSlots(dates, CheckBox16, ltWed.Text);
            dates = ValidateBookingSlots(dates, CheckBox17, ltThur.Text);
            dates = ValidateBookingSlots(dates, CheckBox18, ltThur.Text);
            dates = ValidateBookingSlots(dates, CheckBox19, ltThur.Text);
            dates = ValidateBookingSlots(dates, CheckBox20, ltThur.Text);
            dates = ValidateBookingSlots(dates, CheckBox21, ltFri.Text);
            dates = ValidateBookingSlots(dates, CheckBox22, ltFri.Text);
            dates = ValidateBookingSlots(dates, CheckBox23, ltFri.Text);
            dates = ValidateBookingSlots(dates, CheckBox24, ltFri.Text);
            dates = ValidateBookingSlots(dates, CheckBox25, ltSat.Text);
            dates = ValidateBookingSlots(dates, CheckBox26, ltSat.Text);
            dates = ValidateBookingSlots(dates, CheckBox27, ltSat.Text);
            dates = ValidateBookingSlots(dates, CheckBox28, ltSat.Text);
            string finalatrributestring = string.Empty;
            if (chkQuickDelivery.Checked)
            {
                finalatrributestring = "<Attributes><CheckoutAttribute ID='3'><CheckoutAttributeValue><Value>" +
             1 //based on quick delivery status
              +
              "</Value></CheckoutAttributeValue></CheckoutAttribute></Attributes>";
                this.CustomerService.ApplyCheckoutAttributes(finalatrributestring);
                Response.Redirect("ShoppingCart.aspx");
            }
            else
                if (dates.Count == 1)
                {
                    string checkoutAttributes = "<Attributes><CheckoutAttribute ID='1'><CheckoutAttributeValue><Value>" +
                        dates[0].ToString() +
                  "</Value></CheckoutAttributeValue></CheckoutAttribute>" +
                  "<CheckoutAttribute ID='3'><CheckoutAttributeValue><Value>" +
                  1 //based on quick delivery status
                  +
                  "</Value></CheckoutAttributeValue></CheckoutAttribute></Attributes>";
                    this.CustomerService.ApplyCheckoutAttributes(checkoutAttributes);
                    Response.Redirect("ShoppingCart.aspx");
                }
                else
                {
                    lblError.Visible = true;

                }
        }

        private List<string> ValidateBookingSlots(List<string> dates, CheckBox checkBox, string date)
        {
            if (checkBox.Checked)
                dates.Add(date + ", " + checkBox.Text);
            return dates;
        }
    }
}