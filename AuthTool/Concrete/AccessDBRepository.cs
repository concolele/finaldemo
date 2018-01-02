using AuthTool.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AuthTool.Concrete
{
    public class AccessDBRepository : IAccessDB
    {
        private FinalDemoEntities context = new FinalDemoEntities();
        public IQueryable<TaiKhoan> TaiKhoans { get { return context.TaiKhoans; } }
        public IQueryable<UserGroup> UserGroups { get { return context.UserGroups; } }
        public IQueryable<Group> Groups { get { return context.Groups; } }
        public IQueryable<PhanQuyen> PhanQuyens { get { return context.PhanQuyens; } }
        public IQueryable<ChucNang> ChucNangs { get { return context.ChucNangs; } }
        public bool ActiveAccount(string activeKey)
        {
            TaiKhoan tk = context.TaiKhoans.FirstOrDefault(x => x.MaKichHoat == activeKey && x.Khoa == false);
            if (tk == null)
                return false;
            tk.Khoa = true;
            tk.NgayKichHoat = DateTime.Now;
            UserGroup userGroup = new UserGroup();
            userGroup.UserId = tk.MaTaiKhoan;
            userGroup.GroupId = 2;
            context.UserGroups.Add(userGroup);
            context.SaveChanges();
            return true;            
        }
        public TaiKhoan CreateNewTaiKhoan(TaiKhoan tk)
        {
            TaiKhoan acc = context.TaiKhoans.Add(tk);            
            context.SaveChanges();
            return acc;
        }
        public void UpdateTaiKhoan(TaiKhoan tk)
        {
            TaiKhoan acc = context.TaiKhoans.FirstOrDefault(x => x.Email == tk.Email);
            acc.MatKhau = tk.MatKhau;
            context.SaveChanges();            
        }
        public void KhoaTaiKhoan(int maTaiKhoan)
        {
            TaiKhoan acc = context.TaiKhoans.FirstOrDefault(x => x.MaTaiKhoan == maTaiKhoan);
            acc.Khoa = !(acc.Khoa);
            context.SaveChanges();
        }
        public void SavePermission(PhanQuyen phanQuyen)
        {
            context.PhanQuyens.Add(phanQuyen);
            context.SaveChanges();
        }
        public void SavePermissionGroup(UserGroup nhom)
        {
            context.UserGroups.Add(nhom);
            context.SaveChanges();
        }
        public void DeletePermission(string query, params object[] paras)
        {
            context.Database.ExecuteSqlCommand(query, paras);
            context.SaveChanges();
        }
        public void DeletePermissionGroup(string query, params object[] paras)
        {
            context.Database.ExecuteSqlCommand(query, paras);
            context.SaveChanges();
        }
    }
}
