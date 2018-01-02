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
        List<MoiTruongSong> GetAllMoiTruong(int MaLoai);
        List<MoiTruongSong> GetAllMoiTruong_NgDung();
        List<MoiTruongSong> GetAllMoiTruong_ChuyenGia();
        MoiTruongSong GetMoiTruongByToaDo(string x, string y);
    }
}
