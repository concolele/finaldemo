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
    public class BoRepository : IBoRepository
    {
        public IQueryable<Bo> Bos { get; set; }
        public List<Bo> GetAllBo()
        {
            List<Bo> result = new List<Bo>();

            string query = string.Format("SELECT * FROM {0}", Bo.TableName);
            DataTable data = DBCommon.Select(query);
            if (DBUtilities.TableIsNullOrEmpty(data) == TypeOfCheck.Not_Null)
            {
                foreach (DataRow dr in data.Rows)
                {
                    if (dr != null)
                    {
                        result.Add(new Bo()
                        {
                            //TODO: Kiem tra Cell co bi NULL hay ko?
                            MaBo = Convert.ToInt32(dr[Bo.fn_MaBo]),
                            KiHieu = dr[Bo.fn_KiHieu].ToString(),
                            //Chi = Convert.ToInt32(dr[Loai.fn_Chi]),
                            DPKH = dr[Bo.fn_DPKH].ToString(),
                            TenTV = dr[Bo.fn_TenTV].ToString(),
                            NguoiPH = dr[Bo.fn_NguoiPH].ToString(),
                            NamPH = Convert.ToInt32(dr[Bo.fn_NamPH]),                           
                        }
                        );
                    }
                }
            }
            return result;
        }

        public int CreateNewBo(Bo bo)
        {
            string query = string.Format("INSERT INTO {0} ({1},{2},{3},{4},{5}) VALUES (@{1},@{2},@{3},@{4},@{5})", Bo.TableName, Bo.fn_KiHieu, Bo.fn_DPKH, Bo.fn_TenTV, Bo.fn_NguoiPH, Bo.fn_NamPH);//, bo.KiHieu, bo.DPKH, bo.TenTV, bo.NguoiPH, bo.NamPH);
            SqlParameter[] par = {//new SqlParameter(Bo.fn_MaBo, bo.MaBo),
                                  new SqlParameter(Bo.fn_KiHieu, bo.KiHieu),
                                  new SqlParameter(Bo.fn_DPKH, bo.DPKH),
                                  new SqlParameter(Bo.fn_TenTV, bo.TenTV),
                                  new SqlParameter(Bo.fn_NguoiPH, bo.NguoiPH),
                                  new SqlParameter(Bo.fn_NamPH, bo.NamPH),
                                 };
            int data = DBCommon.Execute(query, par);
            return data;

        }
        public int DeleteBo(int id)
        {
            string query = string.Format("DELETE FROM Bo WHERE {0}=@{0}", Bo.fn_MaBo);
            SqlParameter par = new SqlParameter(Bo.fn_MaBo, id);
            int data = DBCommon.Execute(query, par);
            return data;
        }
        public int EditBo(Bo Bo)
        {
            //update Bo set KiHieu='V',DanhPhapKhoaHoc='222',TenTiengViet='222',NguoiPhatHien='222',NamPhatHien='2222' where MaBo=5
            string query = string.Format("UPDATE {0} SET {1}=@{1},{2}=@{2},{3}=@{3},{4}=@{4},{5}=@{5} WHERE {6}=@{6}", Bo.TableName, Bo.fn_KiHieu, Bo.fn_DPKH, Bo.fn_TenTV, Bo.fn_NguoiPH, Bo.fn_NamPH, Bo.fn_MaBo);
            SqlParameter[] par = {new SqlParameter(Bo.fn_KiHieu,Bo.KiHieu),
                                  new SqlParameter(Bo.fn_DPKH,Bo.DPKH),
                                  new SqlParameter(Bo.fn_TenTV,Bo.TenTV),
                                  new SqlParameter(Bo.fn_NguoiPH,Bo.NguoiPH),
                                  new SqlParameter(Bo.fn_NamPH,Bo.NamPH),
                                  new SqlParameter(Bo.fn_MaBo,Bo.MaBo),
                                 };
            int data = DBCommon.Execute(query, par);
            return data;
        }
        public List<Bo> SelectByID(int id)
        {
            List<Bo> result = new List<Bo>();

            string query = string.Format("SELECT * FROM {0} WHERE {1}={2}", Bo.TableName, Bo.fn_MaBo, id);
            DataTable data = DBCommon.Select(query);
            if (DBUtilities.TableIsNullOrEmpty(data) == TypeOfCheck.Not_Null)
            {
                foreach (DataRow dr in data.Rows)
                {
                    result.Add(new Bo()
                    {
                        //TODO: Kiem tra Cell co bi NULL hay ko?
                        MaBo = Convert.ToInt32(dr[Bo.fn_MaBo]),
                        KiHieu = dr[Bo.fn_KiHieu].ToString(),
                        DPKH = dr[Bo.fn_DPKH].ToString(),
                        TenTV = dr[Bo.fn_TenTV].ToString(),
                        NguoiPH = dr[Bo.fn_NguoiPH].ToString(),
                        NamPH = Convert.ToInt32(dr[Bo.fn_NamPH]),
                    }
                        );
                }
            }
            return result;
        }
        public List<Bo> SelectBy(string find)
        {
            List<Bo> result = new List<Bo>();
            string query = string.Format("SELECT * FROM {0} WHERE {1} LIKE @{1} or {2} LIKE @{2} or {3} LIKE @{3} or {4} LIKE @{4} or {5} LIKE @{5} or {6} LIKE @{6}", Bo.TableName, Bo.fn_MaBo, Bo.fn_KiHieu, Bo.fn_DPKH, Bo.fn_TenTV, Bo.fn_NguoiPH, Bo.fn_NamPH);
            SqlParameter[] par = {new SqlParameter(Bo.fn_KiHieu,"%" + find + "%"),
                                  new SqlParameter(Bo.fn_DPKH,"%" + find + "%"),
                                  new SqlParameter(Bo.fn_TenTV,"%" + find + "%"),
                                  new SqlParameter(Bo.fn_NguoiPH,"%" + find + "%"),
                                  new SqlParameter(Bo.fn_NamPH,"%" + find + "%"),
                                  new SqlParameter(Bo.fn_MaBo,"%" + find + "%"),
                                 };
            DataTable data = DBCommon.SelectBy(query, par);
            if (DBUtilities.TableIsNullOrEmpty(data) == TypeOfCheck.Not_Null)
            {
                foreach (DataRow dr in data.Rows)
                {
                    result.Add(new Bo()
                    {
                        //TODO: Kiem tra Cell co bi NULL hay ko?
                        MaBo = Convert.ToInt32(dr[Bo.fn_MaBo]),
                        KiHieu = dr[Bo.fn_KiHieu].ToString(),
                        DPKH = dr[Bo.fn_DPKH].ToString(),
                        TenTV = dr[Bo.fn_TenTV].ToString(),
                        NguoiPH = dr[Bo.fn_NguoiPH].ToString(),
                        NamPH = Convert.ToInt32(dr[Bo.fn_NamPH]),
                    }
                        );
                }
            }
            return result;
        }
    }
}
