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
    public class GioiRepository : IGioiRepository
    {
        public IQueryable<Gioi> Giois { get; set; }
        public List<Gioi> GetAllGioi()
        {
            List<Gioi> result = new List<Gioi>();

            string query = string.Format("SELECT * FROM {0}", Gioi.TableName);
            DataTable data = DBCommon.Select(query);
            if (DBUtilities.TableIsNullOrEmpty(data) == TypeOfCheck.Not_Null)
            {
                foreach (DataRow dr in data.Rows)
                {
                    if (dr != null)
                    {
                        result.Add(new Gioi()
                        {
                            //TODO: Kiem tra Cell co bi NULL hay ko?
                            MaGioi = Convert.ToInt32(dr[Gioi.fn_MaGioi]),
                            KiHieu = dr[Gioi.fn_KiHieu].ToString(),
                            DPKH = dr[Gioi.fn_DPKH].ToString(),
                            TenTV = dr[Gioi.fn_TenTV].ToString(),
                            NguoiPH = dr[Gioi.fn_NguoiPH].ToString(),
                            NamPH = Convert.ToInt32(dr[Gioi.fn_NamPH]),
                        }
                        );
                    }
                }
            }
            return result;
        }

    }
}
