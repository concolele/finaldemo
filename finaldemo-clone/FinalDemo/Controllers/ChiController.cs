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
    public class ChiController : Controller
    {
        //
        // GET: /Chi/

        private IChiRepository repositoryChi { get; set; }
        private IHoRepository repositoryHo { get; set; }
        public ChiController(IHoRepository repoHo, IChiRepository repoChi)
        {
            repositoryHo = repoHo;
            repositoryChi = repoChi;
        }
        public ActionResult IndexChi()
        {
            ChiViewModel ChiView = new ChiViewModel();
            ChiView.Chis = repositoryChi.GetAllChi();
            return View(ChiView);
        }
        public ActionResult CreateNewChi()
        {
            HoViewModel hoView = new HoViewModel();
            hoView.Hos = repositoryHo.GetAllHo();
            ViewBag.ListOfCodes = new SelectList(hoView.Hos, "MaHo", "TenTV");
            ViewBag.Codes = "C";
            return View();
        }
        [HttpPost]
        public ActionResult CreateNewChi(Chi Chi)
        {
            int res = repositoryChi.CreateNewChi(Chi);
            return RedirectToAction("IndexChi", "Chi");
        }
        public ActionResult Delete(int id)
        {
            int res = repositoryChi.Delete(id);
            return RedirectToAction("IndexChi", "Chi");
        }
        public ActionResult EditEmpty(int id)
        {
            ChiViewModel ChiView = new ChiViewModel();
            ChiView.Chis = repositoryChi.SelectByID(id);
            return View(ChiView);
        }
        [HttpPost]
        public ActionResult EditEmpty(Chi Chi)
        {
            int res = repositoryChi.Edit(Chi);
            return RedirectToAction("IndexChi", "Chi");
        }
        public ActionResult Details(int id)
        {
            ChiViewModel model = new ChiViewModel();
            model.Chis = repositoryChi.SelectByID(id);
            return View(model);
        }
        public ActionResult Search(string find)
        {
            ChiViewModel model = new ChiViewModel();
            model.Chis = repositoryChi.Search(find);
            return View(model);
        }
    }
}
