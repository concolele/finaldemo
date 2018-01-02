using FinalDemo.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FinalDemo.Domain.Abtracts
{
    public interface INganhRepository
    {
        IQueryable<Nganh> Nganhs { get; }
        List<Nganh> GetAllNganh();
        List<Nganh> GetAllNganhsByGioi(int maGioi);
    }
}
