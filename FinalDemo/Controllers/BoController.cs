using FinalDemo.Domain.Abtracts;
using FinalDemo.Domain.Entities;
using FinalDemo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace FinalDemo.Controllers
{
    public class BoController : BaseController
    {
        private IBoRepository repositoryBo { get; set; }
        private ILopRepository repositoryLop { get; set; }
        public ActionResult Index()
        {
            return View();
        }
        public BoController(IBoRepository repoBo, ILopRepository repoLop)
        {
            repositoryBo = repoBo;
            repositoryLop = repoLop;
            base.Init();
        }
        public ActionResult IndexBo(string searchTerm)
        {
            if (string.IsNullOrEmpty(searchTerm))
            {
                BoViewModel model = new BoViewModel();
                model.Bos = repositoryBo.GetAllBo();
                return View(model);
            }
            else
            {
                BoViewModel model = new BoViewModel();
                model.Bos = repositoryBo.SelectBy(searchTerm);
                return View(model);
            }
        }
        public PartialViewResult SignInOutPanel()
        {
            return PartialView(base.CurrentUser);
        }
        public ActionResult CreateNewBo()
        {
            if (base.Auth())
            {
                LopViewModel lopView = new LopViewModel();
                lopView.Lops = repositoryLop.GetAllLop();
                ViewBag.ListOfCodes = new SelectList(lopView.Lops, "MaLop", "TenTV");
                ViewBag.Codes = "C";
                return View();
            }
            else
            {
                return RedirectToAction("ResponseServer", "Home");
            }
        }
        [HttpPost]
        public ActionResult CreateNewBo(Bo bo)
        {
            // tránh TH đặc biệt gõ đúng id
            if (base.Auth())
            {
                if (Request.Cookies["groupId"].Value.LastIndexOf("4") == 4) 
                {
                    bo.Khoa = 0;
                }
                else
                {
                    bo.Khoa = -1;
                }
                bo.TenNguoiTao = base.CurrentUser.Ten;
                bo.NgayDangBai = DateTime.Now;
                bo.MaNguoiTao = base.CurrentUser.MaTaiKhoan;
                int res = repositoryBo.CreateNewBo(bo);
                return RedirectToAction("CacBaiDang", "QuanLyCaNhan");
            }
            else
            {
                return RedirectToAction("ResponseServer", "Home");
            }
        }
        public ActionResult Delete(int id)
        {
            if (base.Auth())
            {
                int res = repositoryBo.DeleteBo(id, base.CurrentUser.MaTaiKhoan);
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
        public ActionResult EditEmpty(int id)
        {
            if (base.Auth())
            {
                BoViewModel boView = new BoViewModel();
                boView.Bos = repositoryBo.SelectByID(id, base.CurrentUser.MaTaiKhoan);
                if (boView.Bos.Count > 0)
                {
                    return View(boView);
                }
                else { 
                    return RedirectToAction("ResponseServer", "Home");
                }
            }
            else
            {
                return RedirectToAction("ResponseServer", "Home");
            }
        }
        [HttpPost]
        public ActionResult EditEmpty(Bo bo)
        {
            if (base.Auth())
            {
                int res = repositoryBo.EditBo(bo);
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
                BoViewModel model = new BoViewModel();
                model.Bos = repositoryBo.SelectByID(id);
                return View(model);
            //}
            //else
            //{
            //    return RedirectToAction("ResponseServer", "Home");
            //}
        }
        public ActionResult Search(string searchTerm)
        {
            BoViewModel model = new BoViewModel();
            model.Bos = repositoryBo.SelectBy(searchTerm);
            return View(model);
        }
        public JsonResult SearchAuto(string term)
        {
            List<string> data;
            data = repositoryBo.SelectAuto(term);
            return Json(data, JsonRequestBehavior.AllowGet);
        }
    }
}
