using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FinalDemo.Domain.Entities
{
    public class MoiTruongSong
    {
        public const string TableName = "MoiTruongSong";
        public const string fn_MaVung = "MaVung";
        public const string fn_TenVT = "TenViTri";
        public const string fn_ViDo = "ViDo";
        public const string fn_KinhDo = "KinhDo";
        public int MaVung { get; set; }
        public string TenViTri { get; set; }
        public int ViDo { get; set; }
        public int KinhDo { get; set; }
    }
}
