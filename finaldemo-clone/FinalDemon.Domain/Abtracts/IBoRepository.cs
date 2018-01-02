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
        int CreateNewBo(Bo Bo);
        int DeleteBo(int id);
        int EditBo(Bo Bo);
        List<Bo> SelectByID(int id);
        List<Bo> SelectBy(string find);
        //List<Bo> SelectBy(string xVal, string yVal);
        //int CreateNew(string xVal, string yVal, Bo Bo);
    }
}
