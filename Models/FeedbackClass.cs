using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data.SqlClient;
using System.Data.Sql;
using System.Data;

namespace Travel_Hub.Models
{
    public class FeedbackClass
    {
        public static int AddFeedback(string feedback)
        {
            string ConnectString = "data source=.\\SQL2014; Initial Catalog=Tourism; Integrated Security = true; ";
            SqlConnection con = new SqlConnection(ConnectString);
            con.Open();
            SqlCommand cmd;
            int result = 90;
            try
            {
                cmd = new SqlCommand("Feedback", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@feedback", SqlDbType.NVarChar, 30).Value = feedback;
                
                cmd.ExecuteNonQuery();
                result = 100;
            }

            catch (SqlException ex)
            {

                Console.WriteLine("Sql exe" + ex.Message.ToString());
                result = -2;
            }
            finally
            {
                con.Close();
            }
            return result;

        }
    }
}