using FinalDemo.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FinalDemo.Domain.Abtracts
{
    public interface IBoRepository
    {
        IQueryable<Bo> Bos { get; }
        List<Bo> GetAllBo();
        List<Bo> GetAllBoBaiDang();
        List<Bo> GetAllBoBaiMoi(int maTaiKhoan);
        int CreateNewBo(Bo Bo);
        List<Bo> GetAllBosByLop(int maLop);
        int DeleteBo(int id, int maNguoiTao);
        int EditBo(Bo Bo);
        int UpdateBaiDang(int id, int maNguoiTao);
        int UpdateBaiMoi(int id);
        List<Bo> SelectByID(int id);
        List<Bo> SelectByID(int id, int maNguoiTao);
        List<Bo> SelectBy(string find);
        List<string> SelectAuto(string term);
        //List<Bo> SelectBy(string xVal, string yVal);
        //int CreateNew(string xVal, string yVal, Bo Bo);
    }
}
