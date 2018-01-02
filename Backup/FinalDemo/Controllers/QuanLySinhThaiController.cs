using FinalDemo.Domain.Abtracts;
using FinalDemo.Domain.Entities;
using FinalDemo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace FinalDemo.Controllers
{
    public class QuanLySinhThaiController : BaseController
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

        public QuanLySinhThaiController(ILoaiRepository repo, IMoiTruongSongRepository repoM, IPhanBoRepository repositoryPB, IBoRepository repoBo, IHoRepository repoHo, IChiRepository repoChi, IGioiRepository repoGioi, INganhRepository repoNganh, ILopRepository repoLop)
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
        public PartialViewResult SignInOutPanel()
        {
            return PartialView(base.CurrentUser);
        }
        public ActionResult Index()
        {
            if (base.Auth())
            {
                ParentModelView parent = new ParentModelView();
                BoViewModel boView = new BoViewModel();
                boView.Bos = repositoryBo.GetAllBoBaiDang();
                parent.bo = boView;
                HoViewModel hoView = new HoViewModel();
                hoView.Hos = repositoryHo.GetAllHoBaiDang();
                parent.ho = hoView;
                ChiViewModel chiView = new ChiViewModel();
                chiView.Chis = repositoryChi.GetAllChiBaiDang();
                parent.chi = chiView;
                LoaiViewModel loaiView = new LoaiViewModel();
                loaiView.Loais = repository.GetAllLoaiBaiDang();
                parent.loai = loaiView;
                MoiTruongSongModel model1 = new MoiTruongSongModel();
                model1.MoiTruong = repositoryM.GetAllMoiTruong_ChuyenGia();
                ViewBag.CoorChuyenGia = model1.MoiTruong;
                return View(parent);
            }
            return RedirectToAction("ResponseServer", "Home");
        }
        public ActionResult ThongTinPhanBo(string x, string y)
        {
            MoiTruongSong moiTruong = repositoryM.GetMoiTruongByToaDo(x, y);
            PhanBoViewModel phanBoViewModel = new PhanBoViewModel();
            StringBuilder sb = new StringBuilder();
            sb.Append("<table border='1'>");
            sb.Append("<tr><td>Danh pháp khoa học</td><td>Tên Loài</td></tr>");
            phanBoViewModel.PhanBos = repositoryPhanBo.GetAllPhanBo(moiTruong.MaVung);
            foreach (PhanBo phanBo in phanBoViewModel.PhanBos)
            {
                List<Loai> loai = repository.SelectByID(phanBo.MaLoai);
                int maLoai = phanBo.MaLoai;
                int vungPhanBo = phanBo.VungPhanBo;
                string tenLoai = loai[0].TenTG;
                string dpKhoahoc = loai[0].DPKH;
                //khóa của vùng
                int sttKhoa = phanBo.Khoa;
                if (sttKhoa == 1)
                {
                    sb.AppendFormat("<tr><td>{0}</td><td>{1}</td><td><a href='/QuanLySinhThai/Delete/{2}/{3}'>Xóa bài</a></td></tr>", dpKhoahoc, tenLoai, maLoai, vungPhanBo);//<td><a href='Home/Index'>Test</a>
                }
                else
                {
                    sb.AppendFormat("<tr><td>{0}</td><td>{1}</td><td><a href='/QuanLySinhThai/ApprovePhanBo/{2}/{3}'>Đăng bài</a></td><td><a href='/QuanLySinhThai/Delete/{2}/{3}'>Xóa bài</a></td></tr>", dpKhoahoc, tenLoai, maLoai, vungPhanBo);
                }
                
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
        public ActionResult AddPhanBo(string x, string y, PhanBo phanBo)
        {
            if (base.Auth())
            {
                phanBo.TenNguoiTao = base.CurrentUser.Ten;
                phanBo.NgayDangBai = DateTime.Now;
                phanBo.MaNguoiTao = base.CurrentUser.MaTaiKhoan;
                int res = repositoryPhanBo.CreateNewPhanBo_ChuyenGia(x, y, phanBo);
                return RedirectToAction("CacBaiDang", "QuanLyCaNhan");
            }
            else
            {
                return RedirectToAction("ResponseServer", "Home");
            }
        }
        public ActionResult ApproveHo(int id)
        {
            if (base.Auth())
            {
                int res = repositoryHo.UpdateBaiDang(id, base.CurrentUser.MaTaiKhoan);
                return RedirectToAction("Index", "QuanLySinhThai");
            }
            else
            {
                return RedirectToAction("ResponseServer", "Home");
            }
        }
        public ActionResult ApproveBo(int id)
        {
            if (base.Auth())
            {
                int res = repositoryBo.UpdateBaiDang(id, base.CurrentUser.MaTaiKhoan);
                return RedirectToAction("Index", "QuanLySinhThai");
            }
            else
            {
                return RedirectToAction("ResponseServer", "Home");
            }
        }
        public ActionResult ApproveChi(int id)
        {
            if (base.Auth())
            {
                int res = repositoryChi.UpdateBaiDang(id, base.CurrentUser.MaTaiKhoan);
                return RedirectToAction("Index", "QuanLySinhThai");
            }
            return RedirectToAction("ResponseServer", "Home");
        }
        public ActionResult ApproveLoai(int id)
        {
            if (base.Auth())
            {
                int res = repository.UpdateBaiDang(id, base.CurrentUser.MaTaiKhoan);
                return RedirectToAction("Index", "QuanLySinhThai");
            }
            return RedirectToAction("ResponseServer", "Home");
        }
        public ActionResult ApprovePhanBo(int maLoai, int vungPhanBo)
        {
            if (base.Auth())
            {
                int res = repositoryPhanBo.UpdateBaiDang(maLoai, vungPhanBo, base.CurrentUser.MaTaiKhoan);
                return RedirectToAction("Index", "QuanLySinhThai");
            }
            return RedirectToAction("ResponseServer", "Home");
        }
        public ActionResult Delete(int maLoai, int vungPhanBo)
        {
            if (base.Auth())
            {
                int res = repositoryPhanBo.DeletePhanBo_ChuyenGia(maLoai, vungPhanBo);
                if (res != 0)
                {
                    return RedirectToAction("Index", "QuanLySinhThai");
                }
                return RedirectToAction("ResponseServer", "Home");
            }
            else
            {
                return RedirectToAction("ResponseServer", "Home");
            }
        }
    }
}
