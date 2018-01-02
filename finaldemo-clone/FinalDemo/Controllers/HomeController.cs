using FinalDemo.Domain.Abtracts;
using FinalDemo.Domain.Concrete;
using FinalDemo.Domain.Entities;
using FinalDemo.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace FinalDemo.Controllers
{
    public class HomeController : Controller
    {
        private ILoaiRepository repository { get; set; }
        private IMoiTruongSongRepository repositoryM { get; set; }
        private IPhanBoRepository repositoryPhanBo { get; set; }
        private IBoRepository repositoryBo { get; set; }
        private IHoRepository repositoryHo { get; set; }
        private IChiRepository repositoryChi { get; set; }
        public HomeController(ILoaiRepository repo, IMoiTruongSongRepository repoM, IPhanBoRepository repositoryPB, IBoRepository repoBo, IHoRepository repoHo, IChiRepository repoChi)
        {
            repository = repo;
            repositoryM = repoM;
            repositoryPhanBo = repositoryPB;
            repositoryBo = repoBo;
            repositoryHo = repoHo;
            repositoryChi = repoChi;
        }
        //[HttpGet]
        public ActionResult Index()
        {
            LoaiViewModel model = new LoaiViewModel();
            model.Loais = repository.GetAllLoai();
            MoiTruongSongModel model1 = new MoiTruongSongModel();
            model1.MoiTruong = repositoryM.GetAllMoiTruong();
            ViewBag.Coor = model1.MoiTruong;
            return View(model);
        }

        public ActionResult View(int x, int y)
        {
            MoiTruongSong moiTruong = repositoryM.GetMoiTruongByToaDo(x, y);
            PhanBoViewModel phanBoViewModel = new PhanBoViewModel();
            StringBuilder sb = new StringBuilder();
            sb.Append("<table border='1'>");
            sb.Append("<tr><td>Mã Loài</td><td>Tên Loài</td><td>Tỉ Lệ Phân Bố</td><td>Mật Độ</td><td>Số Lượng Cá Thể</td><td>Action</td></tr>");
            phanBoViewModel.PhanBos = repositoryPhanBo.GetAllPhanBo(moiTruong.MaVung);
            foreach (PhanBo phanBo in phanBoViewModel.PhanBos)
            {
                List<Loai> loai = repository.SelectByID(phanBo.MaLoai);
                string tenLoai = loai[0].TenTG;
                sb.AppendFormat("<tr><td>{0}</td><td>{1}</td><td>{2}</td><td>{3}</td><td>{4}</td><td><input type= 'submit' value= 'edit' /></td></tr>", phanBo.MaLoai, tenLoai, phanBo.TiLePhanBo, phanBo.MatDo, phanBo.SoLuongCaThe);
            }
            sb.Append("</table>");
            Response.Write(sb.ToString());
            return null; 
        }
        public ActionResult GetAllBos()
        {
            BoViewModel boView = new BoViewModel();
            StringBuilder sb = new StringBuilder();
            boView.Bos = repositoryBo.GetAllBo();
            foreach (Bo viewBo in boView.Bos)
            {
                sb.AppendFormat("<option value='{0}'>{1}</option>", viewBo.MaBo, viewBo.TenTV);
            }
            Response.Write(sb);
            return null; 
        }

        public ActionResult GetAllHosByBo(int maBo)
        {
            HoViewModel hoView = new HoViewModel();
            StringBuilder sb = new StringBuilder();
            sb.Append("<option value=''>Chọn họ</option>");
            hoView.Hos = repositoryHo.GetAllHosByBo(maBo);
            foreach (Ho viewHo in hoView.Hos)
            {
                sb.AppendFormat("<option value='{0}'>{1}</option>", viewHo.MaHo, viewHo.TenTV);
            }
            //System.IO.File.WriteAllText(@"E:\Log.txt", sb.ToString());
            Response.Write(sb);
            return null;
        }

        public ActionResult GetAllChisByHo(int maHo)
        {
            ChiViewModel chiView = new ChiViewModel();
            StringBuilder sb = new StringBuilder();
            sb.Append("<option value=''>Chọn chi</option>");
            chiView.Chis = repositoryChi.GetAllChisByHo(maHo);
            foreach (Chi viewChi in chiView.Chis)
            {
                sb.AppendFormat("<option value='{0}'>{1}</option>", viewChi.MaChi, viewChi.TenTV);
            }
            //System.IO.File.WriteAllText(@"E:\Log.txt", sb.ToString());
            Response.Write(sb);
            return null;
        }

        public ActionResult GetAllLoaisByChi(int maChi)
        {
            LoaiViewModel LoaiView = new LoaiViewModel();
            StringBuilder sb = new StringBuilder();
            sb.Append("<option value=''>Chọn loài</option>");
            LoaiView.Loais = repository.GetAllLoaisByChi(maChi);
            foreach (Loai viewLoai in LoaiView.Loais)
            {
                sb.AppendFormat("<option value='{0}'>{1}</option>", viewLoai.MaLoai, viewLoai.TenTG);
            }
            //System.IO.File.WriteAllText(@"E:\Log.txt", sb.ToString());
            Response.Write(sb);
            return null;
        }
        public ActionResult AddPhanBo(int x, int y, PhanBo phanBo)
        {
            //System.IO.File.WriteAllText(@"E:\Log.txt",  ""+maLoai+x+y+vungPhanBo+tiLePhanBo+matDo+SLCT);
            int res = repositoryPhanBo.CreateNewPhanBo(x, y, phanBo);
            //System.IO.File.WriteAllText(@"E:\Log.txt", "" + res);
            return RedirectToAction("Index", "Home");
        }
        //public ActionResult CreateNewBo()
        //{
        //    return View();
        //}
        //[HttpPost]
        //public ActionResult CreateNewBo(Bo bo)
        //{
        //    int res = repositoryBo.CreateNewBo(bo);
        //    return RedirectToAction("Index", "Home");
        //}
        public ActionResult AddInfo()
        {
            return View();
        }       
        [HttpPost]
        public void InsertValue(string giaTri)
        {
            string query = "INSERT INTO ABC " + giaTri;
            using(StreamWriter writer = new StreamWriter("E:\\text.txt"))
            {
                writer.WriteLine(query);
            }
        }

        //[HttpPost]
        public ActionResult ShowValue(string xVal, string yVal)
        {
           // Response.Write(xVal + "<br>" + yVal);
            LoaiViewModel model = new LoaiViewModel();
            //model.Loai = repository.SelectBy(xVal, yVal);
           // ViewBag.Products = repository.SelectBy(xVal, yVal); 
            return View(model);
            ////string query = "INSERT INTO ABC " + xVal+ yVal;
            ////using (StreamWriter writer = new StreamWriter("E:\\text.txt"))
            //{
            //  //  writer.WriteLine(query);
            //}
            //Product pro = new Product();
            //pro.Name = xVal.ToString() + "-" + yVal.ToString();
            //pro.Prices = 10;
            //pro.ProductID = 1;
            //pro.Amount = 10;
            //pro.Category = "category";
            ////JsonTextContent
            //var json = new JavaScriptSerializer().Serialize(pro);
            ////Console.WriteLine(json);
            ////JsonResult result = Json(pro);
            //Response.Write(json);
            //return ;
        }
        //[HttpGet]
        public ActionResult CreateNew(string xVal, string yVal, Loai loai)
        {
            //int res = repository.CreateNew(xVal, yVal, loai);

            return RedirectToAction("Index", "Home"); ;
        }
        public ActionResult TestMap()
        {
            return View();
        }
    }
}
