using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AuthTool.Abstract
{
    public interface IAuthProvider
    {
        bool Authenticate(string username, string password);
        bool Authenticate();
        string HashPassword(string password);
        TaiKhoan CurrentUser { get; }
        bool KiemTraQuyen(string dieuKhien, string phuongThuc);
        string CreateMaKichHoat(TaiKhoan taiKhoan);
        string CreatePassword(TaiKhoan taiKhoan);
        TaiKhoan CreateNewUser(TaiKhoan taiKhoan);
        void UpdateUser(TaiKhoan taiKhoan);
        bool ActiveAcount(string maKichHoat);
        void SignOut();
        bool ForgotPassword(string email);
        void KhoaTaiKhoan(int maTaiKhoan);
        List<TaiKhoan> SelectAll();
        List<ChucNang> SelectAllChucNang();
        UserGroup GetIdGroup(int maDoiTuong);
        List<Group> SelectAllGroup();
        void SavePermission(int maDoiTuong, string kieuDoiTuong, int idChucNang);
        void SavePermissionGroup(int maDoiTuong, int idGroup);
        IEnumerable<ChucNang> GetPermissions(int id, string doiTuong);
        IEnumerable<Group> GetPermissionGroups(int id);
        void DeletePermission(int maDoiTuong, string kieuDoiTuong, List<int> idChucNangCurrents);
        void DeletePermissionGroup(int maDoiTuong, List<int> idGroupCurrents);
    }
}
