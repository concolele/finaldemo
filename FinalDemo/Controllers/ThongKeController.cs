using CrystalDecisions.CrystalReports.Engine;
using FinalDemo.Domain.Abtracts;
using FinalDemo.Domain.Entities;
using FinalDemo.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace FinalDemo.Controllers
{
    public class ThongKeController : BaseController
    {
        //
        // GET: /ThongKe/
        private IThongKeRepository repositoryT { get; set; }
        private ILopRepository repositoryL { get; set; }
        private IBoRepository repositoryB { get; set; }
        public ThongKeController(IThongKeRepository repoT, ILopRepository repoL, IBoRepository repoB)
        {
            repositoryT = repoT;
            repositoryL = repoL;
            repositoryB = repoB;
            base.Init();
        }
        public ActionResult IndexThongKe()
        {
            return View();
        }
        public PartialViewResult SignInOutPanel()
        {
            return PartialView(base.CurrentUser);
        }
        public ActionResult GetAllLops()
        {
            LopViewModel lopView = new LopViewModel();
            StringBuilder sb = new StringBuilder();
            lopView.Lops = repositoryL.GetAllLop();
            foreach (Lop viewLop in lopView.Lops)
            {
                sb.AppendFormat("<option value='{0}'>{1}</option>", viewLop.MaLop, viewLop.TenTV);
            }
            Response.Write(sb);
            return null;
        }
        public ActionResult GetThongKeByLop(int Lop)
        {
            ThongKeViewModel thongkeView = new ThongKeViewModel();
            StringBuilder sb = new StringBuilder();
            sb.Append("<table border='1'>");
            sb.Append("<tr><td>Mã Bộ</td><td>Tên Tiếng Việt</td><td>Họ</td><td>%</td><td>Chi</td><td>%</td><td>Loài</td><td>%</td></tr>");
            thongkeView.ThongKes = repositoryT.GetThongKeByLop(Lop);
            foreach (ThongKe tk in thongkeView.ThongKes)
            {
                sb.AppendFormat("<tr><td>{0}</td><td>{1}</td><td>{2}</td><td>{3}</td><td>{4}</td><td>{5}</td><td>{6}</td><td>{7}</td></tr>"
                    , tk.MaBo, tk.TenTiengViet, tk.Ho, tk.perHo, tk.Chi, tk.perChi, tk.Loai, tk.perLoai);
            }
            sb.Append("</table>");
            Response.Write(sb.ToString());
            return null;
        }
        public ActionResult Report(int Lop)
        {
            ReportClass rptH = new ReportClass();
            ThongKeViewModel thongkeView = new ThongKeViewModel();
            thongkeView.ThongKes = repositoryT.GetThongKeByLop(Lop);
            
            rptH.FileName = Server.MapPath("/Reporting/crystalReport.rpt");

            rptH.Load();
            //rptH.SetParameterValue("@Lop", Lop);
            rptH.SetDataSource(thongkeView.ThongKes);

            Stream stream = rptH.ExportToStream(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat);

            return File(stream, "application/pdf"); 
        }
        public ActionResult Test()
        {
            LopViewModel lopView = new LopViewModel();
            lopView.Lops = repositoryL.GetAllLop();
            ViewBag.ListOfCodes = new SelectList(lopView.Lops, "MaLop", "TenTV");
            ViewBag.Codes = "C";
            return View();
        }
        }
}
