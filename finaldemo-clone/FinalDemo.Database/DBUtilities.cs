using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FinalDemo.Database
{
    public enum TypeOfCheck
    {
        Succes,
        Fail,
        Not_Null,
        Null
    }
    public static class DBUtilities
    {
        public static TypeOfCheck TableIsNullOrEmpty(DataTable dt)
        {
            if (dt!= null && dt.Rows.Count>0)
            return TypeOfCheck.Not_Null;
            return TypeOfCheck.Null;
        
        }
    }
}
