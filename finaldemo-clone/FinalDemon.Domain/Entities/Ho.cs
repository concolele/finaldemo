using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FinalDemo.Domain.Entities
{
    public class Ho
    {
        public const string TableName = "Ho";
        public const string fn_MaHo = "MaHo";
        public const string fn_KiHieu = "KiHieu";
        public const string fn_Bo = "Bo";
        public const string fn_DPKH = "DanhPhapKhoaHoc";
        public const string fn_TenTV = "TenTiengViet";
        public const string fn_NguoiPH = "NguoiPhatHien";
        public const string fn_NamPH = "NamPhatHien";
        public int MaHo { get; set; }
        public string KiHieu { get; set; }
        public int Bo { get; set; }
        public string DPKH { get; set; }
        public string TenTV { get; set; }
        public string NguoiPH { get; set; }
        public int NamPH { get; set; }

    }
}
