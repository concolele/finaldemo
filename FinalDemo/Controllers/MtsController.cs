//using FinalDemo.Domain.Abtracts;
//using FinalDemo.Domain.Concrete;
//using FinalDemo.Domain.Entities;
//using FinalDemo.Models;
//using System;
//using System.Collections.Generic;
//using System.IO;
//using System.Linq;
//using System.Web;
//using System.Web.Mvc;
//using System.Web.Script.Serialization;

//namespace FinalDemo.Controllers
//{
//    public class HomeController : Controller
//    {
//        private IProductRepository repository { get; set; }
//        private IMoiTruongSongRepository repositoryM { get; set; }
//        public HomeController(IProductRepository repo, IMoiTruongSongRepository repoM)
//        {
//            repository = repo;
//            repositoryM = repoM;
//        }
//        //[HttpGet]
//        public ActionResult Index()
//        {
//            ProductViewModel model = new ProductViewModel();
//            model.Products = repository.GetAllProduct();
//            ViewBag.Products = model.Products;
//            MoiTruongSongModel model1 = new MoiTruongSongModel();
//            model1.MoiTruong = repositoryM.GetAllMoiTruong();
//            ViewBag.Coor = model1.MoiTruong;
//            return View(model);
//        }

//        public ActionResult Create()
//        {
//            return View();
//        }
//        [HttpPost]
//        public ActionResult Create(Product product)
//        {
//            int res = repository.CreateNewProduct(product);
//            return RedirectToAction("Index", "Home");
//        }
//        public ActionResult Delete(int id)
//        {
//            int res = repository.DeleteProduct(id);
//            return RedirectToAction("Index", "Home");
//        }
//        public ActionResult Edit()
//        {
//            return View();
//        }
//        [HttpPost]
//        public ActionResult Edit(Product product)
//        {
//            int res = repository.EditProduct(product);
//            return RedirectToAction("Index", "Home");
//        }
//        public ActionResult Details(int id)
//        {
//            ProductViewModel model = new ProductViewModel();
//            model.Products = repository.SelectByID(id);
//            return View(model);
//        }
//        public ActionResult Search(string find)
//        {
//            ProductViewModel model = new ProductViewModel();
//            model.Products = repository.SelectBy(find);
//            return View(model);
//        }

//        [HttpPost]
//        public void InsertValue(string giaTri)
//        {
//            string query = "INSERT INTO ABC " + giaTri;
//            using (StreamWriter writer = new StreamWriter("E:\\text.txt"))
//            {
//                writer.WriteLine(query);
//            }
//        }

//        //[HttpPost]
//        public ActionResult ShowValue(string xVal, string yVal)
//        {
//            // Response.Write(xVal + "<br>" + yVal);
//            ProductViewModel model = new ProductViewModel();
//            model.Products = repository.SelectBy(xVal, yVal);
//            // ViewBag.Products = repository.SelectBy(xVal, yVal); 
//            return View(model);
//            ////string query = "INSERT INTO ABC " + xVal+ yVal;
//            ////using (StreamWriter writer = new StreamWriter("E:\\text.txt"))
//            //{
//            //  //  writer.WriteLine(query);
//            //}
//            //Product pro = new Product();
//            //pro.Name = xVal.ToString() + "-" + yVal.ToString();
//            //pro.Prices = 10;
//            //pro.ProductID = 1;
//            //pro.Amount = 10;
//            //pro.Category = "category";
//            ////JsonTextContent
//            //var json = new JavaScriptSerializer().Serialize(pro);
//            ////Console.WriteLine(json);
//            ////JsonResult result = Json(pro);
//            //Response.Write(json);
//            //return ;
//        }
//        //[HttpGet]
//        public ActionResult CreateNew(string xVal, string yVal, Product product)
//        {
//            int res = repository.CreateNew(xVal, yVal, product);

//            return RedirectToAction("Index", "Home"); ;
//        }
//        public ActionResult TestMap()
//        {
//            return View();
//        }
//    }
//}
