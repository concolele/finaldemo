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
    public class MoiTruongSongRepository : IMoiTruongSongRepository
    {
        public IQueryable<MoiTruongSong> MoiTruong { get; set; }
        public List<MoiTruongSong> GetAllMoiTruong()
        {
            List<MoiTruongSong> result = new List<MoiTruongSong>();

            string query = string.Format("select * from {0} a join {1} b on a.MaVung = b.VungPhanBo where Khoa= 1", MoiTruongSong.TableName, PhanBo.TableName);
            DataTable data = DBCommon.Select(query);
            if (DBUtilities.TableIsNullOrEmpty(data) == TypeOfCheck.Not_Null)
            {
                foreach (DataRow dr in data.Rows)
                {
                    result.Add(new MoiTruongSong()
                    {
                        //TODO: Kiem tra Cell co bi NULL hay ko?
                        MaVung = Convert.ToInt32(dr[MoiTruongSong.fn_MaVung]),
                        TenViTri = dr[MoiTruongSong.fn_TenVT].ToString(),
                        ViDo = dr[MoiTruongSong.fn_ViDo].ToString(),
                        KinhDo = dr[MoiTruongSong.fn_KinhDo].ToString(),

                    }
                        );
                }
            }
            return result;
        }
        public List<MoiTruongSong> GetAllMoiTruong(int MaLoai)
        {
            List<MoiTruongSong> result = new List<MoiTruongSong>();

            string query = string.Format("select * from {0} a join {1} b on a.MaVung = b.VungPhanBo where Khoa= 1 and {2} = @{2}", MoiTruongSong.TableName, PhanBo.TableName, PhanBo.fn_MaLoai);
            SqlParameter[] par = {   new SqlParameter(PhanBo.fn_MaLoai, MaLoai),
                                 };
            DataTable data = DBCommon.SelectBy(query, par);
            if (DBUtilities.TableIsNullOrEmpty(data) == TypeOfCheck.Not_Null)
            {
                foreach (DataRow dr in data.Rows)
                {
                    result.Add(new MoiTruongSong()
                    {
                        //TODO: Kiem tra Cell co bi NULL hay ko?
                        MaVung = Convert.ToInt32(dr[MoiTruongSong.fn_MaVung]),
                        TenViTri = dr[MoiTruongSong.fn_TenVT].ToString(),
                        ViDo = dr[MoiTruongSong.fn_ViDo].ToString(),
                        KinhDo = dr[MoiTruongSong.fn_KinhDo].ToString(),

                    }
                        );
                }
            }
            return result;
        }
        public List<MoiTruongSong> GetAllMoiTruong_NgDung()
        {
            List<MoiTruongSong> result = new List<MoiTruongSong>();

            string query = string.Format("select * from {0} a join {1} b on a.MaVung = b.VungPhanBo where Khoa =-1", MoiTruongSong.TableName, PhanBo.TableName);
            DataTable data = DBCommon.Select(query);
            if (DBUtilities.TableIsNullOrEmpty(data) == TypeOfCheck.Not_Null)
            {
                foreach (DataRow dr in data.Rows)
                {
                    result.Add(new MoiTruongSong()
                    {
                        //TODO: Kiem tra Cell co bi NULL hay ko?
                        MaVung = Convert.ToInt32(dr[MoiTruongSong.fn_MaVung]),
                        //TenViTri = dr[MoiTruongSong.fn_TenVT].ToString(),
                        ViDo = dr[MoiTruongSong.fn_ViDo].ToString(),
                        KinhDo = dr[MoiTruongSong.fn_KinhDo].ToString(),

                    }
                        );
                }
            }
            return result;
        }
        public List<MoiTruongSong> GetAllMoiTruong_ChuyenGia()
        {
            List<MoiTruongSong> result = new List<MoiTruongSong>();

            string query = string.Format("select * from {0} a join {1} b on a.MaVung = b.VungPhanBo where Khoa != -1", MoiTruongSong.TableName, PhanBo.TableName);
            DataTable data = DBCommon.Select(query);
            if (DBUtilities.TableIsNullOrEmpty(data) == TypeOfCheck.Not_Null)
            {
                foreach (DataRow dr in data.Rows)
                {
                    result.Add(new MoiTruongSong()
                    {
                        //TODO: Kiem tra Cell co bi NULL hay ko?
                        MaVung = Convert.ToInt32(dr[MoiTruongSong.fn_MaVung]),
                        TenViTri = dr[MoiTruongSong.fn_TenVT].ToString(),
                        ViDo = dr[MoiTruongSong.fn_ViDo].ToString(),
                        KinhDo = dr[MoiTruongSong.fn_KinhDo].ToString(),

                    }
                        );
                }
            }
            return result;
        }
        public MoiTruongSong GetMoiTruongByToaDo(string x, string y)
        {
            string query = string.Format("SELECT * FROM {0} where ViDo = {1} and KinhDo = {2}", MoiTruongSong.TableName, x, y);
            DataTable data = DBCommon.Select(query);
            if (DBUtilities.TableIsNullOrEmpty(data) == TypeOfCheck.Not_Null)
            {
                MoiTruongSong result = new MoiTruongSong();
                DataRow dr = data.Rows[0];
                result.MaVung = Convert.ToInt32(dr[MoiTruongSong.fn_MaVung]);
                result.TenViTri = dr[MoiTruongSong.fn_TenVT].ToString();
                result.ViDo = dr[MoiTruongSong.fn_ViDo].ToString();
                result.KinhDo = dr[MoiTruongSong.fn_KinhDo].ToString();
                return result;
            }
            return null;
        }
    }        
}
