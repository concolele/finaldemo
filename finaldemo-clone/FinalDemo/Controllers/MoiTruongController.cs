using FinalDemo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FinalDemo.Controllers
{
    public class MoiTruongController
    {
        public ActionResult Index()
        {
            LoaiViewModel model = new LoaiViewModel();
            model.Loais = repository.GetAllLoai();
            return View(model);
        }

    }
}