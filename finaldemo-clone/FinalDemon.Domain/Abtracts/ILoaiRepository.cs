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
        List<Loai> GetAllLoaisByChi(int maChi);
        int CreateNewLoai(Loai Loai);
        int DeleteLoai(int id);
        int EditLoai(Loai Loai);
        List<Loai> SelectByID(int id);
        List<Loai> SelectBy(string find);
        List<Loai> SelectBy(string xVal, string yVal);
        int CreateNew(string xVal, string yVal, Loai loai);
    }
}
