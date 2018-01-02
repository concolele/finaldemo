using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FinalDemo.Domain.Entities
{
    public class PhanBo
    {
        public const string TableName = "PhanBo";
        public const string fn_MaLoai = "MaLoai";
        public const string fn_VungPB = "VungPhanBo";
        public const string fn_TiLe = "TiLePhanBo";
        public const string fn_MatDo = "MatDo";
        public const string fn_SoLuong = "SoLuongCaThe";
        public int MaLoai { get; set; }
        public int VungPhanBo { get; set; }
        public int TiLePhanBo { get; set; }
        public int MatDo { get; set; }
        public int SoLuongCaThe { get; set; }
    }
}
