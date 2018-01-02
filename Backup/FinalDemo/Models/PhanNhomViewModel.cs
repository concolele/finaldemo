using AuthTool;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FinalDemo.Models
{
    public class PhanNhomViewModel
    {
        public IEnumerable<Group> AllGroup { get; set; }
        public IEnumerable<Group> SelectedGroup { get; set; }
        public PostedGroup PostedGroups { get; set; }
        public int MaDoiTuong { get; set; }
        public int KieuDoiTuong { get; set; }
    }
}