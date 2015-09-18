using System;
using System.Web.Mvc;
using Nop.Core.Plugins;
using Nop.Plugin.SMS.Smsc.Models;
using Nop.Services.Configuration;
using Nop.Services.Localization;
using Nop.Web.Framework.Controllers;

namespace Nop.Plugin.SMS.Smsc.Controllers
{
    [AdminAuthorize]
    public class SmsSmscController : Controller
    {
        private readonly SmscSettings _smscSettings;
        private readonly ISettingService _settingService;
        private readonly IPluginFinder _pluginFinder;
        private readonly ILocalizationService _localizationService;

        public SmsSmscController(SmscSettings smscSettings,
            ISettingService settingService, IPluginFinder pluginFinder,
            ILocalizationService localizationService)
        {
            this._smscSettings = smscSettings;
            this._settingService = settingService;
            this._pluginFinder = pluginFinder;
            this._localizationService = localizationService;
        }

        [ChildActionOnly]
        public ActionResult Configure()
        {
            var model = new SmsSmscModel
            {
                Enabled = _smscSettings.Enabled,
                PhoneNumber = _smscSettings.PhoneNumber,
                SenderName = _smscSettings.SenderName,
                Username = _smscSettings.Username,
                Password = _smscSettings.Password
            };
            return View("Nop.Plugin.SMS.Smsc.Views.SmsSmsc.Configure", model);
        }

        [ChildActionOnly]
        [HttpPost, ActionName("Configure")]
        [FormValueRequired("save")]
        public ActionResult ConfigurePOST(SmsSmscModel model)
        {
            if (!ModelState.IsValid)
            {
                return Configure();
            }

            //save settings
            _smscSettings.Enabled = model.Enabled;
            _smscSettings.PhoneNumber = model.PhoneNumber;
            _smscSettings.SenderName = model.SenderName;
            _smscSettings.Username = model.Username;
            _smscSettings.Password = model.Password;
            _settingService.SaveSetting(_smscSettings);

            return View("Nop.Plugin.SMS.Smsc.Views.SmsSmsc.Configure", model);
        }

        [ChildActionOnly]
        [HttpPost, ActionName("Configure")]
        [FormValueRequired("test-sms")]
        public ActionResult TestSms(SmsSmscModel model)
        {
            try
            {
                if (String.IsNullOrEmpty(model.TestMessage))
                {
                    model.TestSmsResult = "Enter test message";
                }
                else
                {
                    var pluginDescriptor = _pluginFinder.GetPluginDescriptorBySystemName("Mobile.SMS.Smsc");
                    if (pluginDescriptor == null)
                        throw new Exception("Cannot load the plugin");
                    var plugin = pluginDescriptor.Instance() as SmscSmsProvider;
                    if (plugin == null)
                        throw new Exception("Cannot load the plugin");

                    model.TestSmsResult = plugin.SendSms(model.TestMessage, model.SenderName, model.PhoneNumber);
                }
            }
            catch(Exception exc)
            {
                model.TestSmsResult = exc.ToString();
            }

            return View("Nop.Plugin.SMS.Smsc.Views.SmsSmsc.Configure", model);
        }
    }
}