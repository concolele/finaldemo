using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FinalDemo.Domain.Entities
{
    public class Gioi
    {
        public const string TableName = "Gioi";
        public const string fn_MaGioi = "MaGioi";
        public const string fn_KiHieu = "KiHieu";
        public const string fn_DPKH = "DanhPhapKhoaHoc";
        public const string fn_TenTV = "TenTiengViet";
        public const string fn_NguoiPH = "NguoiPhatHien";
        public const string fn_NamPH = "NamPhatHien";
        public int MaGioi { get; set; }
        public string KiHieu { get; set; }
        public string DPKH { get; set; }
        public string TenTV { get; set; }
        public string NguoiPH { get; set; }
        public int NamPH { get; set; }
    }
}
