using FinalDemo.Database;
using FinalDemo.Domain.Abtracts;
using FinalDemo.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FinalDemo.Domain.Concrete
{
    public class PhanBoRepository : IPhanBoRepository
    {
        //abc
        public IQueryable<PhanBo> PhanBos { get; set; }
        public List<PhanBo> GetAllPhanBo(int maVung)
        {
            List<PhanBo> result = new List<PhanBo>();

            string query = string.Format("SELECT * FROM {0} where VungPhanBo = {1}", PhanBo.TableName, maVung);
            DataTable data = DBCommon.Select(query);
            if (DBUtilities.TableIsNullOrEmpty(data) == TypeOfCheck.Not_Null)
            {
                foreach (DataRow dr in data.Rows)
                {
                        result.Add(new PhanBo()
                            {
                                MaLoai = Convert.ToInt32(dr[Loai.fn_MaLoai]),
                                VungPhanBo = Convert.ToInt32(dr[PhanBo.fn_VungPB]),
                                Khoa = Convert.ToInt32(dr[PhanBo.fn_Khoa])
                                //TiLePhanBo = Convert.ToInt32(dr[PhanBo.fn_TiLe]),
                                //MatDo = Convert.ToInt32(dr[PhanBo.fn_MatDo]),
                                //SoLuongCaThe = Convert.ToInt32(dr[PhanBo.fn_SoLuong]),
                            }
                        );
                }
            }
            return result;
        }
        public int DeletePhanBo_User(int maLoai, int vungPhanBo, int maNguoiTao)
        {
            string query = string.Format("DELETE FROM PhanBo WHERE {0}=@{0} and {1}=@{1} and {2}=@{2} and Khoa = -1", PhanBo.fn_MaLoai, PhanBo.fn_VungPB, PhanBo.fn_MaNguoiTao);
            SqlParameter[] par = {new SqlParameter(PhanBo.fn_MaLoai, maLoai),
                                  new SqlParameter(PhanBo.fn_VungPB, vungPhanBo),
                                  new SqlParameter(PhanBo.fn_MaNguoiTao, maNguoiTao),
                                 };
            int data = DBCommon.Execute(query, par);
            return data;
        }
        public int DeletePhanBo_ChuyenGia(int maLoai, int vungPhanBo)
        {
            string query = string.Format("DELETE FROM PhanBo WHERE {0}=@{0} and {1}=@{1}", PhanBo.fn_MaLoai, PhanBo.fn_VungPB);
            SqlParameter[] par = {new SqlParameter(PhanBo.fn_MaLoai, maLoai),
                                  new SqlParameter(PhanBo.fn_VungPB, vungPhanBo),
                                 };
            int data = DBCommon.Execute(query, par);
            return data;
        }
        public List<PhanBo> GetAllPhanBoBaiMoi(int maVung, int maNguoiTao)
        {
            List<PhanBo> result = new List<PhanBo>();

            string query = string.Format("SELECT * FROM {0} where {1}=@{1} and {2}=@{2} and Khoa = -1"
                , PhanBo.TableName, PhanBo.fn_VungPB, PhanBo.fn_MaNguoiTao);
            SqlParameter[] par = {   new SqlParameter(PhanBo.fn_VungPB, maVung),
                                     new SqlParameter(PhanBo.fn_MaNguoiTao, maNguoiTao),
                                 };
            DataTable data = DBCommon.SelectBy(query, par);
            if (DBUtilities.TableIsNullOrEmpty(data) == TypeOfCheck.Not_Null)
            {
                foreach (DataRow dr in data.Rows)
                {
                    if (dr != null)
                    {
                        result.Add(new PhanBo()
                        {
                            MaLoai = Convert.ToInt32(dr[Loai.fn_MaLoai]),
                            VungPhanBo = Convert.ToInt32(dr[PhanBo.fn_VungPB]),
                            TiLePhanBo = Convert.ToInt32(dr[PhanBo.fn_TiLe]),
                            MatDo = Convert.ToInt32(dr[PhanBo.fn_MatDo]),
                            SoLuongCaThe = Convert.ToInt32(dr[PhanBo.fn_SoLuong]),
                            NgayCapNhat = Convert.ToDateTime(dr[PhanBo.fn_NgayCapNhat]),
                            NgayDangBai = Convert.ToDateTime(dr[PhanBo.fn_NgayDang]),
                        }
                        );
                    }
                }
            }
            return result;
        }
        public List<PhanBo> GetAllPhanBoBaiDang(int maVung)
        {
            List<PhanBo> result = new List<PhanBo>();

            string query = string.Format("SELECT * FROM {0}  where Khoa != -1 and {1}=@{1}"
                , PhanBo.TableName, PhanBo.fn_VungPB);
            SqlParameter[] par = {   new SqlParameter(PhanBo.fn_VungPB, maVung),
                                 };
            DataTable data = DBCommon.SelectBy(query, par);
            if (DBUtilities.TableIsNullOrEmpty(data) == TypeOfCheck.Not_Null)
            {
                foreach (DataRow dr in data.Rows)
                {
                    if (dr != null)
                    {
                        result.Add(new PhanBo()
                        {
                            MaLoai = Convert.ToInt32(dr[Loai.fn_MaLoai]),
                            VungPhanBo = Convert.ToInt32(dr[PhanBo.fn_VungPB]),
                            TiLePhanBo = Convert.ToInt32(dr[PhanBo.fn_TiLe]),
                            MatDo = Convert.ToInt32(dr[PhanBo.fn_MatDo]),
                            SoLuongCaThe = Convert.ToInt32(dr[PhanBo.fn_SoLuong]),
                            NgayCapNhat = Convert.ToDateTime(dr[PhanBo.fn_NgayCapNhat]),
                            NgayDangBai = Convert.ToDateTime(dr[PhanBo.fn_NgayDang]),
                        }
                        );
                    }
                }
            }
            return result;
        }
        public int CreateNewPhanBo_User(string x, string y, PhanBo phanBo)
        {
            string query = string.Format("addPhanBo_User", MoiTruongSong.fn_ViDo, MoiTruongSong.fn_KinhDo, phanBo.MaLoai, phanBo.TiLePhanBo, phanBo.MatDo, phanBo.SoLuongCaThe, phanBo.TenNguoiTao, phanBo.NgayCapNhat, phanBo.NgayDangBai, phanBo.MaNguoiTao);
            SqlParameter[] par = {new SqlParameter(MoiTruongSong.fn_ViDo, x),
                                  new SqlParameter(MoiTruongSong.fn_KinhDo, y),
                                  new SqlParameter(PhanBo.fn_MaLoai, phanBo.MaLoai),
                                  new SqlParameter(PhanBo.fn_TiLe, phanBo.TiLePhanBo),
                                  new SqlParameter(PhanBo.fn_MatDo, phanBo.MatDo),
                                  new SqlParameter(PhanBo.fn_SoLuong, phanBo.SoLuongCaThe),
                                  new SqlParameter(PhanBo.fn_TenNguoiTao, phanBo.TenNguoiTao),
                                  new SqlParameter(PhanBo.fn_NgayCapNhat, phanBo.NgayCapNhat),
                                  new SqlParameter(PhanBo.fn_NgayDang, phanBo.NgayDangBai),
                                  new SqlParameter(PhanBo.fn_MaNguoiTao, phanBo.MaNguoiTao),
                                  };
            int data = DBCommon.ExecuteProcedure(query, par);
            return data;
        }
        public int CreateNewPhanBo_ChuyenGia(string x, string y, PhanBo phanBo)
        {
            string query = string.Format("addPhanBo_ChuyenGia", MoiTruongSong.fn_ViDo, MoiTruongSong.fn_KinhDo, phanBo.MaLoai, phanBo.TiLePhanBo, phanBo.MatDo, phanBo.SoLuongCaThe, phanBo.TenNguoiTao, phanBo.NgayCapNhat, phanBo.NgayDangBai, phanBo.MaNguoiTao);
            SqlParameter[] par = {new SqlParameter(MoiTruongSong.fn_ViDo, x),
                                  new SqlParameter(MoiTruongSong.fn_KinhDo, y),
                                  new SqlParameter(PhanBo.fn_MaLoai, phanBo.MaLoai),
                                  new SqlParameter(PhanBo.fn_TiLe, phanBo.TiLePhanBo),
                                  new SqlParameter(PhanBo.fn_MatDo, phanBo.MatDo),
                                  new SqlParameter(PhanBo.fn_SoLuong, phanBo.SoLuongCaThe),
                                  new SqlParameter(PhanBo.fn_TenNguoiTao, phanBo.TenNguoiTao),
                                  new SqlParameter(PhanBo.fn_NgayCapNhat, phanBo.NgayCapNhat),
                                  new SqlParameter(PhanBo.fn_NgayDang, phanBo.NgayDangBai),
                                  new SqlParameter(PhanBo.fn_MaNguoiTao, phanBo.MaNguoiTao),
                                  };
            int data = DBCommon.ExecuteProcedure(query, par);
            return data;
        }
        public int UpdateBaiDang(int maLoai, int vungPhanBo, int maNguoiDuyet)
        {
            string query = string.Format("UPDATE {0} SET Khoa = 1, {1}=@{1} WHERE {2}=@{2} and {3}=@{3}",
                PhanBo.TableName,
                PhanBo.fn_MaNguoiDuyet,
                PhanBo.fn_MaLoai,
                PhanBo.fn_VungPB);
            SqlParameter[] par = {
                                     new SqlParameter(PhanBo.fn_MaNguoiDuyet, maNguoiDuyet),
                                     new SqlParameter(PhanBo.fn_MaLoai, maLoai),
                                     new SqlParameter(PhanBo.fn_VungPB, vungPhanBo),
                                 };
            int data = DBCommon.Execute(query, par);
            return data;
        }
        public int UpdateBaiMoi(int maLoai, int vungPhanBo, int maNguoiTao)
        {
            string query = string.Format("UPDATE {0} SET Khoa = 0 WHERE {1}=@{1} and {2}=@{2} and {3}=@{3}",
                PhanBo.TableName,
                PhanBo.fn_MaLoai,
                PhanBo.fn_VungPB,
                PhanBo.fn_MaNguoiTao);//, Bo.TenNguoiTao);
            SqlParameter[] par = { // new SqlParameter(Bo.fn_Khoa, Bo.Khoa),
                                     new SqlParameter(PhanBo.fn_MaLoai, maLoai),
                                     new SqlParameter(PhanBo.fn_VungPB, vungPhanBo),
                                     new SqlParameter(PhanBo.fn_MaNguoiTao, maNguoiTao),
                                 };
            int data = DBCommon.Execute(query, par);
            return data;
        }
    }
}
