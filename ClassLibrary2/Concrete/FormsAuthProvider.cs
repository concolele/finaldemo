using AuthTool.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;


namespace AuthTool.Concrete
{
    public class FormsAuthProvider : IAuthProvider
    {
        private IAccessDB DBCommon = new AccessDBRepository();
        private string CookieName = "login";

        //Tạo tài khoản

        public string CreateUser(TaiKhoan taiKhoan)
        {
            taiKhoan.MatKhau = HashPassword(taiKhoan.MatKhau);
            taiKhoan.MaKichHoat = RandomActiveKey();
            //Save
            return taiKhoan.MaKichHoat;
        }

        //Kiểm tra người dùng đã đăng nhập hay chưa
        public bool Authenticate()
        {
            int userCookie = GetCookie();
            if (userCookie == -1)
                return false;
            return true;
        }

        //Xác thực người dùng tại form đăng nhập
        public bool Authenticate(string username, string password)
        {
            string hashValue = HashPassword(password);

            TaiKhoan tk = DBCommon.TaiKhoans.FirstOrDefault(x => x.TenTaiKhoan == username && x.MatKhau == hashValue);
            if (tk != null)
            {
                //Ghi lại cookie người dùng
                SetCookie(tk.MaTaiKhoan);
                return true;
            }
            return false;
            /*
            bool result = FormsAuthentication.Authenticate(username, password);
            if (result)
            {
                FormsAuthentication.SetAuthCookie(username, false);
            }
            return result;*
             */
        }
        public string HashPassword(string password)
        {
            // given, a password in a string
            string strKey = "!vn@";

            // byte array representation of that string
            byte[] encodedPassword = new UTF8Encoding().GetBytes(password + strKey);

            // need MD5 to calculate the hash
            byte[] hash = ((HashAlgorithm)CryptoConfig.CreateFromName("MD5")).ComputeHash(encodedPassword);

            // string representation (similar to UNIX format)
            string encoded = BitConverter.ToString(hash)
                // without dashes
               .Replace("-", string.Empty)
                // make lowercase
               .ToLower();
            return encoded;
        }
        private void SetCookie(int value)
        {
            HttpCookie loginCookie = HttpContext.Current.Request.Cookies[CookieName] ?? new HttpCookie(CookieName);
            loginCookie.Values["UserName"] = value.ToString();
            loginCookie.Expires = DateTime.Now.AddDays(365);
            HttpContext.Current.Response.Cookies.Add(loginCookie);
        }
        private int GetCookie()
        {
            HttpCookie loginCookie = HttpContext.Current.Request.Cookies[CookieName];
            if (loginCookie != null)
            {
                return Convert.ToInt32(loginCookie.Values["UserName"]);

            }
            return -1;
        }

        public TaiKhoan CurrentUser
        {
            get
            {
                int maNguoiDung = GetCookie();
                if (maNguoiDung == -1)
                    return null;
                return DBCommon.TaiKhoans.FirstOrDefault(x => x.MaTaiKhoan == maNguoiDung);
            }
        }

        public bool KiemTraQuyen(string dieuKhien, string phuongThuc)
        {
            //Tìm tất cả nhóm người dùng của user cookie
            int maTaiKhoan = GetCookie();
            if (maTaiKhoan == -1)
                return false;
            List<UserGroup> groups = DBCommon.UserGroups
                .Where(x => x.UserId == maTaiKhoan).ToList();
            if (groups == null)
                return false;

            //Tìm idChucNang theo dieuKhien va phuongThuc

            ChucNang chucNang = DBCommon.ChucNangs.FirstOrDefault(x => x.DieuKhien == dieuKhien && x.PhuongThuc == phuongThuc);
            if (chucNang == null)
                return false;
            int idChucNang = chucNang.IdChucNang;

            PhanQuyen phanQuyen = null;
            int groupId = -1;
            foreach (UserGroup group in groups)
            {
                groupId = group.GroupId.GetValueOrDefault(0);
                phanQuyen = DBCommon.PhanQuyens.FirstOrDefault(x => x.IdChucNang == idChucNang && x.ObjId == groupId && x.ObjType == "NhomNguoiDung");
                if (phanQuyen != null)
                    return true;
            }
            //Duyệt qua từng nhóm người dùng tìm phân quyền tương ứng. Chú ý: ObjType = 'NhomNguoiDung'
            //Nếu tồn tại quyền thì return true;

            //Tìm theo quyền của người dùng. ObjType = 'NguoiDung'

            phanQuyen = DBCommon.PhanQuyens.FirstOrDefault(x => x.IdChucNang == idChucNang && x.ObjId == maTaiKhoan && x.ObjType == "NguoiDung");

            //return false
            if (phanQuyen != null)
                return true;
            return false;
        }

        public string RandomActiveKey()
        {
            Guid g = Guid.NewGuid();
            string guidString = Convert.ToBase64String(g.ToByteArray());
            guidString = guidString.Replace("=", "");
            guidString = guidString.Replace("+", "");
            guidString = guidString.Replace("/", "");
            guidString = guidString.Replace("\\", "");
            guidString = guidString.Replace("$", "");
            return guidString;
        }

        public void ActiveAcount(string maKichHoat)
        {

        }
    }
}
