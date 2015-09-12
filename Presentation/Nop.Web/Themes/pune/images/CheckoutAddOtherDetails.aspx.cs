using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NopSolutions.NopCommerce.Common.Utils;
using NopSolutions.NopCommerce.BusinessLogic;
using NopSolutions.NopCommerce.BusinessLogic.SEO;
using NopSolutions.NopCommerce.BusinessLogic.CustomerManagement;
using NopSolutions.NopCommerce.BusinessLogic.Payment;

namespace NopSolutions.NopCommerce.Web
{
    public partial class CheckoutAddOtherDetails : BaseNopFrontendPage
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            CommonHelper.SetResponseNoCache(Response);

            if (NopContext.Current.User == null || NopContext.Current.User.IsGuest)
            {
                string loginURL = SEOHelper.GetLoginPageUrl(true);
                Response.Redirect(loginURL);
            }

            string title = "Add other details";
            SEOHelper.RenderTitle(this, title, true);

            if (!IsPostBack)
            {
                BindAddress();
            }
        }

        private void BindAddress()
        {
            txtName.Text = NopContext.Current.User.FirstName;
            txtLastName.Text = NopContext.Current.User.LastName;
            txtAddress1.Text = NopContext.Current.User.StreetAddress;
            txtAddress2.Text = NopContext.Current.User.StreetAddress2;
        }

        protected void btnContinue_Click(object sender, EventArgs e)
        {
            string checkoutattributes = "<Attributes>";

            if (chkQuick.Checked)
            {
                checkoutattributes += "<CheckoutAttribute ID='3'><CheckoutAttributeValue><Value>1</Value></CheckoutAttributeValue></CheckoutAttribute>";
            }
            else
            {
                if (rbSlot1.Checked)
                {
                    checkoutattributes += "<CheckoutAttribute ID='1'><CheckoutAttributeValue><Value>" +
                      (dtDeliveryDate.SelectedDate.HasValue ? dtDeliveryDate.SelectedDate.Value.ToShortDateString() : DateTime.Now.ToShortDateString()) +
                      " 9AM to 1PM" +
                  "</Value></CheckoutAttributeValue></CheckoutAttribute>";
                }
                else
                {

                    checkoutattributes += "<CheckoutAttribute ID='1'><CheckoutAttributeValue><Value>" +
                      (dtDeliveryDate.SelectedDate.HasValue ? dtDeliveryDate.SelectedDate.Value.ToShortDateString() : DateTime.Now.ToShortDateString()) +
                      " 4PM to 9PM" +
                  "</Value></CheckoutAttributeValue></CheckoutAttribute>";
                }
            }


            checkoutattributes += "</Attributes>";
            this.CustomerService.ApplyCheckoutAttributes(checkoutattributes);


            NopContext.Current.User.FirstName = txtName.Text;
            NopContext.Current.User.LastName = txtLastName.Text;
            NopContext.Current.User.StreetAddress = txtAddress1.Text;
            NopContext.Current.User.StreetAddress2 = txtAddress2.Text;
            this.CustomerService.UpdateCustomer(NopContext.Current.User);

            PaymentInfo paymentInfo = new PaymentInfo();
            //paymentInfo.BillingAddress = address;
            //paymentInfo.ShippingAddress = address;
            paymentInfo.PaymentMethodId = 15;
            paymentInfo.CustomerCurrency = NopContext.Current.WorkingCurrency;
            paymentInfo.CustomerLanguage = NopContext.Current.WorkingLanguage;


            int orderId = 0;
            string result = this.OrderService.PlaceOrder(paymentInfo, NopContext.Current.User, out orderId);
            paymentInfo = null;
            var order = this.OrderService.GetOrderById(orderId);
            if (!String.IsNullOrEmpty(result))
            {
                return;
            }
            else
            {
                this.PaymentService.PostProcessPayment(order);
            }
            var orderCollection = NopContext.Current.User.Orders;
            if (orderCollection.Count == 0)
            {
                Response.Redirect(CommonHelper.GetStoreLocation());
            }
            else
            {
                var lastOrder = orderCollection[0];
                string url = string.Format("{0}OrderDetails.aspx?OrderID={1}", CommonHelper.GetStoreLocation(), lastOrder.OrderId).ToLowerInvariant();
                Response.Redirect(url);
            }

        }
    }
}