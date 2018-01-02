using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FinalDemo.Domain.Entities
{
    public class Loai
    {
        public const string TableName = "Loai";
        public const string fn_MaLoai = "MaLoai";
        public const string fn_KiHieu = "KiHieu";
        public const string fn_Chi = "Chi";
        public const string fn_DPKH = "DanhPhapKhoaHoc";
        public const string fn_TenTG = "TenThuongGoi";
        public const string fn_TenK = "TenKhac";
        public const string fn_SoLuong = "SoLuongCaThe";
        public const string fn_DDSinhSan = "DacDiemSinhSan";
        public const string fn_DDGioitinh = "DacDiemGioiTinh";
        public const string fn_DDKhac = "DacDiemKhac";
        public const string fn_MucDo = "MucDoBaoDong";
        public const string fn_NguoiPH = "NguoiPhatHien";
        public const string fn_NamPH = "NamPhatHien";
        public const string fn_TapTinhSH = "TapTinhSinhHoc";
        public const string fn_KichCoTB = "KichCoTrungBinh";
        public const string fn_ThucAn = "ThucAn";
        public const string fn_XuatXu = "XuatXu";
        public const string fn_Image = "Image";
        public const string fn_TenNguoiTao = "TenNguoiTao";
        public const string fn_Khoa = "Khoa";
        public const string fn_NgayCapNhat = "NgayCapNhat";
        public const string fn_NgayDang = "NgayDangBai";
        public const string fn_MaNguoiTao = "MaNguoiTao";
        public const string fn_MaNguoiDuyet = "MaNguoiDuyet";
        public int MaLoai { get; set; }
        public string KiHieu { get; set; }
        public int Chi { get; set; }
        public string DPKH { get; set; }
        public string TenTG { get; set; }
        public string TenK { get; set; }
        public int SoLuong { get; set; }
        public string DDSinhSan { get; set; }
        public string DDGioiTinh { get; set; }
        public string DDKhac { get; set; }
        public string MucDo { get; set; }
        public string NguoiPH { get; set; }
        public int NamPH { get; set; }
        public string TapTinhSH { get; set; }
        public float KichCoTB { get; set; }
        public string ThucAn { get; set; }
        public int XuatXu { get; set; }
        public string Image { get; set; }
        public string TenNguoiTao { get; set; }
        public int Khoa { get; set; }
        public DateTime NgayCapNhat { get; set; }
        public DateTime NgayDangBai { get; set; }
        public int MaNguoiTao { get; set; }
        public int MaNguoiDuyet { get; set; }
    }
}
