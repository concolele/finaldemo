using FinalDemo.Domain.Abtracts;
using FinalDemo.Domain.Entities;
using FinalDemo.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FinalDemo.Controllers
{
    public class LoaiController : Controller
    {
        //
        // GET: /Loai/
        private ILoaiRepository repository { get; set; }
        private IChiRepository repositoryChi { get; set; }
        public LoaiController(ILoaiRepository repo, IChiRepository repoChi)
        {
            repository = repo;
            repositoryChi = repoChi;
        }
        public ActionResult IndexLoai()
        {
            LoaiViewModel loaiView = new LoaiViewModel();
            loaiView.Loais = repository.GetAllLoai();
            return View(loaiView);
        }
        public ActionResult CreateNewLoai()
        {
            ChiViewModel chiView = new ChiViewModel();
            chiView.Chis = repositoryChi.GetAllChi();
            ViewBag.ListOfCodes = new SelectList(chiView.Chis, "MaChi", "TenTV");
            ViewBag.Codes = "C";
            return View();
        }
        [HttpPost]
        public ActionResult CreateNewLoai(Loai Loai, HttpPostedFileBase file)
        {
            if (file != null)
            {
                //file.SaveAs(HttpContext.Server.MapPath("~/Photos/")
                //                                      + file.FileName);
                //Loai.Image = file.FileName;
                string ImageName = System.IO.Path.GetFileName(file.FileName);
                string physicalPath = Server.MapPath("~/Photos/" + ImageName);

                // save image in folder
                file.SaveAs(physicalPath);
                Loai.Image = ImageName;
            }
            int res = repository.CreateNewLoai(Loai);
            return RedirectToAction("IndexLoai", "Loai");
        }
        public ActionResult Delete(int id)
        {
            int res = repository.DeleteLoai(id);
            return RedirectToAction("IndexLoai", "Loai");
        }
        public ActionResult Edit(int id)
        {
            //ChiViewModel chiView = new ChiViewModel();
            //chiView.Chis = repositoryChi.GetAllChi();
            //ViewBag.ListOfCodes = new SelectList(chiView.Chis, "MaChi", "TenTV");
            //ViewBag.Codes = "C";
            //return View();
            LoaiViewModel loaiView = new LoaiViewModel();
            loaiView.Loais = repository.SelectByID(id);
            return View(loaiView);
        }
        [HttpPost]
        public ActionResult Edit(Loai Loai, HttpPostedFileBase file)
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
            return RedirectToAction("IndexLoai", "Loai");
        }
        public ActionResult Details(int id)
        {
            LoaiViewModel model = new LoaiViewModel();
            model.Loais = repository.SelectByID(id);
            return View(model);
        }
        public ActionResult Search(string find)
        {
            LoaiViewModel model = new LoaiViewModel();
            model.Loais = repository.SelectBy(find);
            return View(model);
        }
    }
}
