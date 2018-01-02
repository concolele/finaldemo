using FinalDemo.Domain.Abtracts;
using FinalDemo.Domain.Entities;
using FinalDemo.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace FinalDemo.Controllers
{
    public class TimKiemController : BaseController
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

        public TimKiemController(ILoaiRepository repo, IMoiTruongSongRepository repoM, IPhanBoRepository repositoryPB, IBoRepository repoBo, IHoRepository repoHo, IChiRepository repoChi, IGioiRepository repoGioi, INganhRepository repoNganh, ILopRepository repoLop)
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
        public ActionResult Index()
        {
            return View();
        }
        public PartialViewResult SignInOutPanel()
        {
            return PartialView(base.CurrentUser);
        }
        public ActionResult OptionSearch()
        {
            StringBuilder sb = new StringBuilder();
            string[] optionSearch = new string[] { "Chọn cấp bậc", "Bộ", "Họ", "Chi", "Loài" };
            for (int i = 0; i < optionSearch.Length; i++)
            {
                sb.AppendFormat("<option value='{0}'>{1}</option>", i, optionSearch[i]);
            }
            Response.Write(sb);
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
        public ActionResult GetAllHos()
        {
            HoViewModel hoView = new HoViewModel();
            StringBuilder sb = new StringBuilder();
            hoView.Hos = repositoryHo.GetAllHo();
            foreach (Ho viewHo in hoView.Hos)
            {
                sb.AppendFormat("<option value='{0}'>{1}</option>", viewHo.MaHo, viewHo.TenTV);
            }
            Response.Write(sb);
            return null;
        }
        public ActionResult GetAllChis()
        {
            ChiViewModel chiView = new ChiViewModel();
            StringBuilder sb = new StringBuilder();
            chiView.Chis = repositoryChi.GetAllChi();
            foreach (Chi viewChi in chiView.Chis)
            {
                sb.AppendFormat("<option value='{0}'>{1}</option>", viewChi.MaChi, viewChi.TenTV);
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
            sb.Append("<table border='1'>");
            sb.Append("<tr><td>Mã Loài</td><td>Danh pháp khoa học</td><td>Tên Tiếng Việt</td>");//<td>%</td><td>Chi</td><td>%</td><td>Loài</td><td>%</td></tr>");
            LoaiView.Loais = repository.GetAllLoaisByChi(maChi);
            foreach (Loai viewLoai in LoaiView.Loais)
            {
                sb.AppendFormat("<tr><td>{0}</td><td>{1}</td><td>{2}</td>", viewLoai.MaLoai, viewLoai.DPKH, viewLoai.TenTG);
            }
            sb.Append("</table>");
            Response.Write(sb);
            return null;
        }
        public ActionResult AutoCompleteInfo(string Number)
        {
            BoViewModel boView = new BoViewModel();
            boView.Bos = repositoryBo.SelectBy(Number);
            return View(boView);
        }
        public static string[] GetCategory(string term)
        {
            List<string> retCategory = new List<string>();
            string ConnectionString = @"Data Source=localhost;Initial Catalog=FinalDemo;User Id=sa; Password=1";
            using (SqlConnection con = new SqlConnection(ConnectionString))
            {
                string query = string.Format("select DanhPhapKhoaHoc from Bo where DanhPhapKhoaHoc Like '%{0}%'", term);
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        retCategory.Add(reader.GetString(0));
                    }
                }
                con.Close();
            }
            return retCategory.ToArray();
        }
    }
}
