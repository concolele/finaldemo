using FinalDemo.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FinalDemo.Domain.Abtracts
{
    public interface ILopRepository
    {
        IQueryable<Lop> Lops { get; }
        List<Lop> GetAllLop();
        List<Lop> GetAllLopsByNganh(int maNganh);
    }
}
