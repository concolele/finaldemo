using FinalDemo.Database;
using FinalDemo.Infrastructure;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Routing;

namespace FinalDemo
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801
    public class MvcApplication : System.Web.HttpApplication
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }

        //public static void RegisterRoutes(RouteCollection routes)
        //{
        //    routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
        //    //Mặc định cho các Action của các Controller có tham số
        //    routes.MapRoute(
        //        null, // Route name
        //        "Edit-empty-{id}/{tenNguoiTao}",
        //        new { controller = "Bo", action = "EditEmpty" }
        //    );
        //    ////Dùng cho URL không có tham số
        //    //routes.MapRoute(
        //    //    null,
        //    //    "",
        //    //    new { controller = "Product", action = "List", category = (string)null, page = 1 }
        //    //    );

        //    ////Dùng cho URL có tham số ?page
        //    //routes.MapRoute(
        //    //    null,
        //    //    "Page{page}",
        //    //    new { controller = "Product", action = "List", category = (string)null }
        //    //    );

        //    ////Dùng cho URL có tham số ?category
        //    //routes.MapRoute(
        //    //    null,
        //    //    "{category}",
        //    //    new { controller = "Product", action = "List", page = 1 }
        //    //    );

        //    ////Dùng cho URL có 2 tham số là ?category và ?page
        //    //routes.MapRoute(
        //    //    null,
        //    //    "{category}/Page{page}",// Matches /Football/Page567
        //    //    new { controller = "Product", action = "List" },
        //    //    new { page = @"\d+" } //Ràng buộc số trang phải là 1 số nguyên
        //    //    );

        //    //Mặc định cho các Action của các Controller không có tham số
        //    routes.MapRoute(
        //        null, // Route name
        //        "{controller}/{action}" // URL with parameters                
        //    );
            
        //    //Mặc định cho các Action của các Controller có tham số
        //    routes.MapRoute(
        //        null, // Route name
        //        "{controller}/{action}/{id}" // URL with parameters                
        //    );
            
        //}
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();

            WebApiConfig.Register(GlobalConfiguration.Configuration);
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            DBCommon.SetConnect(ConfigurationManager.AppSettings["ConnectionString"].ToString());
            ControllerBuilder.Current.SetControllerFactory(new NinjectControllerFactory());
        }
    }
}