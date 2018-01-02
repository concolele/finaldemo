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

            string query = string.Format("SELECT * FROM {0} where Khoa = 1 or Khoa is NULL", Ho.TableName);
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
        public List<Ho> GetAllHoBaiDang()
        {
            List<Ho> result = new List<Ho>();

            string query = string.Format("SELECT * FROM {0} where Khoa = 0", Ho.TableName);
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
                            Bo = Convert.ToInt32(dr[Ho.fn_Bo]),
                            DPKH = dr[Ho.fn_DPKH].ToString(),
                            TenTV = dr[Ho.fn_TenTV].ToString(),
                            NguoiPH = dr[Ho.fn_NguoiPH].ToString(),
                            NamPH = Convert.ToInt32(dr[Ho.fn_NamPH]),
                            NgayCapNhat = Convert.ToDateTime(dr[Ho.fn_NgayCapNhat]),
                            NgayDangBai = Convert.ToDateTime(dr[Ho.fn_NgayDang]),
                        }
                        );
                    }
                }
            }
            return result;
        }
        public List<Ho> GetAllHoBaiMoi()
        {
            List<Ho> result = new List<Ho>();

            string query = string.Format("SELECT * FROM {0} where Khoa = -1", Ho.TableName);
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
                            Bo = Convert.ToInt32(dr[Ho.fn_Bo]),
                            DPKH = dr[Ho.fn_DPKH].ToString(),
                            TenTV = dr[Ho.fn_TenTV].ToString(),
                            NguoiPH = dr[Ho.fn_NguoiPH].ToString(),
                            NamPH = Convert.ToInt32(dr[Ho.fn_NamPH]),
                            NgayCapNhat = Convert.ToDateTime(dr[Ho.fn_NgayCapNhat]),
                            NgayDangBai = Convert.ToDateTime(dr[Ho.fn_NgayDang]),
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
        public List<Ho> SelectByID(int idHo, int maNguoiTao)
        {
            List<Ho> result = new List<Ho>();

            string query = string.Format("SELECT * FROM {0} where {1}=@{1} and {2}=@{2}", Ho.TableName, Ho.fn_MaHo, Ho.fn_MaNguoiTao);
            SqlParameter[] par = { 
                                  new SqlParameter(Ho.fn_MaHo, idHo),
                                  new SqlParameter(Ho.fn_MaNguoiTao, maNguoiTao),
                                  //new SqlParameter(Bo.fn_TenNguoiTao,Bo.TenNguoiTao),
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
                        TenNguoiTao = dr[Ho.fn_TenNguoiTao].ToString(),
                        MaNguoiTao = Convert.ToInt32(dr[Ho.fn_MaNguoiTao]),
                    }
                        );
                }
            }
            return result;
        }
        public List<Ho> SelectByID(int id)
        {
            List<Ho> result = new List<Ho>();

            string query = string.Format("SELECT * FROM {0} WHERE {1}={2}", Ho.TableName, Ho.fn_MaHo, id);
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
        public int UpdateBaiDang(int id, int maTaiKhoan)
        {
            string query = string.Format("UPDATE {0} SET Khoa = 1, {1}=@{1} WHERE {2}=@{2}",
                Ho.TableName,
                Ho.fn_MaNguoiDuyet,
                Ho.fn_MaHo);
            SqlParameter[] par = {  new SqlParameter(Ho.fn_MaNguoiDuyet, maTaiKhoan),
                                     new SqlParameter(Ho.fn_MaHo, id),
                                 };
            int data = DBCommon.Execute(query, par);
            return data;
        }
        public int UpdateBaiMoi(int id)
        {
            string query = string.Format("UPDATE {0} SET Khoa = 0 WHERE {1}=@{1}",
                Ho.TableName,
                Ho.fn_MaHo);//, Ho.TenNguoiTao);
            SqlParameter[] par = { // new SqlParameter(Ho.fn_Khoa, Ho.Khoa),
                                     new SqlParameter(Ho.fn_MaHo, id),
                                 };
            int data = DBCommon.Execute(query, par);
            return data;
        }
        public int CreateNewHo(Ho ho)
        {
            string query = 
                string.Format("INSERT INTO {0} ({1},{2},{3},{4},{5},{6},{7},{8},{9},{10}, Khoa) VALUES (@{1},@{2},@{3},@{4},@{5},@{6},@{7},@{8},@{9},@{10}, -1)"
                , Ho.TableName
                , Ho.fn_KiHieu
                , Ho.fn_Bo
                , Ho.fn_DPKH
                , Ho.fn_TenTV
                , Ho.fn_NguoiPH
                , Ho.fn_NamPH
                , Ho.fn_TenNguoiTao
                , Ho.fn_NgayCapNhat
                , Ho.fn_NgayDang
                , Ho.fn_MaNguoiTao);
            SqlParameter[] par = {
                                  new SqlParameter(Ho.fn_KiHieu, ho.KiHieu),
                                  new SqlParameter(Ho.fn_Bo, ho.Bo),
                                  new SqlParameter(Ho.fn_DPKH, ho.DPKH),
                                  new SqlParameter(Ho.fn_TenTV, ho.TenTV),
                                  new SqlParameter(Ho.fn_NguoiPH, ho.NguoiPH),
                                  new SqlParameter(Ho.fn_NamPH, ho.NamPH),
                                  new SqlParameter(Ho.fn_TenNguoiTao, ho.TenNguoiTao),
                                  new SqlParameter(Ho.fn_NgayCapNhat, ho.NgayCapNhat),
                                  new SqlParameter(Ho.fn_NgayDang, ho.NgayDangBai),
                                  new SqlParameter(Ho.fn_MaNguoiTao, ho.MaNguoiTao),
                                 };
            int data = DBCommon.Execute(query, par);
            return data;

        }
        public int DeleteHo(int id, int maNguoiTao)
        {
            string query = string.Format("DELETE FROM Ho WHERE {0}=@{0} and {1}=@{1}", Ho.fn_MaHo, Ho.fn_MaNguoiTao);
            SqlParameter[] par = {new SqlParameter(Ho.fn_MaHo, id),
                                  new SqlParameter(Ho.fn_MaNguoiTao, maNguoiTao),
                                 };

            int data = DBCommon.Execute(query, par);
            return data;
        }
        public int EditHo(Ho Ho)
        {
            //update Ho set KiHieu='V',DanhPhapKhoaHoc='222',TenTiengViet='222',NguoiPhatHien='222',NamPhatHien='2222' where MaHo=5
            string query = string.Format("UPDATE {0} SET {1}=@{1},{2}=@{2},{3}=@{3},{4}=@{4},{5}=@{5},{6}=@{6} WHERE {7}=@{7}", Ho.TableName, Ho.fn_KiHieu, Ho.fn_Bo, Ho.fn_DPKH, Ho.fn_TenTV, Ho.fn_NguoiPH, Ho.fn_NamPH, Ho.fn_MaHo);
            SqlParameter[] par = {new SqlParameter(Ho.fn_KiHieu,Ho.KiHieu),
                                  new SqlParameter(Ho.fn_Bo, Ho.Bo),
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
        public List<string> SelectAuto(string term)
        {
            List<string> result = new List<string>();
            string query = string.Format("SELECT DanhPhapKhoaHoc FROM {0} WHERE {1} LIKE @{1}", Ho.TableName, Ho.fn_DPKH);
            SqlParameter[] par = {new SqlParameter(Ho.fn_DPKH,"%" + term + "%"),
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
