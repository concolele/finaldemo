
using FinalDemo.Domain.Abtracts;
using FinalDemo.Domain.Concrete;
using Ninject;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace FinalDemo.Infrastructure
{
    public class NinjectControllerFactory : DefaultControllerFactory
    {
        private IKernel ninjectKernel;
        public NinjectControllerFactory()
        {
            ninjectKernel = new StandardKernel();
            AddBindings();
        }

        protected override IController GetControllerInstance(RequestContext requestContext, Type controllerType)
        {
            return controllerType == null
                ? null
                : (IController)ninjectKernel.Get(controllerType);
        }
        private void AddBindings()
        {
            /* -- Làm việc không kết nối CSDL
            Mock<IProductRepository> mock = new Mock<IProductRepository>();
            mock.Setup(m => m.Products).Returns(new List<Product>
                                            {
                                                new Product { Name = "Football", Price = 25 }, 
                                                new Product { Name = "Surf board", Price = 179 }, 
                                                new Product { Name = "Running shoes", Price = 95 }
                                            }.AsQueryable());
            ninjectKernel.Bind<IProductRepository>().ToConstant(mock.Object);
        
             */
            ninjectKernel.Bind<ILoaiRepository>().To<LoaiRepository>();
            ninjectKernel.Bind<IChiRepository>().To<ChiRepository>();
            ninjectKernel.Bind<IHoRepository>().To<HoRepository>();
            ninjectKernel.Bind<IBoRepository>().To<BoRepository>();
            //ninjectKernel.Bind<IProductRepository>().To<ProductRepository>();
            ninjectKernel.Bind<IMoiTruongSongRepository>().To<MoiTruongSongRepository>();
            ninjectKernel.Bind<IPhanBoRepository>().To<PhanBoRepository>();


        }
    }
}