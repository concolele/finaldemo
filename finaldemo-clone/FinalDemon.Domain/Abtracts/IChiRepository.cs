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
        List<Chi> GetAllChisByHo(int maHo);
        int CreateNewChi(Chi Chi);
        int Delete(int id);
        int Edit(Chi chi);
        List<Chi> SelectByIdHo(int idHo);
        List<Chi> Search(string find);
        List<Chi> SelectByID(int id);
        //int CreateNew(string xVal, string yVal, Chi Chi);
    }
}
