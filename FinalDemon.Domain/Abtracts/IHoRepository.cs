using FinalDemo.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FinalDemo.Domain.Abtracts
{
    public interface IHoRepository
    {
        IQueryable<Ho> Hos { get; }
        List<Ho> GetAllHo();
        List<Ho> GetAllHoBaiDang();
        List<Ho> GetAllHoBaiMoi();
        List<Ho> GetAllHosByBo(int maBo);
        int UpdateBaiMoi(int id);
        int UpdateBaiDang(int id, int maTaoKhoan);
        int CreateNewHo(Ho Ho);
        int EditHo(Ho Ho);
        List<Ho> SelectByID(int idHo, int maNguoiTao);
        List<Ho> SelectByID(int idHo);
        List<Ho> SelectBy(string searchTerm);
        List<string> SelectAuto(string term);
        int DeleteHo(int id, int maNguoiTao);
    }
}
