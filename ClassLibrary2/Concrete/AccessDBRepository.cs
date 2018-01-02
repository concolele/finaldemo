using AuthTool.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AuthTool.Concrete
{
    public class AccessDBRepository : IAccessDB
    {
        private AuthEntities context = new AuthEntities();
        public IQueryable<TaiKhoan> TaiKhoans { get { return context.TaiKhoans; } }
        public IQueryable<UserGroup> UserGroups { get { return context.UserGroups; } }
        public IQueryable<Group> Groups { get { return context.Groups; } }
        public IQueryable<PhanQuyen> PhanQuyens { get { return context.PhanQuyens; } }
        public IQueryable<ChucNang> ChucNangs { get { return context.ChucNangs; } }
    }
}
