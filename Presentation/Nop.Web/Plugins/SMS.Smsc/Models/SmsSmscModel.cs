using Nop.Web.Framework;

namespace Nop.Plugin.SMS.Smsc.Models
{
    public class SmsSmscModel
    {
        [NopResourceDisplayName("Plugins.Sms.Smsc.Fields.Enabled")]
        public bool Enabled { get; set; }

        [NopResourceDisplayName("Plugins.Sms.Smsc.Fields.PhoneNumber")]
        public string PhoneNumber { get; set; }

        [NopResourceDisplayName("Plugins.Sms.Smsc.Fields.SenderName")]
        public string SenderName { get; set; }

        [NopResourceDisplayName("Plugins.Sms.Smsc.Fields.Username")]
        public string Username { get; set; }

        [NopResourceDisplayName("Plugins.Sms.Smsc.Fields.Password")]
        public string Password { get; set; }


        [NopResourceDisplayName("Plugins.Sms.Smsc.Fields.TestMessage")]
        public string TestMessage { get; set; }
        public string TestSmsResult { get; set; }
    }
}