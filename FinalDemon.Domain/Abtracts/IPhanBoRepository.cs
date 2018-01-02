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
        List<PhanBo> GetAllPhanBoBaiDang(int maVung);
        List<PhanBo> GetAllPhanBoBaiMoi(int maVung, int maTaiKhoan);
        int CreateNewPhanBo_User(string x, string y, PhanBo phanBo);
        int CreateNewPhanBo_ChuyenGia(string x, string y, PhanBo phanBo);
        int DeletePhanBo_User(int maLoai, int vungPhanBo, int maNguoiTao);
        int DeletePhanBo_ChuyenGia(int maLoai, int vungPhanBo);
        int UpdateBaiDang(int maLoai, int vungPhanBo, int maNguoiDuyet);
        int UpdateBaiMoi(int maLoai, int vungPhanBo, int maNguoiTao);
    }
}
