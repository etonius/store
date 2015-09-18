
using Nop.Core.Configuration;

namespace Nop.Plugin.SMS.Smsc
{
    public class SmscSettings : ISettings
    {
        /// <summary>
        /// Gets or sets the value indicting whether this SMS provider is enabled
        /// </summary>
        public bool Enabled { get; set; }

        /// <summary>
        /// Gets or sets the Smsc phone number
        /// </summary>
        public string PhoneNumber { get; set; }

        /// <summary>
        /// Gets or sets the Smsc SenderName
        /// </summary>
        public string SenderName { get; set; }

        /// <summary>
        /// Gets or sets the Smsc username
        /// </summary>
        public string Username { get; set; }

        /// <summary>
        /// Gets or sets the Smsc password
        /// </summary>
        public string Password { get; set; }
    }
}