using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FinalDemo.Domain.Entities
{
    public class Nganh
    {
        public const string TableName = "Nganh";
        public const string fn_MaNganh = "MaNganh";
        public const string fn_KiHieu = "KiHieu";
        public const string fn_Gioi = "Gioi";
        public const string fn_DPKH = "DanhPhapKhoaHoc";
        public const string fn_TenTV = "TenTiengViet";
        public const string fn_NguoiPH = "NguoiPhatHien";
        public const string fn_NamPH = "NamPhatHien";
        public const string fn_TenNguoiTao = "TenNguoiTao";
        public int MaNganh { get; set; }
        public string KiHieu { get; set; }
        public int Gioi { get; set; }
        public string DPKH { get; set; }
        public string TenTV { get; set; }
        public string NguoiPH { get; set; }
        public int NamPH { get; set; }
        public string TenNguoiTao { get; set; }
    }
}
