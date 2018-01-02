using AuthTool;
using AuthTool.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FinalDemo.Controllers
{
    public class NguoiDungController : Controller
    {
        private IAuthProvider AuthProvider;
        public NguoiDungController(IAuthProvider authProvider)
        {
            AuthProvider = authProvider;
        }
        //
        // GET: /NguoiDung/

        public ActionResult Index(string returnUrl = null)
        {
            TempData["returnUrl"] = returnUrl;
            return View();
        }

        [HttpPost]
        public ViewResult Login(TaiKhoan taiKhoan, string returnUrl)
        {
            if (taiKhoan != null)
            {                
                if (AuthProvider.Authenticate(taiKhoan.TenTaiKhoan, taiKhoan.MatKhau))
                {
                    //Session["MaTaiKhoan"] = taiKhoan.MaTaiKhoan;
                    Response.Redirect(!string.IsNullOrEmpty(returnUrl) ? returnUrl : "/Home/Index");
                }
            }
            return View();
        }
        public ActionResult RegisterUser()
        {
            //Response.Write(Server.MapPath("."));
            //Response.Write("<br>");
            //Response.Write(Server.MapPath("~"));
            return View();
        }
        [HttpPost]
        public ActionResult RegisterUser(TaiKhoan tk)
        {
            if (!ModelState.IsValid)
            {
                string maKichHoat = AuthProvider.CreateMaKichHoat(tk);
                tk.MaKichHoat = maKichHoat;
                tk.NgayKichHoat = DateTime.Now;
                tk.Khoa = false;
                AuthProvider.CreateNewUser(tk);
                //Response.Write(maKichHoat);
                //Gọi hàm send mail (template)
                //Link kích hoạt: http://bdms.vn/NguoiDung/KichHoat/?maKichHoat
                EmailHelper mailHelper = new EmailHelper(Server.MapPath("~"));
                try
                {
                    mailHelper.SendActiveMail(maKichHoat, tk.Email);
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
            }
            return RedirectToAction("WaitConfirm","NguoiDung");
        }
        
        public ActionResult KichHoat(string maKichHoat)
        {
            //Response.Write(maKichHoat);
            bool result = AuthProvider.ActiveAcount(maKichHoat);
            //result == true: kich hoat thanh cong
            if (result == true)
            {
                return RedirectToAction("Index","NguoiDung");
            }
            //nguoc lai: tk da kich hoat hoac ko ton tai ma kich hoat nay
            else
            {
                Response.Write("tk da kich hoat hoac ko ton tai ma kich hoat nay");
            }
            return null;
        }

        public ActionResult TesttMail()
        {
            Response.Write(Server.MapPath("."));
            Response.Write("<br>");
            Response.Write(Server.MapPath("~"));
            return View();
        }
        [HttpPost]
        public ActionResult TesttMail(string Mail)
        {
            if (ModelState.IsValid)
            {
               //Response.Write(maKichHoat);
                //Gọi hàm send mail (template)
                //Link kích hoạt: http://bdms.vn/NguoiDung/KichHoat/?maKichHoat
                EmailHelper mailHelper = new EmailHelper(Server.MapPath("~"));
                try
                {
                    mailHelper.TestMail(Mail);
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
            }
            return RedirectToAction("WaitConfirm", "NguoiDung");
        }
        public ActionResult WaitConfirm()
        {
            return View();
        }
        
        public ActionResult ForgotPassword()
        {
            return View();
        }
        [HttpPost]
        public ActionResult ForgotPassword(TaiKhoan tk)
        {
            if (AuthProvider.ForgotPassword(tk.Email))
            {
                string pass = AuthProvider.CreatePassword(tk);
                tk.MatKhau = pass;                
                AuthProvider.UpdateUser(tk);
                EmailHelper mailHelper = new EmailHelper(Server.MapPath("~"));
                mailHelper.SendForgotPassMail(pass, tk.Email);
               
                return RedirectToAction("WaitConfirm", "NguoiDung");
            }
            else
            {
                Response.Write("email sai hoặc ko tồn tại: "+tk.Email);
            }
            return null;
        }
    }
}
