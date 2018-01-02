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
    public class HoRepository : IHoRepository
    {
        public IQueryable<Ho> Hos { get; set; }
        public List<Ho> GetAllHo()
        {
            List<Ho> result = new List<Ho>();

            string query = string.Format("SELECT * FROM {0}", Ho.TableName);
            DataTable data = DBCommon.Select(query);
            if (DBUtilities.TableIsNullOrEmpty(data) == TypeOfCheck.Not_Null)
            {
                foreach (DataRow dr in data.Rows)
                {
                    if (dr != null)
                    {
                        result.Add(new Ho()
                        {
                            //TODO: Kiem tra Cell co bi NULL hay ko?
                            MaHo = Convert.ToInt32(dr[Ho.fn_MaHo]),
                            KiHieu = dr[Ho.fn_KiHieu].ToString(),
                            Bo = Convert.ToInt32(dr[Ho.fn_Bo]),
                            DPKH = dr[Ho.fn_DPKH].ToString(),
                            TenTV = dr[Ho.fn_TenTV].ToString(),
                            NguoiPH = dr[Ho.fn_NguoiPH].ToString(),
                            NamPH = Convert.ToInt32(dr[Ho.fn_NamPH]),
                        }
                        );
                    }
                }
            }
            return result;
        }

        public List<Ho> GetAllHosByBo(int maBo)
        {
            List<Ho> result = new List<Ho>();

            string query = string.Format("SELECT * FROM {0} where Bo = {1}", Ho.TableName, maBo);
            DataTable data = DBCommon.Select(query);
            if (DBUtilities.TableIsNullOrEmpty(data) == TypeOfCheck.Not_Null)
            {
                foreach (DataRow dr in data.Rows)
                {
                    if (dr != null)
                    {
                        result.Add(new Ho()
                        {
                            //TODO: Kiem tra Cell co bi NULL hay ko?
                            MaHo = Convert.ToInt32(dr[Ho.fn_MaHo]),
                            KiHieu = dr[Ho.fn_KiHieu].ToString(),
                            Bo = Convert.ToInt32(dr[Ho.fn_Bo]),
                            DPKH = dr[Ho.fn_DPKH].ToString(),
                            TenTV = dr[Ho.fn_TenTV].ToString(),
                            NguoiPH = dr[Ho.fn_NguoiPH].ToString(),
                            NamPH = Convert.ToInt32(dr[Ho.fn_NamPH]),
                        }
                        );
                    }
                }
            }
            return result;
        }
        public List<Ho> SelectByID(int idBo)
        {
            List<Ho> result = new List<Ho>();

            string query = string.Format("SELECT * FROM {0} WHERE {1}={2}", Ho.TableName, Ho.fn_MaHo, idBo);
            DataTable data = DBCommon.Select(query);
            if (DBUtilities.TableIsNullOrEmpty(data) == TypeOfCheck.Not_Null)
            {
                foreach (DataRow dr in data.Rows)
                {
                    result.Add(new Ho()
                    {
                        //TODO: Kiem tra Cell co bi NULL hay ko?
                        MaHo = Convert.ToInt32(dr[Ho.fn_MaHo]),
                        KiHieu = dr[Ho.fn_KiHieu].ToString(),
                        Bo = Convert.ToInt32(dr[Ho.fn_Bo]),
                        DPKH = dr[Ho.fn_DPKH].ToString(),
                        TenTV = dr[Ho.fn_TenTV].ToString(),
                        NguoiPH = dr[Ho.fn_NguoiPH].ToString(),
                        NamPH = Convert.ToInt32(dr[Bo.fn_NamPH]),

                    }
                        );
                }
            }
            return result;
        }
        public int CreateNewHo(Ho Ho)
        {
            string query = string.Format("INSERT INTO {0} ({1},{2},{3},{4},{5},{6}) VALUES (@{1},@{2},@{3},@{4},@{5},@{6})", Ho.TableName, Ho.fn_KiHieu, Ho.fn_Bo, Ho.fn_DPKH, Ho.fn_TenTV, Ho.fn_NguoiPH, Ho.fn_NamPH);//, Ho.KiHieu, Ho.DPKH, Ho.TenTV, Ho.NguoiPH, Ho.NamPH);
            SqlParameter[] par = {
                                  new SqlParameter(Ho.fn_KiHieu, Ho.KiHieu),
                                  new SqlParameter(Ho.fn_Bo, Ho.Bo),
                                  new SqlParameter(Ho.fn_DPKH, Ho.DPKH),
                                  new SqlParameter(Ho.fn_TenTV, Ho.TenTV),
                                  new SqlParameter(Ho.fn_NguoiPH, Ho.NguoiPH),
                                  new SqlParameter(Ho.fn_NamPH, Ho.NamPH),
                                 };
            int data = DBCommon.Execute(query, par);
            return data;

        }
        public int DeleteHo(int id)
        {
            string query = string.Format("DELETE FROM Ho WHERE {0}=@{0}", Ho.fn_MaHo);
            SqlParameter par = new SqlParameter(Ho.fn_MaHo, id);
            int data = DBCommon.Execute(query, par);
            return data;
        }
        public int EditHo(Ho Ho)
        {
            //update Ho set KiHieu='V',DanhPhapKhoaHoc='222',TenTiengViet='222',NguoiPhatHien='222',NamPhatHien='2222' where MaHo=5
            string query = string.Format("UPDATE {0} SET {1}=@{1},{2}=@{2},{3}=@{3},{4}=@{4},{5}=@{5} WHERE {6}=@{6}", Ho.TableName, Ho.fn_KiHieu, Ho.fn_DPKH, Ho.fn_TenTV, Ho.fn_NguoiPH, Ho.fn_NamPH, Ho.fn_MaHo);
            SqlParameter[] par = {new SqlParameter(Ho.fn_KiHieu,Ho.KiHieu),
                                  new SqlParameter(Ho.fn_DPKH,Ho.DPKH),
                                  new SqlParameter(Ho.fn_TenTV,Ho.TenTV),
                                  new SqlParameter(Ho.fn_NguoiPH,Ho.NguoiPH),
                                  new SqlParameter(Ho.fn_NamPH,Ho.NamPH),
                                  new SqlParameter(Ho.fn_MaHo,Ho.MaHo),
                                 };
            int data = DBCommon.Execute(query, par);
            return data;
        }
        public List<Ho> SelectBy(string find)
        {
            List<Ho> result = new List<Ho>();
            string query = string.Format("SELECT * FROM {0} WHERE {1} LIKE @{1} or {2} LIKE @{2} or {3} LIKE @{3} or {4} LIKE @{4} or {5} LIKE @{5} or {6} LIKE @{6} or {7} LIKE @{7}", Ho.TableName, Ho.fn_MaHo, Ho.fn_KiHieu, Ho.fn_DPKH, Ho.fn_TenTV, Ho.fn_NguoiPH, Ho.fn_NamPH, Ho.fn_Bo);
            SqlParameter[] par = {new SqlParameter(Ho.fn_KiHieu,"%" + find + "%"),
                                  new SqlParameter(Ho.fn_DPKH,"%" + find + "%"),
                                  new SqlParameter(Ho.fn_TenTV,"%" + find + "%"),
                                  new SqlParameter(Ho.fn_NguoiPH,"%" + find + "%"),
                                  new SqlParameter(Ho.fn_NamPH,"%" + find + "%"),
                                  new SqlParameter(Ho.fn_MaHo,"%" + find + "%"),
                                  new SqlParameter(Ho.fn_Bo,"%" + find + "%"),
                                 };
            DataTable data = DBCommon.SelectBy(query, par);
            if (DBUtilities.TableIsNullOrEmpty(data) == TypeOfCheck.Not_Null)
            {
                foreach (DataRow dr in data.Rows)
                {
                    result.Add(new Ho()
                    {
                        //TODO: Kiem tra Cell co bi NULL hay ko?
                        MaHo = Convert.ToInt32(dr[Ho.fn_MaHo]),
                        KiHieu = dr[Ho.fn_KiHieu].ToString(),
                        Bo = Convert.ToInt32(dr[Ho.fn_Bo]),
                        DPKH = dr[Ho.fn_DPKH].ToString(),
                        TenTV = dr[Ho.fn_TenTV].ToString(),
                        NguoiPH = dr[Ho.fn_NguoiPH].ToString(),
                        NamPH = Convert.ToInt32(dr[Ho.fn_NamPH]),
                    }
                        );
                }
            }
            return result;
        }
    }
}
