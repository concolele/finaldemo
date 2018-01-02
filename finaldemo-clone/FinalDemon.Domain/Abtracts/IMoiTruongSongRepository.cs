using FinalDemo.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FinalDemo.Domain.Abtracts
{
    public interface IMoiTruongSongRepository
    {
        IQueryable<MoiTruongSong> MoiTruong { get; }
        List<MoiTruongSong> GetAllMoiTruong();
        MoiTruongSong GetMoiTruongByToaDo(int x, int y);
    }
}
