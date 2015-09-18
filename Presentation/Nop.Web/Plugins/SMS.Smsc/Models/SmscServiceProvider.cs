using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.ServiceModel;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using Nop.Plugin.SMS.Smsc.SmscService;

namespace Nop.Plugin.SMS.Smsc.Models
{
    public class SmscServiceProvider
    {
        private readonly SmscSettings _smscSettings;
        public SmscServiceProvider(SmscSettings smsSettings)
        {
            _smscSettings = smsSettings;
        }

        #region Sender info

        /// <summary>
        /// логин клиента
        /// </summary>
        private string SmscLogin
        {
            get { return _smscSettings.Username; }
        }

        private string _pwdHash;
        /// <summary>
        /// пароль или MD5-хеш пароля в нижнем регистре
        /// </summary>
        private string SmscPassword
        {
            get
            {
                return LazyInitializer.EnsureInitialized(ref _pwdHash, () =>
                {
                    return _smscSettings.Password;

                    using (MD5 md5Hash = MD5.Create())
                    {
                        return GetMd5Hash(md5Hash, _smscSettings.Password).ToLowerInvariant();
                    }
                });
            }
        }
        private static string GetMd5Hash(MD5 md5Hash, string input)
        {
            // Convert the input string to a byte array and compute the hash.
            byte[] data = md5Hash.ComputeHash(Encoding.UTF8.GetBytes(input));

            // Create a new Stringbuilder to collect the bytes
            // and create a string.
            StringBuilder sBuilder = new StringBuilder();

            // Loop through each byte of the hashed data 
            // and format each one as a hexadecimal string.
            for (int i = 0; i < data.Length; i++)
            {
                sBuilder.Append(i.ToString("x2"));
            }

            // Return the hexadecimal string.
            return sBuilder.ToString();
        }

        /// <summary>
        /// Отрпавитель
        /// </summary>
        private string SmscSenderName
        {
            get { return _smscSettings.SenderName; }
        }


        #endregion


        public string SendSms(string phones, string message)
        {
            using (ServiceSoapClient client = new ServiceSoapClient(new BasicHttpBinding(), new EndpointAddress("http://smsc.ru/sys/soap.php")))
            {
                client.Open();

                SendResponseType sendResponseType = client.send_sms(SmscLogin, SmscPassword, phones, message, Guid.NewGuid().ToString(), SmscSenderName, "0");
                if (!String.IsNullOrEmpty(sendResponseType.error))
                {
                    return ((ResultEnum)int.Parse(sendResponseType.error)).ToString();
                }

                return ResultEnum.Socceed.ToString();
            }
        }

        public string GetBalance()
        {
            using (ServiceSoapClient client = new ServiceSoapClient(new BasicHttpBinding(), new EndpointAddress("http://smsc.ru/sys/soap.php")))
            {
                client.Open();

                BalanceResponseType balanceResponseType = client.get_balance(SmscLogin, SmscPassword);
                return balanceResponseType.balance;
            }
        }
    }

    public enum ResultEnum
    {
        Socceed = 0,
        ParamsErr = 1,
        IncorrectLoginOrPass = 2,
        BalanceError = 3,
        IpBlockedRequestMulti = 4,
        IncorrectDateFormat = 5,
        SmsRejected = 6,
        PhoneIncorrect = 7,
        IncorrectPhone = 8,
        MoreThanOneSimpleRequest = 9
    }
}
