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
        List<Ho> GetAllHosByBo(int maBo);
        int CreateNewHo(Ho Ho);
        //int DeleteHo(int id);
        int EditHo(Ho Ho);
        List<Ho> SelectByID(int idBo);
        List<Ho> SelectBy(string find);
        //List<Ho> SelectBy(string xVal, string yVal);
        //int CreateNew(string xVal, string yVal, Ho Ho);

        int DeleteHo(int id);
    }
}
