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

            string query = string.Format("SELECT * FROM {0} where Khoa = 1 or Khoa is NULL", Bo.TableName);
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
                            Lop = Convert.ToInt32(dr[Bo.fn_Lop]),
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
        public List<Bo> GetAllBoBaiDang()
        {
            List<Bo> result = new List<Bo>();

            string query = string.Format("SELECT * FROM {0} where Khoa = 0", Bo.TableName);
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
                            Lop = Convert.ToInt32(dr[Bo.fn_Lop]),
                            DPKH = dr[Bo.fn_DPKH].ToString(),
                            TenTV = dr[Bo.fn_TenTV].ToString(),
                            NguoiPH = dr[Bo.fn_NguoiPH].ToString(),
                            NamPH = Convert.ToInt32(dr[Bo.fn_NamPH]),
                            NgayCapNhat = Convert.ToDateTime(dr[Bo.fn_NgayCapNhat]),
                            NgayDangBai = Convert.ToDateTime(dr[Bo.fn_NgayDang]),
                        }
                        );
                    }
                }
            }
            return result;
        }
        public List<Bo> GetAllBoBaiMoi(int maTaiKhoan)
        {
            List<Bo> result = new List<Bo>();

            string query = string.Format("SELECT * FROM {0} where Khoa = -1 and {1}=@{1}", Bo.TableName, Bo.fn_MaNguoiTao);
            SqlParameter[] par = { // new SqlParameter(Bo.fn_Khoa, Bo.Khoa),
                                     new SqlParameter(Bo.fn_MaNguoiTao, maTaiKhoan),
                                 };
            DataTable data = DBCommon.SelectBy(query, par);
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
                            Lop = Convert.ToInt32(dr[Bo.fn_Lop]),
                            DPKH = dr[Bo.fn_DPKH].ToString(),
                            TenTV = dr[Bo.fn_TenTV].ToString(),
                            NguoiPH = dr[Bo.fn_NguoiPH].ToString(),
                            NamPH = Convert.ToInt32(dr[Bo.fn_NamPH]),
                            NgayCapNhat = Convert.ToDateTime(dr[Bo.fn_NgayCapNhat]),
                            NgayDangBai = Convert.ToDateTime(dr[Bo.fn_NgayDang]),
                        }
                        );
                    }
                }
            }
            return result;
        }
        public List<Bo> GetAllBosByLop(int maLop)
        {
            List<Bo> result = new List<Bo>();

            string query = string.Format("SELECT * FROM {0} where Lop = {1}", Bo.TableName, maLop);
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
                            Lop = Convert.ToInt32(dr[Bo.fn_Lop]),
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
            string query = string.Format
                ("INSERT INTO {0} ({1},{2},{3},{4},{5},{6},{7},{8},{9},{10},{11}) VALUES (@{1},@{2},@{3},@{4},@{5},@{6},@{7},@{8},@{9},@{10}, @{11})",
                Bo.TableName, Bo.fn_KiHieu
                , Bo.fn_Lop
                , Bo.fn_DPKH
                , Bo.fn_TenTV
                , Bo.fn_NguoiPH
                , Bo.fn_NamPH
                , Bo.fn_TenNguoiTao
                , Bo.fn_NgayCapNhat
                , Bo.fn_NgayDang
                , Bo.fn_Khoa
                , Bo.fn_MaNguoiTao);
            SqlParameter[] par = {//new SqlParameter(Bo.fn_MaBo, bo.MaBo),
                                  new SqlParameter(Bo.fn_KiHieu, bo.KiHieu),
                                  new SqlParameter(Bo.fn_Lop, bo.Lop),
                                  new SqlParameter(Bo.fn_DPKH, bo.DPKH),
                                  new SqlParameter(Bo.fn_TenTV, bo.TenTV),
                                  new SqlParameter(Bo.fn_NguoiPH, bo.NguoiPH),
                                  new SqlParameter(Bo.fn_NamPH, bo.NamPH),
                                  new SqlParameter(Bo.fn_TenNguoiTao, bo.TenNguoiTao),
                                  new SqlParameter(Bo.fn_NgayCapNhat, bo.NgayCapNhat),
                                  new SqlParameter(Bo.fn_NgayDang, bo.NgayDangBai),
                                  new SqlParameter(Bo.fn_Khoa, bo.Khoa),
                                  new SqlParameter(Bo.fn_MaNguoiTao, bo.MaNguoiTao),
                                 };
            int data = DBCommon.Execute(query, par);
            return data;

        }
        public int DeleteBo(int id, int maNguoiTao)
        {
            string query = string.Format("DELETE FROM Bo WHERE {0}=@{0} and {1}=@{1}", Bo.fn_MaBo, Bo.fn_MaNguoiTao);
            SqlParameter[] par = {new SqlParameter(Bo.fn_MaBo, id),
                                  new SqlParameter(Bo.fn_MaNguoiTao, maNguoiTao),
                                 };
            int data = DBCommon.Execute(query, par);
            return data;
        }
        public int EditBo(Bo Bo)
        {
            //update Bo set KiHieu='V',DanhPhapKhoaHoc='222',TenTiengViet='222',NguoiPhatHien='222',NamPhatHien='2222' where MaBo=5 and {7}=@{7}
            string query = string.Format("UPDATE {0} SET {1}=@{1}, {2}=@{2}, {3}=@{3}, {4}=@{4}, {5}=@{5}, {6}=@{6} WHERE {7}=@{7}", 
                Bo.TableName, 
                Bo.fn_KiHieu, 
                Bo.fn_Lop, 
                Bo.fn_DPKH, 
                Bo.fn_TenTV, 
                Bo.fn_NguoiPH, 
                Bo.fn_NamPH,
                Bo.fn_MaBo);//, Bo.TenNguoiTao);
            SqlParameter[] par = {new SqlParameter(Bo.fn_KiHieu,Bo.KiHieu),
                                  new SqlParameter(Bo.fn_Lop, Bo.Lop),
                                  new SqlParameter(Bo.fn_DPKH,Bo.DPKH),
                                  new SqlParameter(Bo.fn_TenTV,Bo.TenTV),
                                  new SqlParameter(Bo.fn_NguoiPH,Bo.NguoiPH),
                                  new SqlParameter(Bo.fn_NamPH,Bo.NamPH),
                                  new SqlParameter(Bo.fn_MaBo,Bo.MaBo),
                                 };
            //throw (new Exception(query));
            int data = DBCommon.Execute(query, par);
            return data;
        }
        public int UpdateBaiDang(int id, int maNguoiTao)
        {
            string query = string.Format("UPDATE {0} SET Khoa = 1, {1}=@{1} WHERE {2}=@{2}",
                Bo.TableName,
                Bo.fn_MaNguoiDuyet,
                Bo.fn_MaBo);
            SqlParameter[] par = {  new SqlParameter(Bo.fn_MaNguoiDuyet, maNguoiTao),
                                     new SqlParameter(Bo.fn_MaBo, id),
                                 };
            int data = DBCommon.Execute(query, par);
            return data;
        }
        public int UpdateBaiMoi(int id)
        {
            string query = string.Format("UPDATE {0} SET Khoa = 0 WHERE {1}=@{1}",
                Bo.TableName,
                Bo.fn_MaBo);//, Bo.TenNguoiTao);
            SqlParameter[] par = { // new SqlParameter(Bo.fn_Khoa, Bo.Khoa),
                                     new SqlParameter(Bo.fn_MaBo, id),
                                 };
            int data = DBCommon.Execute(query, par);
            return data;
        }
        public List<Bo> SelectByID(int id, int maNguoiTao)
        {
            List<Bo> result = new List<Bo>();
            string query = string.Format("SELECT * FROM {0} where {1}=@{1} and {2}=@{2}", Bo.TableName, Bo.fn_MaBo, Bo.fn_MaNguoiTao);
            //string query = string.Format("SELECT * FROM {0} WHERE {1}={2} and {3}={4}", Bo.TableName, Bo.fn_MaBo, id, Bo.fn_TenNguoiTao, tenNguoiTao);
            SqlParameter[] par = {
                                  
                                  new SqlParameter(Bo.fn_MaBo, id),
                                  new SqlParameter(Bo.fn_MaNguoiTao, maNguoiTao),
                                  //new SqlParameter(Bo.fn_TenNguoiTao,Bo.TenNguoiTao),
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
                        Lop = Convert.ToInt32(dr[Bo.fn_Lop]),
                        DPKH = dr[Bo.fn_DPKH].ToString(),
                        TenTV = dr[Bo.fn_TenTV].ToString(),
                        NguoiPH = dr[Bo.fn_NguoiPH].ToString(),
                        NamPH = Convert.ToInt32(dr[Bo.fn_NamPH]),
                        TenNguoiTao = dr[Bo.fn_TenNguoiTao].ToString(),
                        MaNguoiTao = Convert.ToInt32(dr[Bo.fn_MaNguoiTao]),
                    }
                        );
                }
            }
            return result;
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
        public List<string> SelectAuto(string term)
        {
            List<string> result = new List<string>();
            string query = string.Format("SELECT DanhPhapKhoaHoc FROM {0} WHERE {1} LIKE @{1}", Bo.TableName, Bo.fn_DPKH);
            SqlParameter[] par = {new SqlParameter(Bo.fn_DPKH,"%" + term + "%"),
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
