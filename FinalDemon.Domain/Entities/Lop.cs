using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FinalDemo.Domain.Entities
{
    public class Lop
    {
        public const string TableName = "Lop";
        public const string fn_MaLop = "MaLop";
        public const string fn_KiHieu = "KiHieu";
        public const string fn_Nganh = "Nganh";
        public const string fn_DPKH = "DanhPhapKhoaHoc";
        public const string fn_TenTV = "TenTiengViet";
        public const string fn_NguoiPH = "NguoiPhatHien";
        public const string fn_NamPH = "NamPhatHien";
        public const string fn_TenNguoiTao = "TenNguoiTao";
        public int MaLop { get; set; }
        public string KiHieu { get; set; }
        public int Nganh { get; set; }
        public string DPKH { get; set; }
        public string TenTV { get; set; }
        public string NguoiPH { get; set; }
        public int NamPH { get; set; }
        public string TenNguoiTao { get; set; }
    }
}
