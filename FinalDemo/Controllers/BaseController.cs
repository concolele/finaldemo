using AuthTool;
using AuthTool.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FinalDemo.Controllers
{
    /// <summary>
    /// Controller dung cho viec Auth
    /// </summary>
    public class BaseController : Controller
    {
        private IAuthProvider AuthProvider;
        public TaiKhoan CurrentUser
        {
            get
            {
                return AuthProvider.CurrentUser;
            }
        }
        public BaseController()
        {
            AuthProvider = new AuthTool.Concrete.FormsAuthProvider();
        }

        /// <summary>
        /// Sử dụng khi controller kế thừa có 1 hàm khởi tạo khác
        /// </summary>
        public void Init()
        {
            AuthProvider = new AuthTool.Concrete.FormsAuthProvider();
        }

        public bool Auth()
        {
            string actionName = ControllerContext.RouteData.Values["action"].ToString();
            string controllerName = ControllerContext.RouteData.Values["controller"].ToString();

            //Kiểm tra đã đăng nhập hay chưa?
            if (AuthProvider.Authenticate() == false)// && !AuthProvider.KiemTraQuyen(controllerName, actionName)) //Chưa: redirect về trang đăng nhập
            {
                TempData["message"] = "Bạn chưa đăng nhập!"; //Hiển thị thông báo lên màn hình
                //Redirect("/NguoiDung/Index");
                //RedirectToAction("Index", "NguoiDung");
                //Response.Write("tạch đăng nhập");
                Response.Redirect("/Home/ResponseServer", true);//"/NguoiDung/Index/?returnUrl=" + HttpContext.Request.Url.AbsolutePath, true);
                return false;
            }
            
            
            //Nếu đã có
            //Kiểm tra quyền theo action va controller
            if (!AuthProvider.KiemTraQuyen(controllerName, actionName))
            {
                TempData["message"] = "Bạn không được quyền truy cập!"; //Hiển thị thông báo lên màn hình
                //Response.Write("Bạn không được quyền truy cập");
                //Response.Write("tạch check quyền");
                Response.Redirect("/Home/ResponseServer", true);
                //Response.Redirect("/NguoiDung/Index/?returnUrl=" + HttpContext.Request.Url.AbsolutePath, true);
                return false;
            }
            else
                //Response.Write("Bạn được quyền truy cập");
            return true;

        }        
        public void SignOut()
        {
            AuthProvider.SignOut();
            Response.Redirect("/NguoiDung/Index", true);//"/NguoiDung/Index/?returnUrl=" + HttpContext.Request.Url.AbsolutePath, true);
        }
    }
}
