using FinalDemo.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FinalDemo.Domain.Abtracts
{
    public interface IPhanBoRepository
    {
        IQueryable<PhanBo> PhanBos { get; }
        List<PhanBo> GetAllPhanBo(int maVung);
        int CreateNewPhanBo(int x, int y, PhanBo phanBo);
        //int DeletePhanBo(int id);
        //int EditPhanBo(PhanBo phanBo);
        //List<PhanBo> SelectByID(int id);
        //List<PhanBo> SelectBy(string find);
        //List<PhanBo> SelectBy(string xVal, string yVal);
    }
}
