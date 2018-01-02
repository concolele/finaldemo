using FinalDemo.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FinalDemo.Domain.Abtracts
{
    public interface IChiRepository
    {
        IQueryable<Chi> Chis { get; }
        List<Chi> GetAllChi();
        List<Chi> GetAllChiBaiDang();
        List<Chi> GetAllChiBaiMoi();
        int UpdateBaiDang(int id, int maNguoiTao);
        int UpdateBaiMoi(int id);
        List<Chi> GetAllChisByHo(int maHo);
        int CreateNewChi(Chi Chi);
        int Delete(int id, int maNguoiTao);
        int Edit(Chi chi);
        List<Chi> SelectByIdHo(int idHo);
        List<Chi> Search(string searchTerm);
        List<Chi> SelectByID(int id, int maNguoiTao);
        List<Chi> SelectByID(int id);
        List<string> SelectAuto(string term);
    }
}
