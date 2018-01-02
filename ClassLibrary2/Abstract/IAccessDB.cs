using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AuthTool.Abstract
{
    public interface IAccessDB
    {
        IQueryable<TaiKhoan> TaiKhoans { get; }
        IQueryable<UserGroup> UserGroups { get; }
        IQueryable<Group> Groups { get; }
        IQueryable<PhanQuyen> PhanQuyens { get; }
        IQueryable<ChucNang> ChucNangs { get; }
    }
}
