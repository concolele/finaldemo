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
        string CreateUser(TaiKhoan taiKhoan);

        void ActiveAcount(string maKichHoat);
    }
}
