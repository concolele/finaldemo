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
    public class HoController : BaseController
    { 
        private IHoRepository repositoryHo { get; set; }
        private IBoRepository repositoryBo { get; set; }
        public ActionResult IndexHo(string searchTerm)
        {
            if (string.IsNullOrEmpty(searchTerm))
            {
                HoViewModel hoView = new HoViewModel();
                hoView.Hos = repositoryHo.GetAllHo();
                return View(hoView);
            }
            else {
                HoViewModel model = new HoViewModel();
                model.Hos = repositoryHo.SelectBy(searchTerm);
                return View(model);
            }
        }
        public HoController(IBoRepository repoBo, IHoRepository repoHo)
        {
            repositoryBo = repoBo;
            repositoryHo = repoHo;
            base.Init();
        }
        public ActionResult CreateNewHo()
        {
            if (base.Auth())
            {
                BoViewModel hoView = new BoViewModel();
                hoView.Bos = repositoryBo.GetAllBo();
                ViewBag.ListOfCodes = new SelectList(hoView.Bos, "MaBo", "TenTV");
                ViewBag.Codes = "C";
                return View();
            }
            else
            {
                return RedirectToAction("ResponseServer", "Home");
            }
        }
        [HttpPost]
        public ActionResult CreateNewHo(Ho ho)
        {
            if (base.Auth())
            {
                ho.TenNguoiTao = base.CurrentUser.Ten;
                ho.NgayDangBai = DateTime.Now;
                ho.MaNguoiTao = base.CurrentUser.MaTaiKhoan;
                int res = repositoryHo.CreateNewHo(ho);
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
                int res = repositoryHo.DeleteHo(id, base.CurrentUser.MaTaiKhoan);
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
                HoViewModel HoView = new HoViewModel();
                HoView.Hos = repositoryHo.SelectByID(id, base.CurrentUser.MaTaiKhoan);
                if (HoView.Hos.Count > 0)
                {
                    return View(HoView);
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
        public ActionResult EditEmpty(Ho Ho)
        {
            if (base.Auth())
            {
                int res = repositoryHo.EditHo(Ho);
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
                HoViewModel model = new HoViewModel();
                model.Hos = repositoryHo.SelectByID(id);
                return View(model);
            //}
            //else
            //{
            //    return RedirectToAction("ResponseServer", "Home");
            //}
        }
        public ActionResult Search(string searchTerm)
        {
            HoViewModel model = new HoViewModel();
            model.Hos = repositoryHo.SelectBy(searchTerm);
            return View(model);
        }
        public JsonResult SearchAuto(string term)
        {
            List<string> data;
            data = repositoryHo.SelectAuto(term);
            return Json(data, JsonRequestBehavior.AllowGet);
        }
    }
}
