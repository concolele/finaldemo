using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Configuration;
using System.Net;
using System.Text.RegularExpressions;
using System.IO;
using System.Text;

namespace AuthTool
{
    public enum SmtpType
    {
        GMAIL = 1,
        YAHOO,
        AOL,
        LIVE,
        NULL
    }
    /// <summary>
    /// Summary description for Email
    /// </summary>
    public class Email
    {
        public ConfigEmail Config { get; set; }
        public string SendTo { get; set; }        
        
        public string Subject { get; set; }
        public string Body { get; set; }
        public Attachment File { get; set; }
        
        public List<string> BBC { get; set; }
        public List<string> CC { get; set; }
        
        public Email()
        {            
            BBC = new List<string>();
            CC = new List<string>();
        }
        public string Send()
        {
            try
            {
                if (!IsEmail(SendTo))
                {
                    return "Không đúng địa chỉ email";
                }
                string MailSender = Config.MailSender;
                string MailReceiver = Config.MailReceiver;
                string MailCC = Config.MailCC;
                string MailPassword = Config.MailP;
                SmtpClient smtp = getSmtpClient(Config.DomainMail); 

                MailMessage msg = new MailMessage(MailSender, SendTo, Subject, Body);

                if (CC.Count > 0)
                {
                    foreach (string c in CC)
                    {
                        if (IsEmail(c))
                        {
                            msg.CC.Add(c);
                        }
                    }
                }
                if (BBC.Count > 0)
                {
                    foreach (string bb in BBC)
                    {
                        if (IsEmail(bb))
                        {
                            msg.Bcc.Add(bb);
                        }
                    }
                }                
                
                if (!string.IsNullOrEmpty(MailReceiver))
                    msg.ReplyToList.Add(new MailAddress(MailReceiver));
                if (!string.IsNullOrEmpty(MailCC))
                    msg.CC.Add(MailCC);
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = new NetworkCredential(MailSender, MailPassword);
                msg.IsBodyHtml = true;

                if (File != null)
                    msg.Attachments.Add(File);
                                
                smtp.Send(msg);
                return "Gửi mail thành công";
            }
            catch (Exception ex)
            {
                return "Có lỗi: " + ex.Message;
            }
        }
        public void AttackFile(string path)
        {
            
            //using (StreamReader reader = new StreamReader(path))
            {
                File = new Attachment(path);
            }
            
        }
        private SmtpClient getSmtpClient(SmtpType type)
        {
            SmtpClient smtp;
            switch (type)
            {
                case SmtpType.YAHOO: 
                    smtp = new SmtpClient("smtp.mail.yahoo.com", 25);
                    smtp.EnableSsl = false;
                    break;
                case SmtpType.AOL: 
                    smtp = new SmtpClient("smtp.aol.com", 25);
                    smtp.EnableSsl = false;
                    break;
                case SmtpType.LIVE: 
                    smtp = new SmtpClient("smtp.live.com", 25);
                    smtp.EnableSsl = true;
                    break;                
                default: 
                    smtp = new SmtpClient("smtp.gmail.com", 587);
                    smtp.EnableSsl = true;
                    break;
            }
            return smtp;
        }
        public bool IsEmail(string email)
        {
            Regex regex = new Regex(@"^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$");
            Match match = regex.Match(email);
            if (match.Success)
                return true;
            return false;
        }        
    }
}