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
    public class BoController : Controller
    {
        //
        // GET: /Bo/
        private IBoRepository repositoryBo { get; set; }

        public ActionResult Index()
        {
            return View();
        }
        public BoController(IBoRepository repoBo)
        {
            repositoryBo = repoBo;
        }

        public ActionResult IndexBo()
        {
            BoViewModel model = new BoViewModel();
            model.Bos = repositoryBo.GetAllBo();
            return View(model);
        }
        public ActionResult CreateNewBo()
        {
            return View();
        }
        [HttpPost]
        public ActionResult CreateNewBo(Bo bo)
        {
            int res = repositoryBo.CreateNewBo(bo);
            return RedirectToAction("IndexBo", "Bo");
        }
        public ActionResult Delete(int id)
        {
            int res = repositoryBo.DeleteBo(id);
            return RedirectToAction("IndexBo", "Bo");
        }
        public ActionResult Edit(int id)
        {
            BoViewModel boView = new BoViewModel();
            boView.Bos = repositoryBo.SelectByID(id);
            return View(boView);
        }
        [HttpPost]
        public ActionResult Edit(int id, Bo bo)
        {
            BoViewModel boView = new BoViewModel();
            boView.Bos = repositoryBo.SelectByID(id);
            int res = repositoryBo.EditBo(bo);
            if (res > 0) {               
                return RedirectToAction("IndexBo", "Bo");
            }
            else
            {
                return View(boView);
            }
            //return RedirectToAction("Index", "Home");
        }

        public ActionResult EditEmpty(int id)
        {
            BoViewModel boView = new BoViewModel();
            boView.Bos = repositoryBo.SelectByID(id);
            return View(boView);
        }
        [HttpPost]
        public ActionResult EditEmpty(Bo bo)
        {
            int res = repositoryBo.EditBo(bo);
            
                return RedirectToAction("IndexBo", "Bo");
           
            
        }
        public ActionResult Details(int id)
        {
            BoViewModel model = new BoViewModel();
            model.Bos = repositoryBo.SelectByID(id);
            return View(model);
        }
        public ActionResult Search(string find)
        {
            BoViewModel model = new BoViewModel();
            model.Bos = repositoryBo.SelectBy(find);
            return View(model);
        }
    }
}
