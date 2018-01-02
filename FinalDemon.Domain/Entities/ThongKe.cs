using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FinalDemo.Domain.Entities
{
    public class ThongKe
    {
        public const string fn_MaBo = "MaBo";
        //public const string fn_Lop = "Lop";
        public const string fn_TenTV = "TenTiengViet";
        public const string fn_Ho = "Ho";
        public const string fn_perHo = "perHo";
        public const string fn_Chi = "Chi";
        public const string fn_perChi = "perChi";
        public const string fn_Loai = "Loai";
        public const string fn_perLoai = "perLoai";
        public int MaBo { get; set; }
        //public int Lop { get; set; }
        public string TenTiengViet { get; set; }
        public int Ho { get; set; }
        public float perHo { get; set; }
        public int Chi { get; set; }
        public float perChi { get; set; }
        public int Loai { get; set; }
        public float perLoai { get; set; }
    }
}
