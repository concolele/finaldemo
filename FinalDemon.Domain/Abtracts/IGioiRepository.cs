using FinalDemo.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FinalDemo.Domain.Abtracts
{
    public interface IGioiRepository
    {
        IQueryable<Gioi> Giois { get; }
        List<Gioi> GetAllGioi();
    }
}
