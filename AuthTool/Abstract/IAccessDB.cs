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
        bool ActiveAccount(string activeKey);
        TaiKhoan CreateNewTaiKhoan(TaiKhoan tk);
        void UpdateTaiKhoan(TaiKhoan tk);
        void KhoaTaiKhoan(int maTaiKhoan);
        void SavePermission(PhanQuyen phanQuyen);
        void SavePermissionGroup(UserGroup nhom);
        void DeletePermission(string query, params object[] paras);
        void DeletePermissionGroup(string query, params object[] paras);
    }
}
