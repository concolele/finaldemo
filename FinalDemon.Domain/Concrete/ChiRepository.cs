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
    public class ChiRepository : IChiRepository
    {
        public IQueryable<Chi> Chis { get; set; }
        public List<Chi> GetAllChi()
        {
            List<Chi> result = new List<Chi>();

            string query = string.Format("SELECT * FROM {0} where Khoa = 1 or Khoa is NULL", Chi.TableName);
            DataTable data = DBCommon.Select(query);
            if (DBUtilities.TableIsNullOrEmpty(data) == TypeOfCheck.Not_Null)
            {
                foreach (DataRow dr in data.Rows)
                {
                    if (dr != null)
                    {
                        result.Add(new Chi()
                        {
                            //TODO: Kiem tra Cell co bi NULL hay ko?
                            MaChi = Convert.ToInt32(dr[Chi.fn_MaChi]),
                            KiHieu = dr[Chi.fn_KiHieu].ToString(),
                            Ho = Convert.ToInt32(dr[Chi.fn_Ho]),
                            DPKH = dr[Chi.fn_DPKH].ToString(),
                            TenTV = dr[Chi.fn_TenTV].ToString(),
                            NguoiPH = dr[Chi.fn_NguoiPH].ToString(),
                            NamPH = Convert.ToInt32(dr[Chi.fn_NamPH]),

                        }
                        );
                    }
                }
            }
            return result;
        }
        public List<Chi> GetAllChiBaiDang()
        {
            List<Chi> result = new List<Chi>();

            string query = string.Format("SELECT * FROM {0} where Khoa = 0", Chi.TableName);
            DataTable data = DBCommon.Select(query);
            if (DBUtilities.TableIsNullOrEmpty(data) == TypeOfCheck.Not_Null)
            {
                foreach (DataRow dr in data.Rows)
                {
                    if (dr != null)
                    {
                        result.Add(new Chi()
                        {
                            //TODO: Kiem tra Cell co bi NULL hay ko?
                            MaChi = Convert.ToInt32(dr[Chi.fn_MaChi]),
                            Ho = Convert.ToInt32(dr[Chi.fn_Ho]),
                            DPKH = dr[Chi.fn_DPKH].ToString(),
                            TenTV = dr[Chi.fn_TenTV].ToString(),
                            NguoiPH = dr[Chi.fn_NguoiPH].ToString(),
                            NamPH = Convert.ToInt32(dr[Chi.fn_NamPH]),
                            NgayCapNhat = Convert.ToDateTime(dr[Chi.fn_NgayCapNhat]),
                            NgayDangBai = Convert.ToDateTime(dr[Chi.fn_NgayDang]),
                        }
                        );
                    }
                }
            }
            return result;
        }
        public List<Chi> GetAllChiBaiMoi()
        {
            List<Chi> result = new List<Chi>();

            string query = string.Format("SELECT * FROM {0} where Khoa = -1", Chi.TableName);
            DataTable data = DBCommon.Select(query);
            if (DBUtilities.TableIsNullOrEmpty(data) == TypeOfCheck.Not_Null)
            {
                foreach (DataRow dr in data.Rows)
                {
                    if (dr != null)
                    {
                        result.Add(new Chi()
                        {
                            //TODO: Kiem tra Cell co bi NULL hay ko?
                            MaChi = Convert.ToInt32(dr[Chi.fn_MaChi]),
                            Ho = Convert.ToInt32(dr[Chi.fn_Ho]),
                            DPKH = dr[Chi.fn_DPKH].ToString(),
                            TenTV = dr[Chi.fn_TenTV].ToString(),
                            NguoiPH = dr[Chi.fn_NguoiPH].ToString(),
                            NamPH = Convert.ToInt32(dr[Chi.fn_NamPH]),
                            NgayCapNhat = Convert.ToDateTime(dr[Chi.fn_NgayCapNhat]),
                            NgayDangBai = Convert.ToDateTime(dr[Chi.fn_NgayDang]),
                        }
                        );
                    }
                }
            }
            return result;
        }
        public List<Chi> GetAllChisByHo(int maHo)
        {
            List<Chi> result = new List<Chi>();

            string query = string.Format("SELECT * FROM {0} where Ho={1} ", Chi.TableName, maHo);
            DataTable data = DBCommon.Select(query);
            if (DBUtilities.TableIsNullOrEmpty(data) == TypeOfCheck.Not_Null)
            {
                foreach (DataRow dr in data.Rows)
                {
                    if (dr != null)
                    {
                        result.Add(new Chi()
                        {
                            //TODO: Kiem tra Cell co bi NULL hay ko?
                            MaChi = Convert.ToInt32(dr[Chi.fn_MaChi]),
                            KiHieu = dr[Chi.fn_KiHieu].ToString(),
                            Ho = Convert.ToInt32(dr[Chi.fn_Ho]),
                            DPKH = dr[Chi.fn_DPKH].ToString(),
                            TenTV = dr[Chi.fn_TenTV].ToString(),
                            NguoiPH = dr[Chi.fn_NguoiPH].ToString(),
                            NamPH = Convert.ToInt32(dr[Chi.fn_NamPH]),

                        }
                        );
                    }
                }
            }
            return result;
        }
        public List<Chi> SelectByIdHo(int idHo)
        {
            List<Chi> result = new List<Chi>();

            string query = string.Format("SELECT * FROM {0} WHERE {1}={2}", Chi.TableName, Chi.fn_Ho, idHo);
            DataTable data = DBCommon.Select(query);
            if (DBUtilities.TableIsNullOrEmpty(data) == TypeOfCheck.Not_Null)
            {
                foreach (DataRow dr in data.Rows)
                {
                    result.Add(new Chi()
                    {
                        //TODO: Kiem tra Cell co bi NULL hay ko?
                        MaChi = Convert.ToInt32(dr[Chi.fn_MaChi]),
                        KiHieu = dr[Chi.fn_KiHieu].ToString(),
                        Ho = Convert.ToInt32(dr[Chi.fn_Ho]),
                        DPKH = dr[Chi.fn_DPKH].ToString(),
                        TenTV = dr[Chi.fn_TenTV].ToString(),
                        NguoiPH = dr[Chi.fn_NguoiPH].ToString(),
                        NamPH = Convert.ToInt32(dr[Chi.fn_NamPH]),

                    }
                        );
                }
            }
            return result;
        }
        public List<Chi> SelectByID(int id, int maNguoiTao)
        {
            List<Chi> result = new List<Chi>();
            string query = string.Format("SELECT * FROM {0} where {1}=@{1} and {2}=@{2}", Chi.TableName, Chi.fn_MaChi, Chi.fn_MaNguoiTao);
            SqlParameter[] par = { 
                                  new SqlParameter(Chi.fn_MaChi, id),
                                  new SqlParameter(Chi.fn_MaNguoiTao, maNguoiTao),
                                  //new SqlParameter(Bo.fn_TenNguoiTao,Bo.TenNguoiTao),
                                 };
            DataTable data = DBCommon.SelectBy(query, par);
            if (DBUtilities.TableIsNullOrEmpty(data) == TypeOfCheck.Not_Null)
            {
                foreach (DataRow dr in data.Rows)
                {
                    result.Add(new Chi()
                    {
                        //TODO: Kiem tra Cell co bi NULL hay ko?
                        MaChi = Convert.ToInt32(dr[Chi.fn_MaChi]),
                        KiHieu = dr[Chi.fn_KiHieu].ToString(),
                        Ho = Convert.ToInt32(dr[Chi.fn_Ho]),
                        DPKH = dr[Chi.fn_DPKH].ToString(),
                        TenTV = dr[Chi.fn_TenTV].ToString(),
                        NguoiPH = dr[Chi.fn_NguoiPH].ToString(),
                        NamPH = Convert.ToInt32(dr[Chi.fn_NamPH]),
                        TenNguoiTao = dr[Chi.fn_TenNguoiTao].ToString(),
                        MaNguoiTao = Convert.ToInt32(dr[Chi.fn_MaNguoiTao]),
                    }
                        );
                }
            }
            return result;
        }
        public List<Chi> SelectByID(int id)
        {
            List<Chi> result = new List<Chi>();

            string query = string.Format("SELECT * FROM {0} WHERE {1}={2}", Chi.TableName, Chi.fn_MaChi, id);
            DataTable data = DBCommon.Select(query);
            if (DBUtilities.TableIsNullOrEmpty(data) == TypeOfCheck.Not_Null)
            {
                foreach (DataRow dr in data.Rows)
                {
                    result.Add(new Chi()
                    {
                        //TODO: Kiem tra Cell co bi NULL hay ko?
                        MaChi = Convert.ToInt32(dr[Chi.fn_MaChi]),
                        KiHieu = dr[Chi.fn_KiHieu].ToString(),
                        Ho = Convert.ToInt32(dr[Chi.fn_Ho]),
                        DPKH = dr[Chi.fn_DPKH].ToString(),
                        TenTV = dr[Chi.fn_TenTV].ToString(),
                        NguoiPH = dr[Chi.fn_NguoiPH].ToString(),
                        NamPH = Convert.ToInt32(dr[Chi.fn_NamPH]),

                    }
                        );
                }
            }
            return result;
        }
        public int CreateNewChi(Chi Chi)
        {
            string query = string.Format("INSERT INTO {0} ({1},{2},{3},{4},{5},{6},{7},{8},{9},{10}, Khoa) VALUES (@{1},@{2},@{3},@{4},@{5},@{6},@{7},@{8},@{9},@{10}, 0)", Chi.TableName, Chi.fn_KiHieu, Chi.fn_Ho, Chi.fn_DPKH, Chi.fn_TenTV, Chi.fn_NguoiPH, Chi.fn_NamPH, Chi.fn_TenNguoiTao, Chi.fn_NgayCapNhat, Chi.fn_NgayDang, Chi.fn_MaNguoiTao);
            SqlParameter[] par = {
                                  new SqlParameter(Chi.fn_KiHieu, Chi.KiHieu),
                                  new SqlParameter(Chi.fn_Ho, Chi.Ho),
                                  new SqlParameter(Chi.fn_DPKH, Chi.DPKH),
                                  new SqlParameter(Chi.fn_TenTV, Chi.TenTV),
                                  new SqlParameter(Chi.fn_NguoiPH, Chi.NguoiPH),
                                  new SqlParameter(Chi.fn_NamPH, Chi.NamPH),
                                  new SqlParameter(Chi.fn_TenNguoiTao, Chi.TenNguoiTao),
                                  new SqlParameter(Chi.fn_NgayCapNhat, Chi.NgayCapNhat),
                                  new SqlParameter(Chi.fn_NgayDang, Chi.NgayDangBai),
                                  new SqlParameter(Chi.fn_MaNguoiTao, Chi.MaNguoiTao),
                                 };
            int data = DBCommon.Execute(query, par);
            return data;

        }
        public int UpdateBaiDang(int id, int maTaiKhoan)
        {
            string query = string.Format("UPDATE {0} SET Khoa = 1, {1}=@{1} WHERE {2}=@{2}",
                Chi.TableName,
                Chi.fn_MaNguoiDuyet,
                Chi.fn_MaChi);//, Chi.TenNguoiTao);
            SqlParameter[] par = {  new SqlParameter(Chi.fn_MaNguoiDuyet, maTaiKhoan),
                                     new SqlParameter(Chi.fn_MaChi, id),
                                 };
            int data = DBCommon.Execute(query, par);
            return data;
        }
        public int UpdateBaiMoi(int id)
        {
            string query = string.Format("UPDATE {0} SET Khoa = 0 WHERE {1}=@{1}",
                Chi.TableName,
                Chi.fn_MaChi);//, Chi.TenNguoiTao);
            SqlParameter[] par = { // new SqlParameter(Chi.fn_KChia, Chi.KChia),
                                     new SqlParameter(Chi.fn_MaChi, id),
                                 };
            int data = DBCommon.Execute(query, par);
            return data;
        }
        public int Delete(int id, int maNguoiTao)
        {
            string query = string.Format("DELETE FROM Chi WHERE {0}=@{0} and {1}=@{1}", Chi.fn_MaChi, Chi.fn_MaNguoiTao);
            SqlParameter[] par = {new SqlParameter(Chi.fn_MaChi, id),
                                  new SqlParameter(Chi.fn_MaNguoiTao, maNguoiTao),
                                 };
            int data = DBCommon.Execute(query, par);
            return data;
        }
        public int Edit(Chi Chi)
        {
            //update Chi set KiHieu='V',DanhPhapKChiaChic='222',TenTiengViet='222',NguoiPhatHien='222',NamPhatHien='2222' where MaChi=5
            string query = string.Format("UPDATE {0} SET {1}=@{1},{2}=@{2},{3}=@{3},{4}=@{4},{5}=@{5},{6}=@{6} WHERE {7}=@{7}", Chi.TableName, Chi.fn_KiHieu, Chi.fn_Ho, Chi.fn_DPKH, Chi.fn_TenTV, Chi.fn_NguoiPH, Chi.fn_NamPH, Chi.fn_MaChi);
            SqlParameter[] par = {new SqlParameter(Chi.fn_KiHieu,Chi.KiHieu),
                                  new  SqlParameter(Chi.fn_Ho,  Chi.Ho),
                                  new SqlParameter(Chi.fn_DPKH,Chi.DPKH),
                                  new SqlParameter(Chi.fn_TenTV,Chi.TenTV),
                                  new SqlParameter(Chi.fn_NguoiPH,Chi.NguoiPH),
                                  new SqlParameter(Chi.fn_NamPH,Chi.NamPH),
                                  new SqlParameter(Chi.fn_MaChi,Chi.MaChi),
                                 };
            int data = DBCommon.Execute(query, par);
            return data;
        }
        public List<Chi> Search(string find)
        {
            List<Chi> result = new List<Chi>();
            string query = string.Format("SELECT * FROM {0} WHERE {1} LIKE @{1} or {2} LIKE @{2} or {3} LIKE @{3} or {4} LIKE @{4} or {5} LIKE @{5} or {6} LIKE @{6} or {7} LIKE @{7}", Chi.TableName, Chi.fn_MaChi, Chi.fn_KiHieu, Chi.fn_DPKH, Chi.fn_TenTV, Chi.fn_NguoiPH, Chi.fn_NamPH, Chi.fn_Ho);
            SqlParameter[] par = {new SqlParameter(Chi.fn_KiHieu,"%" + find + "%"),
                                  new SqlParameter(Chi.fn_DPKH,"%" + find + "%"),
                                  new SqlParameter(Chi.fn_TenTV,"%" + find + "%"),
                                  new SqlParameter(Chi.fn_NguoiPH,"%" + find + "%"),
                                  new SqlParameter(Chi.fn_NamPH,"%" + find + "%"),
                                  new SqlParameter(Chi.fn_MaChi,"%" + find + "%"),
                                  new SqlParameter(Chi.fn_Ho,"%" + find + "%"),
                                 };
            DataTable data = DBCommon.SelectBy(query, par);
            if (DBUtilities.TableIsNullOrEmpty(data) == TypeOfCheck.Not_Null)
            {
                foreach (DataRow dr in data.Rows)
                {
                    result.Add(new Chi()
                    {
                        //TODO: Kiem tra Cell co bi NULL hay ko?
                        MaChi = Convert.ToInt32(dr[Chi.fn_MaChi]),
                        KiHieu = dr[Chi.fn_KiHieu].ToString(),
                        Ho = Convert.ToInt32(dr[Chi.fn_Ho]),
                        DPKH = dr[Chi.fn_DPKH].ToString(),
                        TenTV = dr[Chi.fn_TenTV].ToString(),
                        NguoiPH = dr[Chi.fn_NguoiPH].ToString(),
                        NamPH = Convert.ToInt32(dr[Chi.fn_NamPH]),
                    }
                        );
                }
            }
            return result;
        }
        public List<string> SelectAuto(string term)
        {
            List<string> result = new List<string>();
            string query = string.Format("SELECT DanhPhapKhoaHoc FROM {0} WHERE {1} LIKE @{1}", Chi.TableName, Chi.fn_DPKH);
            SqlParameter[] par = {new SqlParameter(Chi.fn_DPKH,"%" + term + "%"),
                                 };
            DataTable data = DBCommon.SelectBy(query, par);
            if (DBUtilities.TableIsNullOrEmpty(data) == TypeOfCheck.Not_Null)
            {
                foreach (DataRow dr in data.Rows)
                {
                    result.Add((string)dr[0]);
                }
            }

            return result;
        }
    }
}
