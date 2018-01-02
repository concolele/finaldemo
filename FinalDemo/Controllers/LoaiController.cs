using FinalDemo.Domain.Abtracts;
using FinalDemo.Domain.Entities;
using FinalDemo.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.WebControls;

namespace FinalDemo.Controllers
{
    public class LoaiController : BaseController
    {
        //
        // GET: /Loai/
        //private FileUpload FileUpload1 { get; set; }
        private ILoaiRepository repository { get; set; }
        private IChiRepository repositoryChi { get; set; }
        public LoaiController(ILoaiRepository repo, IChiRepository repoChi)
        {
            repository = repo;
            repositoryChi = repoChi;
            base.Init();
        }
        public ActionResult IndexLoai(string searchTerm)
        {
            if (string.IsNullOrEmpty(searchTerm))
            {
                LoaiViewModel loaiView = new LoaiViewModel();
                loaiView.Loais = repository.GetAllLoai();
                return View(loaiView);
            }
            else
            {
                LoaiViewModel model = new LoaiViewModel();
                model.Loais = repository.SelectBy(searchTerm);
                return View(model);
            }
        }
        public JsonResult SearchAuto(string term)
        {
            List<string> data;
            data = repository.SelectAuto(term);
            return Json(data, JsonRequestBehavior.AllowGet);
        }
        public PartialViewResult SignInOutPanel()
        {
            return PartialView(base.CurrentUser);
        }
        public ActionResult CreateNewLoai()
        {
            if (base.Auth())
            {
                ChiViewModel chiView = new ChiViewModel();
                chiView.Chis = repositoryChi.GetAllChi();
                ViewBag.ListOfCodes = new SelectList(chiView.Chis, "MaChi", "DPKH");
                ViewBag.Codes = "C";
                return View();
            }
            else
            {
                return RedirectToAction("ResponseServer", "Home");
            }
        }
        [HttpPost]
        public ActionResult CreateNewLoai(Loai Loai, HttpPostedFileBase file)
        {
            if (Request.Cookies["groupId"].Value.LastIndexOf("4") == 4)
            {
                Loai.Khoa = 0;
            }
            else
            {
                Loai.Khoa = -1;
            }
            if (file != null)
            {
                string ImageName = System.IO.Path.GetFileName(file.FileName);
                string ImageNameNew = ((DateTime.Now.ToString().Replace("/", "-")).Replace(":", "")).Replace(" ", "_") + ImageName.Replace(".",".").Replace(" ","");
                string physicalPath = Server.MapPath("~/Photos/" + ImageNameNew);
                // save image in folder
                file.SaveAs(physicalPath);
                Loai.Image = ImageNameNew;
            }
            else
            {
                Loai.Image = "pro.jpg";
            }
            Loai.TenNguoiTao = base.CurrentUser.Ten;
            Loai.NgayDangBai = DateTime.Now;
            Loai.MaNguoiTao = base.CurrentUser.MaTaiKhoan;
            int res = repository.CreateNewLoai(Loai);
            return RedirectToAction("CacBaiDang", "QuanLyCaNhan");
        }
        public ActionResult Delete(int id)
        {
            if (base.Auth()) 
            { 
                int res = repository.DeleteLoai(id, base.CurrentUser.MaTaiKhoan);
                if (res != 0)
                {
                    return RedirectToAction("CacBaiDang", "QuanLyCaNhan");
                }
                return RedirectToAction("ResponseServer", "Home");
            }
            else
            {
                return RedirectToAction("ResponseServer", "Home");
            }
        }
        public ActionResult Edit(int id)
        {
            if (base.Auth()) 
            {
                LoaiViewModel loaiView = new LoaiViewModel();
                loaiView.Loais = repository.SelectByID(id, base.CurrentUser.MaTaiKhoan);
                if (loaiView.Loais.Count > 0)
                {
                    return View(loaiView);
                }
                else
                {
                    return RedirectToAction("ResponseServer", "Home");
                }
            }
            else
            {
                return RedirectToAction("ResponseServer", "Home");
            }
        }
        [HttpPost]
        public ActionResult Edit(Loai Loai, HttpPostedFileBase file)
        {
            
            if (base.Auth())
            {
                if (file != null)
                {
                    string ImageName = System.IO.Path.GetFileName(file.FileName);
                    string physicalPath = Server.MapPath("~/Photos/" + ImageName);

                    // save image in folder
                    file.SaveAs(physicalPath);
                    Loai.Image = ImageName;
                }
                int res = repository.EditLoai(Loai);
                return RedirectToAction("CacBaiDang", "QuanLyCaNhan");
            }
            else
            {
                return RedirectToAction("ResponseServer", "Home");
            }
        }
        public ActionResult Details(int id)
        {
            //if (base.Auth())
            //{
                LoaiViewModel model = new LoaiViewModel();
                model.Loais = repository.SelectByID(id);
                return View(model);
            //}
            //else
            //{
            //    return RedirectToAction("ResponseServer", "Home");
            //}
        }
        public ActionResult Search(string find)
        {
            LoaiViewModel model = new LoaiViewModel();
            model.Loais = repository.SelectBy(find);
            return View(model);
        }
    }
}
