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

        public void SendActiveMail(string activeKey, string emailReceive)
        {
            try
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

                    email.Send();

                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void TestMail(string emailReceive)
        {
            try
            {
                using (StreamReader reader = new StreamReader(RootPath + "Template/ActiveAccount.html"))
                {

                    Template template = new Template(reader.ReadToEnd(), '$', '$');
                    Email email = new Email();
                    email.Config = config;
                    email.Body = template.Render();
                    email.SendTo = emailReceive;
                    email.Subject = "Kích hoạt tài khoản";

                    email.Send();

                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }    
        public void SendForgotPassMail(string pass, string emailReceive)
        {
            using (StreamReader reader = new StreamReader(RootPath + "Template/ForgotPassword.html"))
            {

                Template template = new Template(reader.ReadToEnd(), '$', '$');
                template.Add("href", pass);
                Email email = new Email();
                email.Config = config;
                email.Body = template.Render();
                email.SendTo = emailReceive;
                email.Subject = "Mật khẩu của bạn";
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
