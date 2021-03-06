﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FinalDemo.Domain.Entities
{
    public class Chi
    {
        public const string TableName = "Chi";
        public const string fn_MaChi = "MaChi";
        public const string fn_KiHieu = "KiHieu";
        public const string fn_Ho = "Ho";
        public const string fn_DPKH = "DanhPhapKhoaHoc";
        public const string fn_TenTV = "TenTiengViet";
        public const string fn_NguoiPH = "NguoiPhatHien";
        public const string fn_NamPH = "NamPhatHien";
        public const string fn_TenNguoiTao = "TenNguoiTao";
        public const string fn_Khoa = "Khoa";
        public const string fn_NgayCapNhat = "NgayCapNhat";
        public const string fn_NgayDang = "NgayDangBai";
        public const string fn_MaNguoiTao = "MaNguoiTao";
        public const string fn_MaNguoiDuyet = "MaNguoiDuyet";
        public int MaChi { get; set; }
        public string KiHieu { get; set; }
        public int Ho { get; set; }
        public string DPKH { get; set; }
        public string TenTV { get; set; }
        public string NguoiPH { get; set; }
        public int NamPH { get; set; }
        public string TenNguoiTao { get; set; }
        public int Khoa { get; set; }
        public DateTime NgayCapNhat { get; set; }
        public DateTime NgayDangBai { get; set; }
        public int MaNguoiTao { get; set; }
        public int MaNguoiDuyet { get; set; }
    }
}
