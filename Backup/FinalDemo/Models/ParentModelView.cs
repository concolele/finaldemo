using AuthTool;
using FinalDemo.Domain.Entities;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FinalDemo.Models
{
    public class ParentModelView
    {
        public TaiKhoan tk { get; set; }
        public BoViewModel bo { get; set; }
        public HoViewModel ho { get; set; }
        public ChiViewModel chi { get; set; }
        public LoaiViewModel loai { get; set; }
    }
}