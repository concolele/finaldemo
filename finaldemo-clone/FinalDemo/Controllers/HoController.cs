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
    public class HoController : Controller
    {
        //
        // GET: /Ho/

        private IHoRepository repositoryHo { get; set; }
        private IBoRepository repositoryBo { get; set; }
        public ActionResult IndexHo()
        {
            HoViewModel hoView = new HoViewModel();
            hoView.Hos = repositoryHo.GetAllHo();
            return View(hoView);
        }
        public HoController(IBoRepository repoBo, IHoRepository repoHo)
        {
            repositoryBo = repoBo;
            repositoryHo = repoHo;
        }

        public ActionResult CreateNewHo()
        {
            BoViewModel hoView = new BoViewModel();
            hoView.Bos = repositoryBo.GetAllBo();
            ViewBag.ListOfCodes = new SelectList(hoView.Bos, "MaBo", "TenTV");
            ViewBag.Codes = "C";
            return View();
        }
        [HttpPost]
        public ActionResult CreateNewHo(Ho ho)
        {
            int res = repositoryHo.CreateNewHo(ho);
            return RedirectToAction("IndexHo", "Ho");
        }
        public ActionResult Delete(int id)
        {
            int res = repositoryHo.DeleteHo(id);
            return RedirectToAction("IndexHo", "Ho");
        }
        public ActionResult EditEmpty(int id)
        {
            HoViewModel HoView = new HoViewModel();
            HoView.Hos = repositoryHo.SelectByID(id);
            return View(HoView);
        }
        [HttpPost]
        public ActionResult EditEmpty(Ho Ho)
        {
            int res = repositoryHo.EditHo(Ho);
            return RedirectToAction("IndexHo", "Ho");
        }
        public ActionResult Details(int id)
        {
            HoViewModel model = new HoViewModel();
            model.Hos = repositoryHo.SelectByID(id);
            return View(model);
        }
        public ActionResult Search(string find)
        {
            HoViewModel model = new HoViewModel();
            model.Hos = repositoryHo.SelectBy(find);
            return View(model);
        }
    }
}
