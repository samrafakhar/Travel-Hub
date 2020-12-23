using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data.SqlClient;
using System.Data.Sql;
using System.Data;

namespace Travel_Hub.Models
{
    public class Rate
    {
        public static string ConnectString = "data source=.\\SQL2014; Initial Catalog=Tourism; Integrated Security = true; ";
        public static SqlDataReader getRatings()
        {
 
           string queryString = "select Tourist.name, Area.name, rating, comments from Tourist_Ratings join Area on Area.areaID=Tourist_Ratings.areaID join Tourist on Tourist.touristID = Tourist_Ratings.touristID";
           SqlConnection connection = new SqlConnection(ConnectString);
           SqlCommand cmd = new SqlCommand(queryString, connection);
           try
           {
               connection.Open();
               SqlDataReader reader = cmd.ExecuteReader();
               return reader;
           }
           catch (Exception ex)
           {
               Console.WriteLine(ex.Message);
               return null;

           }

        }
        public static int AddRating(string area, int rate, string comment)
        {
            SqlConnection con = new SqlConnection(ConnectString);
            con.Open();
            SqlCommand cmd;
            int result = 90;
            try
            {
                cmd = new SqlCommand("Rate", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@areaname", SqlDbType.NVarChar, 30).Value = area;
                cmd.Parameters.Add("@rating", SqlDbType.Int).Value = rate;
                cmd.Parameters.Add("@comments", SqlDbType.NVarChar, 100).Value = comment;
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