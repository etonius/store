using System;
using System.Collections.Generic;
using System.ServiceModel;
using System.Text;
using System.Web.Routing;
using Nop.Core;
using Nop.Core.Plugins;
using Nop.Plugin.SMS.Smsc.Models;
using Nop.Services.Common;
using Nop.Services.Configuration;
using Nop.Services.Localization;
using Nop.Services.Logging;

namespace Nop.Plugin.SMS.Smsc
{
    /// <summary>
    /// Represents the Smsc SMS provider
    /// </summary>
    public class SmscSmsProvider : BasePlugin, IMiscPlugin
    {
        private readonly ILogger _logger;
        private readonly ISettingService _settingService;
        private readonly SmscSettings _smsSettings;
        private readonly SmscServiceProvider _smscDataProvider;

        public SmscSmsProvider(SmscSettings smscSettings,
            ILogger logger, ISettingService settingService)
        {
            this._logger = logger;
            this._settingService = settingService;
            this._smsSettings = smscSettings;
            _smscDataProvider = new SmscServiceProvider(smscSettings);
        }

        public string SendSms(string text, string sender = null, string numbers = null)
        {
            return _smscDataProvider.SendSms(numbers ?? _smsSettings.PhoneNumber, text);
        }

        public string SendSms(ISmsSendModel sms)
        {
            try
            {
                StringBuilder sb = new StringBuilder();
                foreach (string phoneNumber in sms.PhoneNumbers)
                {
                    sb.Append(phoneNumber);
                    sb.Append(",");
                }
                sb.Remove(sb.Length -1, 1);

                return SendSms(sms.Text, sms.From ?? _smsSettings.SenderName, sb.ToString());
            }
            catch (Exception ex)
            {
                _logger.Error(ex.Message, ex);
            }

            return null;
        }

        public string GetBalance()
        {
            try
            {
                return _smscDataProvider.GetBalance();
            }
            catch (Exception ex)
            {
                _logger.Error(ex.Message, ex);
            }

            return "error";
        }

        /// <summary>
        /// Gets a route for provider configuration
        /// </summary>
        /// <param name="actionName">Action name</param>
        /// <param name="controllerName">Controller name</param>
        /// <param name="routeValues">Route values</param>
        public void GetConfigurationRoute(out string actionName, out string controllerName, out RouteValueDictionary routeValues)
        {
            actionName = "Configure";
            controllerName = "SmsSmsc";
            routeValues = new RouteValueDictionary() { { "Namespaces", "Nop.Plugin.SMS.Smsc.Controllers" }, { "area", null } };
        }

        /// <summary>
        /// Install plugin
        /// </summary>
        public override void Install()
        {
            //settings
            var settings = new SmscSettings()
            {
                Enabled = false,
            };
            _settingService.SaveSetting(settings);

            //locales
            this.AddOrUpdatePluginLocaleResource("Plugins.Sms.Smsc.TestFailed", "Test message sending failed");
            this.AddOrUpdatePluginLocaleResource("Plugins.Sms.Smsc.TestSuccess", "Test message was sent");
            this.AddOrUpdatePluginLocaleResource("Plugins.Sms.Smsc.Fields.Enabled", "Enabled");
            this.AddOrUpdatePluginLocaleResource("Plugins.Sms.Smsc.Fields.Enabled.Hint", "Check to enable SMS provider");
            this.AddOrUpdatePluginLocaleResource("Plugins.Sms.Smsc.Fields.SenderName", "SenderName");
            this.AddOrUpdatePluginLocaleResource("Plugins.Sms.Smsc.Fields.SenderName.Hint", "Smsc SenderName");
            this.AddOrUpdatePluginLocaleResource("Plugins.Sms.Smsc.Fields.Password", "Password");
            this.AddOrUpdatePluginLocaleResource("Plugins.Sms.Smsc.Fields.Password.Hint", "Smsc password");
            this.AddOrUpdatePluginLocaleResource("Plugins.Sms.Smsc.Fields.PhoneNumber", "Phone number");
            this.AddOrUpdatePluginLocaleResource("Plugins.Sms.Smsc.Fields.PhoneNumber.Hint", "Your phone number");
            this.AddOrUpdatePluginLocaleResource("Plugins.Sms.Smsc.Fields.Username", "Username");
            this.AddOrUpdatePluginLocaleResource("Plugins.Sms.Smsc.Fields.Username.Hint", "Smsc username");
            this.AddOrUpdatePluginLocaleResource("Plugins.Sms.Smsc.Fields.TestMessage", "Message text");
            this.AddOrUpdatePluginLocaleResource("Plugins.Sms.Smsc.Fields.TestMessage.Hint", "Text of the test message");
            this.AddOrUpdatePluginLocaleResource("Plugins.Sms.Smsc.SendTest", "Send");
            this.AddOrUpdatePluginLocaleResource("Plugins.Sms.Smsc.SendTest.Hint", "Send test message");

            base.Install();
        }

        /// <summary>
        /// Uninstall plugin
        /// </summary>
        public override void Uninstall()
        {
            //settings
            _settingService.DeleteSetting<SmscSettings>();

            //locales
            this.DeletePluginLocaleResource("Plugins.Sms.Smsc.TestFailed");
            this.DeletePluginLocaleResource("Plugins.Sms.Smsc.TestSuccess");
            this.DeletePluginLocaleResource("Plugins.Sms.Smsc.Fields.Enabled");
            this.DeletePluginLocaleResource("Plugins.Sms.Smsc.Fields.Enabled.Hint");
            this.DeletePluginLocaleResource("Plugins.Sms.Smsc.Fields.SenderName");
            this.DeletePluginLocaleResource("Plugins.Sms.Smsc.Fields.SenderName.Hint");
            this.DeletePluginLocaleResource("Plugins.Sms.Smsc.Fields.Password");
            this.DeletePluginLocaleResource("Plugins.Sms.Smsc.Fields.Password.Hint");
            this.DeletePluginLocaleResource("Plugins.Sms.Smsc.Fields.PhoneNumber");
            this.DeletePluginLocaleResource("Plugins.Sms.Smsc.Fields.PhoneNumber.Hint");
            this.DeletePluginLocaleResource("Plugins.Sms.Smsc.Fields.Username");
            this.DeletePluginLocaleResource("Plugins.Sms.Smsc.Fields.Username.Hint");
            this.DeletePluginLocaleResource("Plugins.Sms.Smsc.Fields.TestMessage");
            this.DeletePluginLocaleResource("Plugins.Sms.Smsc.Fields.TestMessage.Hint");
            this.DeletePluginLocaleResource("Plugins.Sms.Smsc.SendTest");
            this.DeletePluginLocaleResource("Plugins.Sms.Smsc.SendTest.Hint");

            base.Uninstall();
        }
    }
}
