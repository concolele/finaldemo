using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace FinalDemo
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
            routes.MapRoute(
                null, // Route name
                "QuanLySinhThai/Delete/{maLoai}/{vungPhanBo}",
                new { controller = "QuanLySinhThai", action = "Delete" }
            );
            routes.MapRoute(
                null, // Route name
                "QuanLyCaNhan/Delete/{maLoai}/{vungPhanBo}",
                new { controller = "QuanLyCaNhan", action = "Delete" }
            );
            routes.MapRoute(
                null, // Route name
                "QuanLySinhThai/ApprovePhanBo/{maLoai}/{vungPhanBo}",
                new { controller = "QuanLySinhThai", action = "ApprovePhanBo" }
            );
            routes.MapRoute(
                null, // Route name
                "QuanLySinhThai/UpdateBaiDang/{maLoai}/{vungPhanBo}",
                new { controller = "QuanLySinhThai", action = "UpdateBaiDang" }
            );
            routes.MapRoute(
                null, // Route name
                "QuanLyCaNhan/ApprovePhanBo/{maLoai}/{vungPhanBo}",
                new { controller = "QuanLyCaNhan", action = "ApprovePhanBo" }
            );
            routes.MapRoute(
                null, // Route name
                "QuanLyCaNhan/UpdateBaiMoi/{maLoai}/{vungPhanBo}",
                new { controller = "QuanLyCaNhan", action = "UpdateBaiMoi" }
            );
            routes.MapRoute(
                null, // Route name
                "Bo/CreateNewBo",
                new { controller = "Bo", action = "CreateNewBo" }
            );
            routes.MapRoute(
                null, // Route name
                "Bo/DeleteBo",
                new { controller = "Bo", action = "DeleteBo" }
            );
            routes.MapRoute(
                null, // Route name
                "Ho/CreateNewHo",
                new { controller = "Ho", action = "CreateNewHo" }
            );
            routes.MapRoute(
                null, // Route name
                "Ho/DeleteHo",
                new { controller = "Ho", action = "DeleteHo" }
            );
            routes.MapRoute(
                null, // Route name
                "Chi/CreateNewChi",
                new { controller = "Chi", action = "CreateNewChi" }
            );
            routes.MapRoute(
                null, // Route name
                "Chi/Delete",
                new { controller = "Chi", action = "Delete" }
            );
            routes.MapRoute(
                null, // Route name
                "Loai/CreateNewLoai",
                new { controller = "Loai", action = "CreateNewLoai" }
            );
            routes.MapRoute(
                null, // Route name
                "Loai/DeleteLoai",
                new { controller = "Loai", action = "DeleteLoai" }
            );
            //"Bo/EditEmpty/{id}/{maNguoiTao}",
            routes.MapRoute(
                null, // Route name
                "Bo/EditEmpty/{id}",
                new { controller = "Bo", action = "EditEmpty" }
            );
            routes.MapRoute(
                null, // Route name
                "Ho/EditEmpty/{id}",
                new { controller = "Ho", action = "EditEmpty" }
            );
            routes.MapRoute(
                null, // Route name
                "Chi/EditEmpty/{id}",
                new { controller = "Chi", action = "EditEmpty" }
            );
            routes.MapRoute(
                null, // Route name
                "Loai/EditEmpty/{id}",
                new { controller = "Loai", action = "EditEmpty" }
            );
            //Mặc định cho các Action của các Controller có tham số
            routes.MapRoute(
                null, // Route name
                "{controller}/{action}/{id}" // URL with parameters                
            );
            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional}
            );
        }
    }
}