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

            string query = string.Format("SELECT * FROM {0} where VungPhanBo = {1};", PhanBo.TableName, maVung);
            DataTable data = DBCommon.Select(query);
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
                            }
                        );
                    }
                }
            }
            return result;
        }
        public int CreateNewPhanBo(int x, int y, PhanBo phanBo)
        {
            string query = string.Format("addPhanBo", MoiTruongSong.fn_ViDo, MoiTruongSong.fn_KinhDo, phanBo.MaLoai, phanBo.TiLePhanBo, phanBo.MatDo, phanBo.SoLuongCaThe);
            SqlParameter[] par = {new SqlParameter(MoiTruongSong.fn_ViDo, x),
                                  new SqlParameter(MoiTruongSong.fn_KinhDo, y),
                                  new SqlParameter(PhanBo.fn_MaLoai, phanBo.MaLoai),
                                  new SqlParameter(PhanBo.fn_TiLe, phanBo.TiLePhanBo),
                                  new SqlParameter(PhanBo.fn_MatDo, phanBo.MatDo),
                                  new SqlParameter(PhanBo.fn_SoLuong, phanBo.SoLuongCaThe),
                                  };
            int data = DBCommon.ExecuteProcedure(query, par);
            return data;

        }
    }
}
