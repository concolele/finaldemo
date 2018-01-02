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
    public class HomeController : BaseController
    {
        private ILoaiRepository repository { get; set; }
        private IMoiTruongSongRepository repositoryM { get; set; }
        private IPhanBoRepository repositoryPhanBo { get; set; }
        private IBoRepository repositoryBo { get; set; }
        private IHoRepository repositoryHo { get; set; }
        private IChiRepository repositoryChi { get; set; }
        private IGioiRepository repositoryGioi { get; set; }
        private INganhRepository repositoryNganh { get; set; }
        private ILopRepository repositoryLop { get; set; }


        public HomeController(ILoaiRepository repo, IMoiTruongSongRepository repoM, IPhanBoRepository repositoryPB, IBoRepository repoBo, IHoRepository repoHo, IChiRepository repoChi, IGioiRepository repoGioi, INganhRepository repoNganh, ILopRepository repoLop)
        {
            repository = repo;
            repositoryM = repoM;
            repositoryPhanBo = repositoryPB;
            repositoryBo = repoBo;
            repositoryHo = repoHo;
            repositoryChi = repoChi;
            repositoryGioi = repoGioi;
            repositoryNganh = repoNganh;
            repositoryLop = repoLop;
            base.Init();
        }
        //[HttpGet]
        public ActionResult Index()
        {
            MoiTruongSongModel model1 = new MoiTruongSongModel();
            model1.MoiTruong = repositoryM.GetAllMoiTruong();
            ViewBag.Coor = model1.MoiTruong;
            return View();
        }
        [HttpPost]
        public ActionResult Index(int MaLoai)
        {
            MoiTruongSongModel model1 = new MoiTruongSongModel();
            model1.MoiTruong = repositoryM.GetAllMoiTruong(MaLoai);
            ViewBag.Coor = model1.MoiTruong;
            return View();
        }
        public ActionResult ThongTinPhanBo(string x, string y)
        {
            MoiTruongSong moiTruong = repositoryM.GetMoiTruongByToaDo(x, y);
            PhanBoViewModel phanBoViewModel = new PhanBoViewModel();
            StringBuilder sb = new StringBuilder();
            sb.Append("<div class='main'>");
            sb.Append("<table class='table'>");
            sb.Append("<tr class='trbo'><td>Danh pháp khoa học</td><td>Tên Loài</td></tr>");
            phanBoViewModel.PhanBos = repositoryPhanBo.GetAllPhanBo(moiTruong.MaVung);
            foreach (PhanBo phanBo in phanBoViewModel.PhanBos)
            {
                List<Loai> loai = repository.SelectByID(phanBo.MaLoai);
                string tenLoai = loai[0].TenTG;
                string dpKhoahoc = loai[0].DPKH;
                sb.AppendFormat("<tr class='info_bo'><td>{0}</td><td>{1}</td></tr>", dpKhoahoc, tenLoai);
            }
            sb.Append("</table>");
            Response.Write(sb.ToString());
            return null;
        }
        public ActionResult GetAllGiois()
        {
            GioiViewModel gioiView = new GioiViewModel();
            StringBuilder sb = new StringBuilder();
            gioiView.Giois = repositoryGioi.GetAllGioi();
            foreach (Gioi viewGioi in gioiView.Giois)
            {
                sb.AppendFormat("<option value='{0}'>{1}</option>", viewGioi.MaGioi, viewGioi.TenTV);
            }
            Response.Write(sb);
            return null;
        }
        public ActionResult GetAllNganhsByGioi(int maGioi)
        {
            NganhViewModel nganhView = new NganhViewModel();
            StringBuilder sb = new StringBuilder();
            sb.Append("<option value=''>Chọn ngành</option>");
            nganhView.Nganhs = repositoryNganh.GetAllNganhsByGioi(maGioi);
            foreach (Nganh viewNganh in nganhView.Nganhs)
            {
                sb.AppendFormat("<option value='{0}'>{1}</option>", viewNganh.MaNganh, viewNganh.TenTV);
            }
            //System.IO.File.WriteAllText(@"E:\Log.txt", sb.ToString());
            Response.Write(sb);
            return null;
        }
        public ActionResult GetAllLopsByNganh(int maNganh)
        {
            LopViewModel lopView = new LopViewModel();
            StringBuilder sb = new StringBuilder();
            sb.Append("<option value=''>Chọn lớp</option>");
            lopView.Lops = repositoryLop.GetAllLopsByNganh(maNganh);
            foreach (Lop viewLop in lopView.Lops)
            {
                sb.AppendFormat("<option value='{0}'>{1}</option>", viewLop.MaLop, viewLop.TenTV);
            }
            //System.IO.File.WriteAllText(@"E:\Log.txt", sb.ToString());
            Response.Write(sb);
            return null;
        }
        public ActionResult GetAllBosByLop(int maLop)
        {
            BoViewModel boView = new BoViewModel();
            StringBuilder sb = new StringBuilder();
            sb.Append("<option value=''>Chọn bộ</option>");
            boView.Bos = repositoryBo.GetAllBosByLop(maLop);
            foreach (Bo viewBo in boView.Bos)
            {
                sb.AppendFormat("<option value='{0}'>{1}</option>", viewBo.MaBo, viewBo.TenTV);
            }
            //System.IO.File.WriteAllText(@"E:\Log.txt", sb.ToString());
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
                sb.AppendFormat("<option value='{0}'>{1}</option>", viewChi.MaChi, viewChi.DPKH);
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
        public PartialViewResult SignInOutPanel()
        {
            return PartialView(base.CurrentUser);
        }
        public ActionResult SignOutUser()
        {
            base.SignOut();
            return RedirectToAction("SignInOutPanel", "Home");
        }
        public ActionResult ResponseServer()
        {
            return View();
        }
    }
}
