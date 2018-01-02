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

        public string CreateMaKichHoat(TaiKhoan taiKhoan)
        {
            
            taiKhoan.MaKichHoat = RandomActiveKey();
            //Save
            return taiKhoan.MaKichHoat;
        }
        public string CreatePassword(TaiKhoan tk)
        {
            tk.MatKhau = RandomPassword();
            return tk.MatKhau;
        }
        public TaiKhoan CreateNewUser(TaiKhoan taiKhoan)
        {
            taiKhoan.MatKhau = HashPassword(taiKhoan.MatKhau);
            return DBCommon.CreateNewTaiKhoan(taiKhoan); 
        }
        public void UpdateUser(TaiKhoan tk)
        {
            tk.MatKhau = HashPassword(tk.MatKhau);
            DBCommon.UpdateTaiKhoan(tk); 
        }
        //Kiểm tra người dùng đã đăng nhập hay chưa
        public bool Authenticate()
        {
            int userCookie = GetUserCookie();
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
                UserGroup groups = DBCommon.UserGroups.Where(x => x.UserId == tk.MaTaiKhoan).First();

                int groupId = (int)groups.GroupId;
                SetCookie(tk.MaTaiKhoan, groupId);
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
        private void SetCookie(int value, int groupId)
        {
            HttpCookie loginCookie = HttpContext.Current.Request.Cookies[CookieName] ?? new HttpCookie(CookieName);
            loginCookie.Values["UserName"] = value.ToString();
            loginCookie.Expires = DateTime.Now.AddDays(365);
            HttpContext.Current.Response.Cookies.Add(loginCookie);

            HttpCookie groupCookie = HttpContext.Current.Request.Cookies["groupId"] ?? new HttpCookie("groupId");
            groupCookie.Values["groupId"] = groupId.ToString();
            groupCookie.Expires = DateTime.Now.AddDays(365);
            HttpContext.Current.Response.Cookies.Add(groupCookie);
        }
        private int GetUserCookie()
        {
            HttpCookie loginCookie = HttpContext.Current.Request.Cookies[CookieName];
            if (loginCookie != null)
            {
                return Convert.ToInt32(loginCookie.Values["UserName"]);
                
            }
            return -1;
        }

        private int GetUserGroupCookie()
        {
            HttpCookie loginCookie = HttpContext.Current.Request.Cookies[CookieName];
            if (loginCookie != null)
            {
                return Convert.ToInt32(loginCookie.Values["groupId"]);

            }
            return -1;
        }
        public TaiKhoan CurrentUser
        {
            get
            {
                int maNguoiDung = GetUserCookie();
                if (maNguoiDung == -1)
                    return null;
                return DBCommon.TaiKhoans.FirstOrDefault(x => x.MaTaiKhoan == maNguoiDung);
            }
        }
        public bool KiemTraQuyen(string dieuKhien, string phuongThuc)
        {
            //Tìm tất cả nhóm người dùng của user cookie
            int maTaiKhoan = GetUserCookie();
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
            
            phanQuyen = DBCommon.PhanQuyens.FirstOrDefault(x => x.IdChucNang == idChucNang && x.ObjId == maTaiKhoan && x.ObjType == "NhomNguoiDung");

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
        public string RandomPassword()
        {
            Random rnd = new Random();
            return rnd.Next(10000, 99999).ToString(); 
        }
        public bool ActiveAcount(string maKichHoat)
        {
            return DBCommon.ActiveAccount(maKichHoat);
        }
        public void SignOut()
        {            
            //HttpContext.Current.Response.Cookies.Remove(CookieName);
            HttpCookie loginCookie = HttpContext.Current.Request.Cookies[CookieName] ?? new HttpCookie(CookieName);
            loginCookie.Values["UserName"] = "-1";
            loginCookie.Expires = DateTime.Now.AddDays(-365);
            HttpContext.Current.Response.Cookies.Add(loginCookie);
        }
        public bool ForgotPassword(string email)
        {
            TaiKhoan tk = DBCommon.TaiKhoans.FirstOrDefault(x => x.Email == email);
            if (tk == null)
                return false;
            return true;
        }
        public List<TaiKhoan> SelectAll()
        {            
            return DBCommon.TaiKhoans.ToList();
        }
        public UserGroup GetIdGroup(int maTaiKhoan)
        {
            return DBCommon.UserGroups.FirstOrDefault(x => x.UserId == maTaiKhoan);
        }
        public List<ChucNang> SelectAllChucNang()
        {
            return DBCommon.ChucNangs.ToList();
        }
        public List<Group> SelectAllGroup()
        {
            return DBCommon.Groups.ToList();
        }
        public TaiKhoan GetTaiKhoanCookie(int maTaiKhoan)
        {
            return DBCommon.TaiKhoans.FirstOrDefault(x => x.MaTaiKhoan == maTaiKhoan);
        }
        public void SavePermission(int maDoiTuong, string kieuDoiTuong, int idChucNang)
        {
            //Kiem tra da ton tai quyen nay hay chua?
            PhanQuyen phanQuyen = DBCommon.PhanQuyens.FirstOrDefault(x => x.ObjId == maDoiTuong && x.ObjType == kieuDoiTuong
                && x.IdChucNang == idChucNang);
            if(phanQuyen == null)
            {
                //DBCommon.PhanQuyens.Add(phanQuyen);  
                phanQuyen = new PhanQuyen();
                phanQuyen.IdChucNang = idChucNang;
                phanQuyen.ObjId = maDoiTuong;
                phanQuyen.ObjType = kieuDoiTuong;
                phanQuyen.Xoa = false;
                DBCommon.SavePermission(phanQuyen);
            }
        }
        public void SavePermissionGroup(int maDoiTuong, int idGroup)
        {
            //Kiem tra da ton tai quyen nay hay chua?
            UserGroup nhom = DBCommon.UserGroups.FirstOrDefault(x => x.UserId == maDoiTuong && x.GroupId == idGroup);
            if (nhom == null)
            {
                //DBCommon.PhanQuyens.Add(phanQuyen);  
                nhom = new UserGroup();
                nhom.GroupId = idGroup;
                nhom.UserId = maDoiTuong;
                DBCommon.SavePermissionGroup(nhom);
            }
        }
        public void KhoaTaiKhoan(int maTaiKhoan)
        {
            TaiKhoan acc = DBCommon.TaiKhoans.FirstOrDefault(x => x.MaTaiKhoan == maTaiKhoan);
            //acc.Khoa = !(acc.Khoa);
            DBCommon.KhoaTaiKhoan(maTaiKhoan);
        }
        public IEnumerable<ChucNang> GetPermissions(int id, string doiTuong)
        {
            List<PhanQuyen> phanQuyens = DBCommon.PhanQuyens.Where(x => x.ObjId == id && x.ObjType == doiTuong).ToList();
            List<ChucNang> result = new List<ChucNang>();
            if(phanQuyens != null)
            {
                foreach (var phanQuyen in phanQuyens)
                {
                    result.Add(new ChucNang() { IdChucNang = phanQuyen.IdChucNang.Value });
                }
            }
            return result;
        }
        public IEnumerable<Group> GetPermissionGroups(int id)
        {
            List<UserGroup> userGroups = DBCommon.UserGroups.Where(x => x.UserId == id).ToList();
            List<Group> result = new List<Group>();
            if (userGroups != null)
            {
                foreach (var nhom in userGroups)
                {
                    result.Add(new Group() { IdGroup = nhom.GroupId.Value });
                }
            }
            return result;
        }

        public void DeletePermission(int maDoiTuong, string kieuDoiTuong, List<int> idChucNangCurrents)
        {
            string query = "DELETE FROM PhanQuyen WHERE ObjId = @p0 AND ObjType = @p1 AND IdChucNang NOT IN(0";
            foreach (int idChucNang in idChucNangCurrents)
                query += "," + idChucNang;
            query += ")";
            DBCommon.DeletePermission(query, maDoiTuong, kieuDoiTuong);
        }
        public void DeletePermissionGroup(int maDoiTuong, List<int> idGroupCurrents)
        {
            string query = "DELETE FROM UserGroup WHERE UserId = @p0 AND GroupId NOT IN(0";
            foreach (int idGroup in idGroupCurrents)
                query += "," + idGroup;
            query += ")";
            DBCommon.DeletePermission(query, maDoiTuong);
        }
    }
}
