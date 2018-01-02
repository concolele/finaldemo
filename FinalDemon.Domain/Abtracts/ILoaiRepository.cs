using FinalDemo.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FinalDemo.Domain.Abtracts
{
    public interface ILoaiRepository
    {
        IQueryable<Loai> Loais { get; }
        List<Loai> GetAllLoai();
        List<Loai> GetAllLoaiBaiDang();
        List<Loai> GetAllLoaiBaiMoi();
        List<Loai> GetAllLoaisByChi(int maChi);
        int CreateNewLoai(Loai Loai);
        int DeleteLoai(int id, int maNguoiTao);
        int EditLoai(Loai Loai);
        int UpdateBaiDang(int id, int maTaiKhoan);
        int UpdateBaiMoi(int id);
        List<Loai> SelectByID(int id);
        List<Loai> SelectByID(int id, int maNguoiTao);
        List<Loai> SelectBy(string find);
        List<string> SelectAuto(string term);
        List<Loai> SelectBy(string xVal, string yVal);
        int CreateNew(string xVal, string yVal, Loai loai);
    }
}
