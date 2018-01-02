using FinalDemo.Database;
using FinalDemo.Domain.Abtracts;
using FinalDemo.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FinalDemo.Domain.Concrete
{
    public class NganhRepository : INganhRepository
    {
        public IQueryable<Nganh> Nganhs { get; set; }
        public List<Nganh> GetAllNganh()
        {
            List<Nganh> result = new List<Nganh>();

            string query = string.Format("SELECT * FROM {0}", Nganh.TableName);
            DataTable data = DBCommon.Select(query);
            if (DBUtilities.TableIsNullOrEmpty(data) == TypeOfCheck.Not_Null)
            {
                foreach (DataRow dr in data.Rows)
                {
                    if (dr != null)
                    {
                        result.Add(new Nganh()
                        {
                            //TODO: Kiem tra Cell co bi NULL hay ko?
                            MaNganh = Convert.ToInt32(dr[Nganh.fn_MaNganh]),
                            KiHieu = dr[Nganh.fn_KiHieu].ToString(),
                            Gioi = Convert.ToInt32(dr[Nganh.fn_Gioi]),
                            DPKH = dr[Nganh.fn_DPKH].ToString(),
                            TenTV = dr[Nganh.fn_TenTV].ToString(),
                            NguoiPH = dr[Nganh.fn_NguoiPH].ToString(),
                            NamPH = Convert.ToInt32(dr[Nganh.fn_NamPH]),
                        }
                        );
                    }
                }
            }
            return result;
        }
        public List<Nganh> GetAllNganhsByGioi(int maGioi)
        {
            List<Nganh> result = new List<Nganh>();

            string query = string.Format("SELECT * FROM {0} where Gioi = {1}", Nganh.TableName, maGioi);
            DataTable data = DBCommon.Select(query);
            if (DBUtilities.TableIsNullOrEmpty(data) == TypeOfCheck.Not_Null)
            {
                foreach (DataRow dr in data.Rows)
                {
                    if (dr != null)
                    {
                        result.Add(new Nganh()
                        {
                            //TODO: Kiem tra Cell co bi NULL hay ko?
                            MaNganh = Convert.ToInt32(dr[Nganh.fn_MaNganh]),
                            KiHieu = dr[Nganh.fn_KiHieu].ToString(),
                            Gioi = Convert.ToInt32(dr[Nganh.fn_Gioi]),
                            DPKH = dr[Nganh.fn_DPKH].ToString(),
                            TenTV = dr[Nganh.fn_TenTV].ToString(),
                            NguoiPH = dr[Nganh.fn_NguoiPH].ToString(),
                            NamPH = Convert.ToInt32(dr[Nganh.fn_NamPH]),
                        }
                        );
                    }
                }
            }
            return result;
        }
    }
}
