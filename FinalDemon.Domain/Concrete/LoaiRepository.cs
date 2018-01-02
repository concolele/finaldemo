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
    public class LoaiRepository : ILoaiRepository
    {
        //abc
        public IQueryable<Loai> Loais { get; set; }
        public List<Loai> GetAllLoai()
        {
            List<Loai> result = new List<Loai>();

            string query = string.Format("SELECT * FROM {0}  where Khoa = 1 or Khoa is NULL", Loai.TableName);
            DataTable data = DBCommon.Select(query);
            if (DBUtilities.TableIsNullOrEmpty(data) == TypeOfCheck.Not_Null)
            {
                foreach (DataRow dr in data.Rows)
                {
                    if (dr != null)
                    {
                        result.Add(new Loai()
                            {
                                //TODO: Kiem tra Cell co bi NULL hay ko?
                                MaLoai = Convert.ToInt32(dr[Loai.fn_MaLoai]),
                                KiHieu = dr[Loai.fn_KiHieu].ToString(),
                                Chi = Convert.ToInt32(dr[Loai.fn_Chi]),
                                DPKH = dr[Loai.fn_DPKH].ToString(),
                                TenTG = dr[Loai.fn_TenTG].ToString(),
                                TenK = dr[Loai.fn_TenK].ToString(),
                                SoLuong = Convert.ToInt32(dr[Loai.fn_SoLuong]),
                                DDSinhSan = dr[Loai.fn_DDSinhSan].ToString(),
                                DDGioiTinh = dr[Loai.fn_DDGioitinh].ToString(),
                                DDKhac = dr[Loai.fn_DDKhac].ToString(),
                                MucDo = dr[Loai.fn_MucDo].ToString(),
                                NamPH = Convert.ToInt32(dr[Loai.fn_NamPH]),
                                TapTinhSH = dr[Loai.fn_TapTinhSH].ToString(),
                                KichCoTB = Convert.ToSingle(dr[Loai.fn_KichCoTB]),
                                ThucAn = dr[Loai.fn_ThucAn].ToString(),
                                XuatXu = Convert.ToInt32(dr[Loai.fn_XuatXu]),
                                Image = dr[Loai.fn_Image].ToString(),
                            }
                        );
                    }
                }
            }
            return result;
        }
        public List<Loai> GetAllLoaiBaiDang()
        {
            List<Loai> result = new List<Loai>();

            string query = string.Format("SELECT * FROM {0} where Khoa = 0", Loai.TableName);
            DataTable data = DBCommon.Select(query);
            if (DBUtilities.TableIsNullOrEmpty(data) == TypeOfCheck.Not_Null)
            {
                foreach (DataRow dr in data.Rows)
                {
                    if (dr != null)
                    {
                        result.Add(new Loai()
                        {
                            //TODO: Kiem tra Cell co bi NULL hay ko?
                            MaLoai = Convert.ToInt32(dr[Loai.fn_MaLoai]),
                            Chi = Convert.ToInt32(dr[Loai.fn_Chi]),
                            DPKH = dr[Loai.fn_DPKH].ToString(),
                            TenTG = dr[Loai.fn_TenTG].ToString(),
                            NguoiPH = dr[Loai.fn_NguoiPH].ToString(),
                            NamPH = Convert.ToInt32(dr[Loai.fn_NamPH]),
                            NgayCapNhat = Convert.ToDateTime(dr[Loai.fn_NgayCapNhat]),
                            NgayDangBai = Convert.ToDateTime(dr[Loai.fn_NgayDang]),
                            Image = dr[Loai.fn_Image].ToString(),
                        }
                        );
                    }
                }
            }
            return result;
        }
        public List<Loai> GetAllLoaiBaiMoi()
        {
            List<Loai> result = new List<Loai>();

            string query = string.Format("SELECT * FROM {0} where Khoa = -1", Loai.TableName);
            DataTable data = DBCommon.Select(query);
            if (DBUtilities.TableIsNullOrEmpty(data) == TypeOfCheck.Not_Null)
            {
                foreach (DataRow dr in data.Rows)
                {
                    if (dr != null)
                    {
                        result.Add(new Loai()
                        {
                            //TODO: Kiem tra Cell co bi NULL hay ko?
                            MaLoai = Convert.ToInt32(dr[Loai.fn_MaLoai]),
                            Chi = Convert.ToInt32(dr[Loai.fn_Chi]),
                            DPKH = dr[Loai.fn_DPKH].ToString(),
                            TenTG = dr[Loai.fn_TenTG].ToString(),
                            NguoiPH = dr[Loai.fn_NguoiPH].ToString(),
                            NamPH = Convert.ToInt32(dr[Loai.fn_NamPH]),
                            NgayCapNhat = Convert.ToDateTime(dr[Loai.fn_NgayCapNhat]),
                            NgayDangBai = Convert.ToDateTime(dr[Loai.fn_NgayDang]),
                            Image = dr[Loai.fn_Image].ToString(),
                        }
                        );
                    }
                }
            }
            return result;
        }
        public List<Loai> GetAllLoaisByChi(int maChi)
        {
            List<Loai> result = new List<Loai>();

            string query = string.Format("SELECT * FROM {0} where Chi={1}", Loai.TableName, maChi);
            DataTable data = DBCommon.Select(query);
            if (DBUtilities.TableIsNullOrEmpty(data) == TypeOfCheck.Not_Null)
            {
                foreach (DataRow dr in data.Rows)
                {
                    if (dr != null)
                    {
                        result.Add(new Loai()
                        {
                            //TODO: Kiem tra Cell co bi NULL hay ko?
                            MaLoai = Convert.ToInt32(dr[Loai.fn_MaLoai]),
                            KiHieu = dr[Loai.fn_KiHieu].ToString(),
                            Chi = Convert.ToInt32(dr[Loai.fn_Chi]),
                            DPKH = dr[Loai.fn_DPKH].ToString(),
                            TenTG = dr[Loai.fn_TenTG].ToString(),
                            TenK = dr[Loai.fn_TenK].ToString(),
                            SoLuong = Convert.ToInt32(dr[Loai.fn_SoLuong]),
                            DDSinhSan = dr[Loai.fn_DDSinhSan].ToString(),
                            DDGioiTinh = dr[Loai.fn_DDGioitinh].ToString(),
                            DDKhac = dr[Loai.fn_DDKhac].ToString(),
                            MucDo = dr[Loai.fn_MucDo].ToString(),
                            NguoiPH = dr[Loai.fn_NguoiPH].ToString(),
                            NamPH = Convert.ToInt32(dr[Loai.fn_NamPH]),
                            TapTinhSH = dr[Loai.fn_TapTinhSH].ToString(),
                            KichCoTB = Convert.ToSingle(dr[Loai.fn_KichCoTB]),
                            ThucAn = dr[Loai.fn_ThucAn].ToString(),
                            XuatXu = Convert.ToInt32(dr[Loai.fn_XuatXu]),
                            Image = dr[Loai.fn_Image].ToString(),
                        }
                        );
                    }
                }
            }
            return result;
        }
        public int CreateNewLoai(Loai Loai)
        {
            string query = string.Format("INSERT INTO {0} ({1},{2},{3},{4},{5},{6},{7},{8},{9},{10},{11},{12},{13},{14},{15},{16},{17},{18},{19},{20},{21},{22}) VALUES (@{1},@{2},@{3},@{4},@{5},@{6},@{7},@{8},@{9},@{10},@{11},@{12},@{13},@{14},@{15},@{16},@{17},@{18},@{19},@{20},@{21},@{22})"
            , Loai.TableName, Loai.fn_KiHieu, Loai.fn_Chi, Loai.fn_DPKH, Loai.fn_TenTG, Loai.fn_TenK, Loai.fn_SoLuong, Loai.fn_DDSinhSan,
            Loai.fn_DDGioitinh, Loai.fn_DDKhac, Loai.fn_MucDo, Loai.fn_NguoiPH, Loai.fn_NamPH, Loai.fn_TapTinhSH, Loai.fn_KichCoTB,
            Loai.fn_ThucAn, Loai.fn_XuatXu, Loai.fn_Image, Loai.fn_TenNguoiTao, Loai.fn_NgayCapNhat, Loai.fn_NgayDang, Loai.fn_MaNguoiTao, Loai.fn_Khoa);
            
            SqlParameter[] par = {
                new SqlParameter(Loai.fn_KiHieu,Loai.KiHieu),
                new SqlParameter(Loai.fn_Chi,Loai.Chi),
                new SqlParameter(Loai.fn_DPKH,Loai.DPKH),
                new SqlParameter(Loai.fn_TenTG,Loai.TenTG),
                new SqlParameter(Loai.fn_TenK,Loai.TenK),
                new SqlParameter(Loai.fn_SoLuong,Loai.SoLuong),
                new SqlParameter(Loai.fn_DDSinhSan,Loai.DDSinhSan),
                new SqlParameter(Loai.fn_DDGioitinh,Loai.DDGioiTinh),
                new SqlParameter(Loai.fn_DDKhac,Loai.DDKhac),
                new SqlParameter(Loai.fn_MucDo,Loai.MucDo),
                new SqlParameter(Loai.fn_NguoiPH,Loai.NguoiPH),
                new SqlParameter(Loai.fn_NamPH,Loai.NamPH),
                new SqlParameter(Loai.fn_TapTinhSH,Loai.TapTinhSH),
                new SqlParameter(Loai.fn_KichCoTB,Loai.KichCoTB),
                new SqlParameter(Loai.fn_ThucAn,Loai.ThucAn),
                new SqlParameter(Loai.fn_XuatXu,Loai.XuatXu),
                new SqlParameter(Loai.fn_Image,Loai.Image),
                new SqlParameter(Loai.fn_TenNguoiTao,Loai.TenNguoiTao),
                new SqlParameter(Loai.fn_NgayCapNhat,Loai.NgayCapNhat),
                new SqlParameter(Loai.fn_NgayDang,Loai.NgayDangBai),
                new SqlParameter(Loai.fn_MaNguoiTao,Loai.MaNguoiTao),
                new SqlParameter(Loai.fn_Khoa,Loai.Khoa),
            };
            int data = DBCommon.Execute(query, par);
            return data;

        }
        public int DeleteLoai(int id, int maNguoiTao)
        {
            string query = string.Format("DELETE FROM Loai WHERE {0}=@{0} and {1}=@{1}", Loai.fn_MaLoai, Loai.fn_MaNguoiTao);
            SqlParameter[] par = {new SqlParameter(Loai.fn_MaLoai, id),
                                  new SqlParameter(Loai.fn_MaNguoiTao, maNguoiTao),
                                 };
            int data = DBCommon.Execute(query, par);
            return data;
        }
        public int EditLoai(Loai Loai)
        {
            int data;
            if (Loai.Image != null)
            {
                string query = string.Format("UPDATE Loai SET {0}=@{0},{1}=@{1},{2}=@{2},{3}=@{3},{4}=@{4},{5}=@{5},{6}=@{6},{7}=@{7},{8}=@{8},{9}=@{9},{10}=@{10},{11}=@{11},{12}=@{12},{13}=@{13},{14}=@{14},{15}=@{15},{16}=@{16} WHERE {17}=@{17}"
                    , Loai.fn_KiHieu
                    , Loai.fn_Chi
                    , Loai.fn_DPKH
                    , Loai.fn_TenTG
                    , Loai.fn_TenK
                    , Loai.fn_SoLuong
                    , Loai.fn_DDSinhSan
                    , Loai.fn_DDGioitinh
                    , Loai.fn_DDKhac
                    , Loai.fn_MucDo
                    , Loai.fn_NguoiPH
                    , Loai.fn_NamPH
                    , Loai.fn_TapTinhSH
                    , Loai.fn_KichCoTB
                    , Loai.fn_ThucAn
                    , Loai.fn_XuatXu
                    , Loai.fn_Image
                    , Loai.fn_MaLoai);//Loais.fn_TenTG, Loais.fn_TenK, Loais.fn_SoLuong, Loais.fn_DDSinhSan, Loais.fn_DDGioitinh, Loais.fn_DDKhac, Loais.fn_MucDo,
                SqlParameter[] par = {//new SqlParameter(Loai.fn_MaLoai,Loai.MaLoai),
                                  new SqlParameter(Loai.fn_KiHieu,Loai.KiHieu),
                                  new SqlParameter(Loai.fn_Chi,Loai.Chi),
                                  new SqlParameter(Loai.fn_DPKH,Loai.DPKH),
                                  new SqlParameter(Loai.fn_TenTG,Loai.TenTG),
                                  new SqlParameter(Loai.fn_TenK,Loai.TenK),
                                  new SqlParameter(Loai.fn_SoLuong,Loai.SoLuong),
                                  new SqlParameter(Loai.fn_DDSinhSan,Loai.DDSinhSan),
                                  new SqlParameter(Loai.fn_DDGioitinh,Loai.DDGioiTinh),
                                  new SqlParameter(Loai.fn_DDKhac,Loai.DDKhac),
                                  new SqlParameter(Loai.fn_MucDo,Loai.MucDo),
                                  new SqlParameter(Loai.fn_NguoiPH,Loai.NguoiPH),
                                  new SqlParameter(Loai.fn_NamPH,Loai.NamPH),
                                  new SqlParameter(Loai.fn_TapTinhSH,Loai.TapTinhSH),
                                  new SqlParameter(Loai.fn_KichCoTB,Loai.KichCoTB),
                                  new SqlParameter(Loai.fn_ThucAn,Loai.ThucAn),
                                  new SqlParameter(Loai.fn_XuatXu,Loai.XuatXu),
                                  new SqlParameter(Loai.fn_Image,Loai.Image),
                                  //new SqlParameter(Loai.fn_TenNguoiTao,Loai.TenNguoiTao),
                                  new SqlParameter(Loai.fn_MaLoai,Loai.MaLoai),
                                 };
                data = DBCommon.Execute(query, par);
            }
            else
            {
                string query = string.Format("UPDATE Loai SET {0}=@{0},{1}=@{1},{2}=@{2},{3}=@{3},{4}=@{4},{5}=@{5},{6}=@{6},{7}=@{7},{8}=@{8},{9}=@{9},{10}=@{10},{11}=@{11},{12}=@{12},{13}=@{13},{14}=@{14},{15}=@{15} WHERE {16}=@{16}"
                    , Loai.fn_KiHieu, Loai.fn_Chi, Loai.fn_DPKH, Loai.fn_TenTG, Loai.fn_TenK, Loai.fn_SoLuong, Loai.fn_DDSinhSan, Loai.fn_DDGioitinh
                    , Loai.fn_DDKhac, Loai.fn_MucDo, Loai.fn_NguoiPH, Loai.fn_NamPH, Loai.fn_TapTinhSH, Loai.fn_KichCoTB, Loai.fn_ThucAn
                    , Loai.fn_XuatXu, Loai.fn_MaLoai);//Loais.fn_TenTG, Loais.fn_TenK, Loais.fn_SoLuong, Loais.fn_DDSinhSan, Loais.fn_DDGioitinh, Loais.fn_DDKhac, Loais.fn_MucDo,
                SqlParameter[] par = {//new SqlParameter(Loai.fn_MaLoai,Loai.MaLoai),
                                  new SqlParameter(Loai.fn_KiHieu,Loai.KiHieu),
                                  new SqlParameter(Loai.fn_Chi,Loai.Chi),
                                  new SqlParameter(Loai.fn_DPKH,Loai.DPKH),
                                  new SqlParameter(Loai.fn_TenTG,Loai.TenTG),
                                  new SqlParameter(Loai.fn_TenK,Loai.TenK),
                                  new SqlParameter(Loai.fn_SoLuong,Loai.SoLuong),
                                  new SqlParameter(Loai.fn_DDSinhSan,Loai.DDSinhSan),
                                  new SqlParameter(Loai.fn_DDGioitinh,Loai.DDGioiTinh),
                                  new SqlParameter(Loai.fn_DDKhac,Loai.DDKhac),
                                  new SqlParameter(Loai.fn_MucDo,Loai.MucDo),
                                  new SqlParameter(Loai.fn_NguoiPH,Loai.NguoiPH),
                                  new SqlParameter(Loai.fn_NamPH,Loai.NamPH),
                                  new SqlParameter(Loai.fn_TapTinhSH,Loai.TapTinhSH),
                                  new SqlParameter(Loai.fn_KichCoTB,Loai.KichCoTB),
                                  new SqlParameter(Loai.fn_ThucAn,Loai.ThucAn),
                                  new SqlParameter(Loai.fn_XuatXu,Loai.XuatXu),
                                  //new SqlParameter(Loai.fn_TenNguoiTao,Loai.TenNguoiTao),
                                  new SqlParameter(Loai.fn_MaLoai,Loai.MaLoai),
                                 };
                data = DBCommon.Execute(query, par);
            }
            
            return data;
        }
        public List<Loai> SelectByID(int id)
        {
            List<Loai> result = new List<Loai>();

            string query = string.Format("SELECT * FROM {0} WHERE {1}={2}", Loai.TableName, Loai.fn_MaLoai, id);
            DataTable data = DBCommon.Select(query);
            if (DBUtilities.TableIsNullOrEmpty(data) == TypeOfCheck.Not_Null)
            {
                foreach (DataRow dr in data.Rows)
                {
                    result.Add(new Loai()
                    {
                        //TODO: Kiem tra Cell co bi NULL hay ko?
                        MaLoai = Convert.ToInt32(dr[Loai.fn_MaLoai]),
                        KiHieu = dr[Loai.fn_KiHieu].ToString(),
                        Chi = Convert.ToInt32(dr[Loai.fn_Chi]),
                        DPKH = dr[Loai.fn_DPKH].ToString(),
                        TenTG = dr[Loai.fn_TenTG].ToString(),
                        TenK = dr[Loai.fn_TenK].ToString(),
                        SoLuong = Convert.ToInt32(dr[Loai.fn_SoLuong]),
                        DDSinhSan = dr[Loai.fn_DDSinhSan].ToString(),
                        DDGioiTinh = dr[Loai.fn_DDGioitinh].ToString(),
                        DDKhac = dr[Loai.fn_DDKhac].ToString(),
                        MucDo = dr[Loai.fn_MucDo].ToString(),
                        NguoiPH = dr[Loai.fn_NguoiPH].ToString(),
                        NamPH = Convert.ToInt32(dr[Loai.fn_NamPH]),
                        TapTinhSH = dr[Loai.fn_TapTinhSH].ToString(),
                        KichCoTB = Convert.ToSingle(dr[Loai.fn_KichCoTB]),
                        ThucAn = dr[Loai.fn_ThucAn].ToString(),
                        XuatXu = Convert.ToInt32(dr[Loai.fn_XuatXu]),
                        Image = dr[Loai.fn_Image].ToString(),

                    }
                        );
                }
            }
            return result;
        }
        public List<Loai> SelectByID(int id, int maNguoiTao)
        {
            List<Loai> result = new List<Loai>();
            string query = string.Format("SELECT * FROM {0} where {1}=@{1} and {2}=@{2}", Loai.TableName, Loai.fn_MaLoai, Loai.fn_MaNguoiTao);
            SqlParameter[] par = { 
                                  new SqlParameter(Loai.fn_MaLoai, id),
                                  new SqlParameter(Loai.fn_MaNguoiTao, maNguoiTao),
                                  //new SqlParameter(Bo.fn_TenNguoiTao,Bo.TenNguoiTao),
                                 };
            DataTable data = DBCommon.SelectBy(query, par);
            if (DBUtilities.TableIsNullOrEmpty(data) == TypeOfCheck.Not_Null)
            {
                foreach (DataRow dr in data.Rows)
                {
                    result.Add(new Loai()
                    {
                        //TODO: Kiem tra Cell co bi NULL hay ko?
                        MaLoai = Convert.ToInt32(dr[Loai.fn_MaLoai]),
                        KiHieu = dr[Loai.fn_KiHieu].ToString(),
                        Chi = Convert.ToInt32(dr[Loai.fn_Chi]),
                        DPKH = dr[Loai.fn_DPKH].ToString(),
                        TenTG = dr[Loai.fn_TenTG].ToString(),
                        TenK = dr[Loai.fn_TenK].ToString(),
                        SoLuong = Convert.ToInt32(dr[Loai.fn_SoLuong]),
                        DDSinhSan = dr[Loai.fn_DDSinhSan].ToString(),
                        DDGioiTinh = dr[Loai.fn_DDGioitinh].ToString(),
                        DDKhac = dr[Loai.fn_DDKhac].ToString(),
                        MucDo = dr[Loai.fn_MucDo].ToString(),
                        NguoiPH = dr[Loai.fn_NguoiPH].ToString(),
                        NamPH = Convert.ToInt32(dr[Loai.fn_NamPH]),
                        TapTinhSH = dr[Loai.fn_TapTinhSH].ToString(),
                        KichCoTB = Convert.ToSingle(dr[Loai.fn_KichCoTB]),
                        ThucAn = dr[Loai.fn_ThucAn].ToString(),
                        XuatXu = Convert.ToInt32(dr[Loai.fn_XuatXu]),
                        Image = dr[Loai.fn_Image].ToString(),
                        TenNguoiTao = dr[Loai.fn_TenNguoiTao].ToString(),
                        MaNguoiTao = Convert.ToInt32(dr[Loai.fn_MaNguoiTao]),
                    }
                        );
                }
            }
            return result;
        }
        public int UpdateBaiDang(int id, int maTaiKhoan)
        {
            string query = string.Format("UPDATE {0} SET Khoa = 1, {1}=@{1} WHERE {2}=@{2}",
                Loai.TableName,
                Loai.fn_MaNguoiDuyet,
                Loai.fn_MaLoai);
            SqlParameter[] par = {  new SqlParameter(Loai.fn_MaNguoiDuyet, maTaiKhoan),
                                     new SqlParameter(Loai.fn_MaLoai, id),
                                 };
            int data = DBCommon.Execute(query, par);
            return data;
        }
        public int UpdateBaiMoi(int id)
        {
            string query = string.Format("UPDATE {0} SET Khoa = 0 WHERE {1}=@{1}",
                Loai.TableName,
                Loai.fn_MaLoai);//, Loai.TenNguoiTao);
            SqlParameter[] par = { // new SqlParameter(Loai.fn_KLoaia, Loai.KLoaia),
                                     new SqlParameter(Loai.fn_MaLoai, id),
                                 };
            int data = DBCommon.Execute(query, par);
            return data;
        }
        public List<string> SelectAuto(string term)
        {
            List<string> result = new List<string>();
            string query = string.Format("SELECT DanhPhapKhoaHoc FROM {0} WHERE {1} LIKE @{1}", Loai.TableName, Loai.fn_DPKH);
            SqlParameter[] par = {new SqlParameter(Loai.fn_DPKH,"%" + term + "%"),
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
        public List<Loai> SelectBy(string find)
        {
            List<Loai> result = new List<Loai>();
            string query = string.Format("SELECT * FROM {0} WHERE {1} LIKE @{1} or {2} LIKE @{2} or {3} LIKE @{3} or {4} LIKE @{4} or {5} LIKE @{5} or {6} LIKE @{6}  or {7} LIKE @{7} or {8} LIKE @{8}  or {9} LIKE @{9}  or {10} LIKE @{10}  or {11} LIKE @{11}  or {12} LIKE @{12}  or {13} LIKE @{13}  or {14} LIKE @{14}  or {15} LIKE @{15}  or {16} LIKE @{16}", Loai.TableName, Loai.fn_KiHieu, Loai.fn_Chi, Loai.fn_DPKH, Loai.fn_TenTG, Loai.fn_TenK, Loai.fn_SoLuong, Loai.fn_DDSinhSan, Loai.fn_DDGioitinh, Loai.fn_DDKhac, Loai.fn_MucDo, Loai.fn_NguoiPH, Loai.fn_NamPH, Loai.fn_TapTinhSH, Loai.fn_KichCoTB, Loai.fn_ThucAn, Loai.fn_XuatXu);
            SqlParameter[] par = {new SqlParameter(Loai.fn_KiHieu,"%" + find + "%"),
                                  new SqlParameter(Loai.fn_Chi,"%" + find + "%"),
                                  new SqlParameter(Loai.fn_DPKH,"%" + find + "%"),
                                  new SqlParameter(Loai.fn_TenTG,"%" + find + "%"),
                                  new SqlParameter(Loai.fn_TenK,"%" + find + "%"),
                                  new SqlParameter(Loai.fn_SoLuong,"%" + find + "%"),
                                  new SqlParameter(Loai.fn_DDSinhSan,"%" + find + "%"),
                                  new SqlParameter(Loai.fn_DDGioitinh,"%" + find + "%"),
                                  new SqlParameter(Loai.fn_DDKhac,"%" + find + "%"),
                                  new SqlParameter(Loai.fn_MucDo,"%" + find + "%"),
                                  new SqlParameter(Loai.fn_NguoiPH,"%" + find + "%"),
                                  new SqlParameter(Loai.fn_NamPH,"%" + find + "%"),
                                  new SqlParameter(Loai.fn_TapTinhSH,"%" + find + "%"),
                                  new SqlParameter(Loai.fn_KichCoTB,"%" + find + "%"),
                                  new SqlParameter(Loai.fn_ThucAn,"%" + find + "%"),
                                  new SqlParameter(Loai.fn_XuatXu,"%" + find + "%"),
                                 };
            DataTable data = DBCommon.SelectBy(query, par);
            if (DBUtilities.TableIsNullOrEmpty(data) == TypeOfCheck.Not_Null)
            {
                foreach (DataRow dr in data.Rows)
                {
                    result.Add(new Loai()
                    {
                        //TODO: Kiem tra Cell co bi NULL hay ko?
                        MaLoai = Convert.ToInt32(dr[Loai.fn_MaLoai]),
                        KiHieu = dr[Loai.fn_KiHieu].ToString(),
                        Chi = Convert.ToInt32(dr[Loai.fn_Chi]),
                        DPKH = dr[Loai.fn_DPKH].ToString(),
                        TenTG = dr[Loai.fn_TenTG].ToString(),
                        TenK = dr[Loai.fn_TenK].ToString(),
                        SoLuong = Convert.ToInt32(dr[Loai.fn_SoLuong]),
                        DDSinhSan = dr[Loai.fn_DDSinhSan].ToString(),
                        DDGioiTinh = dr[Loai.fn_DDGioitinh].ToString(),
                        DDKhac = dr[Loai.fn_DDKhac].ToString(),
                        MucDo = dr[Loai.fn_MucDo].ToString(),
                        NguoiPH = dr[Loai.fn_NguoiPH].ToString(),
                        NamPH = Convert.ToInt32(dr[Loai.fn_NamPH]),
                        TapTinhSH = dr[Loai.fn_TapTinhSH].ToString(),
                        KichCoTB = Convert.ToSingle(dr[Loai.fn_KichCoTB]),
                        ThucAn = dr[Loai.fn_ThucAn].ToString(),
                        XuatXu = Convert.ToInt32(dr[Loai.fn_XuatXu]),
                        Image = dr[Loai.fn_Image].ToString(),
                    }
                        );
                }
            }
            return result;
        }

        public List<Loai> SelectBy(string xVal, string yVal)
        {
            List<Loai> result = new List<Loai>();
            //select Loais.Name, Loais.Category, Place.Latitude, Place.Longitude from Loais, Place
            //where Loais.LoaisID= Place.LoaisID and Place.Latitude=21.6 and Place.Longitude=104.3


            string query = string.Format("SELECT Loai.* FROM {0}, {1} WHERE Loai.MaLoai= PhanBo.MaLoai and {2}=@{2} and {3}=@{3}", Loai.TableName, MoiTruongSong.TableName, MoiTruongSong.fn_ViDo, MoiTruongSong.fn_KinhDo);
            SqlParameter[] par = {new SqlParameter(MoiTruongSong.fn_ViDo, xVal),
                                  new SqlParameter(MoiTruongSong.fn_KinhDo, yVal)
                                 };
            DataTable data = DBCommon.SelectBy(query, par);
            if (DBUtilities.TableIsNullOrEmpty(data) == TypeOfCheck.Not_Null)
            {
                foreach (DataRow dr in data.Rows)
                {
                    result.Add(new Loai()
                    {
                        //TODO: Kiem tra Cell co bi NULL hay ko?
                        MaLoai = Convert.ToInt32(dr[Loai.fn_MaLoai]),
                        KiHieu = dr[Loai.fn_KiHieu].ToString(),
                        Chi = Convert.ToInt32(dr[Loai.fn_Chi]),
                        DPKH = dr[Loai.fn_DPKH].ToString(),
                        TenTG = dr[Loai.fn_TenTG].ToString(),
                        TenK = dr[Loai.fn_TenK].ToString(),
                        SoLuong = Convert.ToInt32(dr[Loai.fn_SoLuong]),
                        DDSinhSan = dr[Loai.fn_DDSinhSan].ToString(),
                        DDGioiTinh = dr[Loai.fn_DDGioitinh].ToString(),
                        DDKhac = dr[Loai.fn_DDKhac].ToString(),
                        MucDo = dr[Loai.fn_MucDo].ToString(),
                        NguoiPH = dr[Loai.fn_NguoiPH].ToString(),
                        NamPH = Convert.ToInt32(dr[Loai.fn_NamPH]),
                        TapTinhSH = dr[Loai.fn_TapTinhSH].ToString(),
                        KichCoTB = Convert.ToSingle(dr[Loai.fn_KichCoTB]),
                        ThucAn = dr[Loai.fn_ThucAn].ToString(),
                        XuatXu = Convert.ToInt32(dr[Loai.fn_XuatXu])
                    }
                        );
                }
            }
            return result;
        }

        public int CreateNew(string xVal, string yVal, Loai Loai)
        {
            string query = string.Format("checkCoor", MoiTruongSong.fn_ViDo, MoiTruongSong.fn_KinhDo, Loai.fn_KiHieu, Loai.fn_Chi, Loai.fn_DPKH, Loai.fn_NguoiPH, Loai.fn_NamPH);
            SqlParameter[] par = {new SqlParameter(MoiTruongSong.fn_ViDo,xVal),
                                  new SqlParameter(MoiTruongSong.fn_KinhDo,yVal),
                                  new SqlParameter(Loai.fn_KiHieu,Loai.fn_KiHieu),
                                  new SqlParameter(Loai.fn_Chi,Loai.fn_Chi),
                                  new SqlParameter(Loai.fn_DPKH,Loai.fn_DPKH),
                                  new SqlParameter(Loai.fn_NguoiPH,Loai.fn_NguoiPH),
                                  new SqlParameter(Loai.fn_NamPH,Loai.fn_NamPH)
                                 };
            int data = DBCommon.Execute(query, par);
            return data;

        }
    }
}
