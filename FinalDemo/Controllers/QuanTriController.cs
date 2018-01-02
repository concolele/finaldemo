using AuthTool;
using AuthTool.Abstract;
using FinalDemo.Controllers;
using FinalDemo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FinalDemo.Controllers
{
    public class QuanTriController : BaseController
    {
        private IAuthProvider AuthProvider;
        public QuanTriController(IAuthProvider auth)
        {
            AuthProvider = auth;
        }
        /*
        public QuanTriController(interface abc)
        {
            base.Init();
        }
         */
        //
        // GET: /QuanTri/

        public ActionResult Index()
        {
            //Gọi hàm kiểm tra người dùng có được quyền truy cập chức năng này hay không?
            if (base.Auth())
            {
                //Response.Write(base.CurrentUser.Ten);
                //AuthProvider.ActiveAcount(maTaiKhoan);
                
                return View();
            }
            else
            {
                return RedirectToAction("ResponseServer", "Home");
            }
        }
        public ActionResult GetAllTaiKhoan()
        {

            return View(AuthProvider.SelectAll());
        }
        public ActionResult PhanQuyen(int id, string doiTuong)
        {
            ChucNangViewModel model = new ChucNangViewModel();
            model.AllChucNang = AuthProvider.SelectAllChucNang();
            model.SelectedChucNang = new List<ChucNang>();
            UserGroup userGroup = AuthProvider.GetIdGroup(id);
            model.MaNhom = userGroup.GroupId.HasValue ? userGroup.GroupId.Value : -1;
            model.SelectedChucNang = AuthProvider.GetPermissions(model.MaNhom, doiTuong);
            model.MaDoiTuong = id;
            model.KieuDoiTuong = doiTuong;
            //Lấy danh sách quyền hiện tại của người dùng. Nếu NULL thì new, ngược lại thì gấn vào SelectedChucNang
            //model.SelectedChucNang = new List<ChucNang>();//Với 1 người dùng cụ thể thì cần lấy từ DB
            return View(model);
        }
        [HttpPost]
        public ActionResult PhanQuyen(ChucNangViewModel model)
        {           
            //Lấy danh sách các quyền hiện có trong CSDL (A)
            //So sánh với các quyền mới (B)
            //Nếu có trong A mà không có trong B thì: delete
            //Nếu có trong B mà không có trong A thì insert

            //int idNhomNguoiDung = 1;
            foreach (int idChucNang in model.PostedChucNangs.ChucNangSelect)
            {
                AuthProvider.SavePermission(model.MaDoiTuong,model.KieuDoiTuong, idChucNang);
            }
            AuthProvider.DeletePermission(model.MaDoiTuong, model.KieuDoiTuong, model.PostedChucNangs.ChucNangSelect.ToList());
            TempData["msg"] = "Phân quyền thành công";
            return RedirectToAction("Index");
        }
        public ActionResult KhoaTaiKhoan(int id)
        {
            AuthProvider.KhoaTaiKhoan(id);
            return RedirectToAction("GetAllTaiKhoan","QuanTri");
        }
        public ActionResult GetAllChucNang() {

            return View(AuthProvider.SelectAllChucNang()); 
        }
        public ActionResult PhanNhom(int id)
        {
            PhanNhomViewModel model = new PhanNhomViewModel();
            model.AllGroup = AuthProvider.SelectAllGroup();
            model.SelectedGroup = AuthProvider.GetPermissionGroups(id);
            model.MaDoiTuong = id;
            //Lấy danh sách quyền hiện tại của người dùng. Nếu NULL thì new, ngược lại thì gấn vào SelectedChucNang
            //model.SelectedChucNang = new List<ChucNang>();//Với 1 người dùng cụ thể thì cần lấy từ DB
            return View(model);
        }
        [HttpPost]
        public ActionResult PhanNhom(PhanNhomViewModel model)
        {
            //Lấy danh sách các quyền hiện có trong CSDL (A)
            //So sánh với các quyền mới (B)
            //Nếu có trong A mà không có trong B thì: delete
            //Nếu có trong B mà không có trong A thì insert

            //int idNhomNguoiDung = 1;
            foreach (int idGroup in model.PostedGroups.NhomSelect)
            {
                AuthProvider.SavePermissionGroup(model.MaDoiTuong, idGroup);
            }
            AuthProvider.DeletePermissionGroup(model.MaDoiTuong, model.PostedGroups.NhomSelect.ToList());
            TempData["msg"] = "Phân nhóm thành công";
            return RedirectToAction("Index");
        }
    }
}
