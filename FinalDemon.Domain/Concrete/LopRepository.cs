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
    public class LopRepository : ILopRepository
    {
        public IQueryable<Lop> Lops { get; set; }
        public List<Lop> GetAllLop()
        {
            List<Lop> result = new List<Lop>();

            string query = string.Format("SELECT * FROM {0}", Lop.TableName);
            DataTable data = DBCommon.Select(query);
            if (DBUtilities.TableIsNullOrEmpty(data) == TypeOfCheck.Not_Null)
            {
                foreach (DataRow dr in data.Rows)
                {
                    if (dr != null)
                    {
                        result.Add(new Lop()
                        {
                            //TODO: Kiem tra Cell co bi NULL hay ko?
                            MaLop = Convert.ToInt32(dr[Lop.fn_MaLop]),
                            KiHieu = dr[Lop.fn_KiHieu].ToString(),
                            Nganh = Convert.ToInt32(dr[Lop.fn_Nganh]),
                            DPKH = dr[Lop.fn_DPKH].ToString(),
                            TenTV = dr[Lop.fn_TenTV].ToString(),
                            NguoiPH = dr[Lop.fn_NguoiPH].ToString(),
                            NamPH = Convert.ToInt32(dr[Lop.fn_NamPH]),
                        }
                        );
                    }
                }
            }
            return result;
        }
        public List<Lop> GetAllLopsByNganh(int maNganh)
        {
            List<Lop> result = new List<Lop>();

            string query = string.Format("SELECT * FROM {0} where Nganh = {1}", Lop.TableName, maNganh);
            DataTable data = DBCommon.Select(query);
            if (DBUtilities.TableIsNullOrEmpty(data) == TypeOfCheck.Not_Null)
            {
                foreach (DataRow dr in data.Rows)
                {
                    if (dr != null)
                    {
                        result.Add(new Lop()
                        {
                            //TODO: Kiem tra Cell co bi NULL hay ko?
                            MaLop = Convert.ToInt32(dr[Lop.fn_MaLop]),
                            KiHieu = dr[Lop.fn_KiHieu].ToString(),
                            Nganh = Convert.ToInt32(dr[Lop.fn_Nganh]),
                            DPKH = dr[Lop.fn_DPKH].ToString(),
                            TenTV = dr[Lop.fn_TenTV].ToString(),
                            NguoiPH = dr[Lop.fn_NguoiPH].ToString(),
                            NamPH = Convert.ToInt32(dr[Lop.fn_NamPH]),
                        }
                        );
                    }
                }
            }
            return result;
        }
    }
}
