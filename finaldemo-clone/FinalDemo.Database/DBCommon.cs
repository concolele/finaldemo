using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FinalDemo.Database
{
    public static class DBCommon
    {
        private static string ConnectString = "";
        public static void SetConnect(string connectString)
        {
            ConnectString = connectString;
        }
        public static SqlConnection GetConnect()
        {
            return new SqlConnection(ConnectString);
        }
        public static DataTable Select(string query)
        {
            SqlConnection conn = GetConnect();
            SqlCommand cmd = new SqlCommand(query, conn);
            try
            {
                conn.Open();
                DataTable dt = new DataTable();
                SqlDataAdapter SqlDAT = new SqlDataAdapter(cmd);
                SqlDAT.Fill(dt);
                return dt;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                try
                {
                    conn.Close();
                }
                catch (Exception)
                {

                }
                cmd.Dispose();
            }
        }
        public static int Execute(string query, params SqlParameter[] para)
        {
            SqlConnection conn = GetConnect();
            SqlCommand cmd = new SqlCommand(query, conn);
            // execute query
            //cmd.CommandType = CommandType.StoredProcedure;
            foreach (SqlParameter paras in para)
                cmd.Parameters.Add(paras);
            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
                return 1;
            }
            catch (Exception ex)
            {
                return 0;
                throw ex;
            }
            finally
            {
                conn.Close();
                cmd.Dispose();
            }
        }
        public static int ExecuteProcedure(string query, params SqlParameter[] para)
        {
            SqlConnection conn = GetConnect();
            SqlCommand cmd = new SqlCommand(query, conn);
            // execute procedure
            cmd.CommandType = CommandType.StoredProcedure;
            foreach (SqlParameter paras in para)
                cmd.Parameters.Add(paras);
            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
                return 1;
            }
            catch (Exception ex)
            {
                return 0;
                throw ex;
            }
            finally
            {
                conn.Close();
                cmd.Dispose();
            }
        }
        public static DataTable SelectBy(string query, params SqlParameter[] para)
        {
            SqlConnection conn = GetConnect();
            SqlCommand cmd = new SqlCommand(query, conn);
            //cmd.CommandType = CommandType.StoredProcedure;
            foreach (SqlParameter paras in para)
                cmd.Parameters.Add(paras);
            try
            {
                conn.Open();
                DataTable dt = new DataTable();
                SqlDataAdapter SqlDAT = new SqlDataAdapter(cmd);
                SqlDAT.Fill(dt);
                return dt;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conn.Close();
                cmd.Dispose();
            }
        }
    }
}
