using FinalDemo.Domain.Abtracts;
using FinalDemo.Domain.Entities;
using FinalDemo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FinalDemo.Controllers
{
    public class ChiController : BaseController
    {
        //
        // GET: /Chi/

        private IChiRepository repositoryChi { get; set; }
        private IHoRepository repositoryHo { get; set; }
        public ChiController(IHoRepository repoHo, IChiRepository repoChi)
        {
            repositoryHo = repoHo;
            repositoryChi = repoChi;
            base.Init();
        }
        public ActionResult IndexChi(string searchTerm)
        {
            if (string.IsNullOrEmpty(searchTerm))
            {
                ChiViewModel ChiView = new ChiViewModel();
                ChiView.Chis = repositoryChi.GetAllChi();
                return View(ChiView);
            }
            else
            {
                ChiViewModel model = new ChiViewModel();
                model.Chis = repositoryChi.Search(searchTerm);
                return View(model);
            }
        }
        public ActionResult CreateNewChi()
        {
            if (base.Auth())
            {
                HoViewModel hoView = new HoViewModel();
                hoView.Hos = repositoryHo.GetAllHo();
                ViewBag.ListOfCodes = new SelectList(hoView.Hos, "MaHo", "TenTV");
                ViewBag.Codes = "C";
                return View();
            }
            else
            {
                return RedirectToAction("ResponseServer", "Home");
            }
        }
        [HttpPost]
        public ActionResult CreateNewChi(Chi Chi)
        {
            if (base.Auth())
            {
                Chi.TenNguoiTao = base.CurrentUser.Ten;
                Chi.NgayDangBai = DateTime.Now;
                Chi.MaNguoiTao = base.CurrentUser.MaTaiKhoan;
                int res = repositoryChi.CreateNewChi(Chi);
                return RedirectToAction("CacBaiDang", "QuanLyCaNhan");
            }
            else
            {
                return RedirectToAction("ResponseServer", "Home");
            }
        }
        public PartialViewResult SignInOutPanel()
        {
            return PartialView(base.CurrentUser);
        }
        public ActionResult Delete(int id)
        {
            if (base.Auth())
            {
                int res = repositoryChi.Delete(id, base.CurrentUser.MaTaiKhoan);
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
                ChiViewModel ChiView = new ChiViewModel();
                ChiView.Chis = repositoryChi.SelectByID(id, base.CurrentUser.MaTaiKhoan);
                if (ChiView.Chis.Count > 0)
                {
                    return View(ChiView);
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
        public ActionResult EditEmpty(Chi Chi)
        {
            if (base.Auth())
            {
                int res = repositoryChi.Edit(Chi);
                return RedirectToAction("IndexChi", "Chi");
            }
            else
            {
                return RedirectToAction("CacBaiDang", "QuanLyCaNhan");
            }
        }
        public ActionResult Details(int id)
        {
            ChiViewModel model = new ChiViewModel();
            model.Chis = repositoryChi.SelectByID(id);
            return View(model);

        }
        public ActionResult Search(string searchTerm)
        {
            ChiViewModel model = new ChiViewModel();
            model.Chis = repositoryChi.Search(searchTerm);
            return View(model);
        }
        public JsonResult SearchAuto(string term)
        {
            List<string> data;
            data = repositoryChi.SelectAuto(term);
            return Json(data, JsonRequestBehavior.AllowGet);
        }
    }
}
