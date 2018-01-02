using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Antlr4.StringTemplate;
using System.IO;

namespace AuthTool
{
    public class EmailHelper
    {
        ConfigEmail config = new ConfigEmail();
        public string RootPath { get; set; }
        public EmailHelper(string rootPath)
        {
            config.DomainMail = SmtpType.GMAIL;
            config.MailSender = "skyx304@gmail.com";
            config.MailReceiver = "skyx304@gmail.com";
            config.MailP = "xomnhala3112";
            RootPath = rootPath;
        }

        public void SendActiveMail(string activeKey,string emailReceive)
        {
            using (StreamReader reader = new StreamReader(RootPath + "Template/ActiveAccount.html"))
            {
                
                Template template = new Template(reader.ReadToEnd(), '$', '$');
                template.Add("href", activeKey);
                Email email = new Email();
                email.Config = config;
                email.Body = template.Render();
                email.SendTo = emailReceive;
                email.Subject = "Kích hoạt tài khoản";
                try
                {
                    email.Send();
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
        }
    }
}
