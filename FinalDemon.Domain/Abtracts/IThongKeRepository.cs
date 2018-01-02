using FinalDemo.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FinalDemo.Domain.Abtracts
{
    public interface IThongKeRepository
    {
        IQueryable<ThongKe> ThongKes { get; }
        List<ThongKe> GetThongKeByLop(int Lop);
    }
}
