using AuthTool;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FinalDemo.Models
{
    public class ChucNangViewModel
    {
        public IEnumerable<ChucNang> AllChucNang { get; set; }
        public IEnumerable<ChucNang> SelectedChucNang { get; set; }
        public PostedChucNang PostedChucNangs { get; set; }
        public int MaNhom { get; set; }
        public int MaDoiTuong { get; set; }
        public string KieuDoiTuong { get; set; }
    }
}