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
    public class ThongKeRepository : IThongKeRepository
    {
        public IQueryable<ThongKe> ThongKes { get; set; }
        public List<ThongKe> GetThongKeByLop(int Lop)
        {
            List<ThongKe> result = new List<ThongKe>();

            string query = string.Format("XuatDuLieuBangTheoLop");
            DataTable data = DBCommon.SelectProcedure(query, Lop);
            if (DBUtilities.TableIsNullOrEmpty(data) == TypeOfCheck.Not_Null)
            {
                foreach (DataRow dr in data.Rows)
                {
                    if (dr != null)
                    {
                        result.Add(new ThongKe()
                        {
                            //TODO: Kiem tra Cell co bi NULL hay ko?
                            MaBo = Convert.ToInt32(dr[ThongKe.fn_MaBo]),
                            TenTiengViet = dr[ThongKe.fn_TenTV].ToString(),
                            Ho = Convert.ToInt32(dr[ThongKe.fn_Ho]),
                            perHo = Convert.ToSingle(dr[ThongKe.fn_perHo]),
                            Chi = Convert.ToInt32(dr[ThongKe.fn_Chi]),
                            perChi = Convert.ToSingle(dr[ThongKe.fn_perChi]),
                            Loai = Convert.ToInt32(dr[ThongKe.fn_Loai]),
                            perLoai = Convert.ToSingle(dr[ThongKe.fn_perLoai]),
                        }
                        );
                    }
                }
            }
            return result;
        }
    }
}
