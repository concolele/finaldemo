using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AuthTool
{
    public class ConfigEmail
    {
        public string MailSender { get; set; }
        public string MailReceiver { get; set; }
        public string MailCC { get; set; }
        public string MailP { get; set; }
        public SmtpType DomainMail { get; set; }
        public ConfigEmail()
        {
            DomainMail = SmtpType.NULL;
        }
        public bool HasConfig()
        {
            if (string.IsNullOrEmpty(MailSender))
                return false;            
            if (string.IsNullOrEmpty(MailP))
                return false;
            if (DomainMail == SmtpType.NULL)
                return false;
            return true;
        }
    }
}
