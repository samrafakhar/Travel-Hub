using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data.SqlClient;
using System.Data.Sql;
using System.Data;

namespace Travel_Hub.Models
{
    public class Tour
    {
        public static string ConnectString = "data source=.\\SQL2014; Initial Catalog=Tourism; Integrated Security = true; ";
        public static int CreateANewTour(DateTime tour, string vehicle, string area)
        {
            
            SqlConnection con = new SqlConnection(ConnectString);
            con.Open();
            SqlCommand cmd;
            int result = 90;
            try
            {
                cmd = new SqlCommand("createTours", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@tourDate", SqlDbType.DateTime).Value = tour;
                cmd.Parameters.Add("@vehicle", SqlDbType.NVarChar, 10).Value = vehicle;
                cmd.Parameters.Add("@tourType", SqlDbType.NVarChar, 10).Value = "New";
                cmd.Parameters.Add("@areaname", SqlDbType.NVarChar, 30).Value = area;

                cmd.Parameters.Add("@flag", SqlDbType.Int).Direction = ParameterDirection.Output;
                cmd.ExecuteNonQuery();
                result = Convert.ToInt32(cmd.Parameters["@flag"].Value);
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

        public static int checkTour()
        {

           
            SqlConnection con = new SqlConnection(ConnectString);
            con.Open();
            SqlCommand cmd;
            int result = 90;
            try
            {
                cmd = new SqlCommand("checkTour", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                
                cmd.ExecuteNonQuery();
                
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

        public static int reserveNewTour(int noOfPeople)
        {
            SqlConnection con = new SqlConnection(ConnectString);
            con.Open();
            SqlCommand cmd;
            int result = 90;
            try
            {
                cmd = new SqlCommand("reserveNewTour", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@noOfPeople", SqlDbType.Int).Value = noOfPeople;

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
        public static SqlDataReader getAreasWithSameLocation()
        {
            string ConnectString = "data source=.\\SQL2014; Initial Catalog=Tourism; Integrated Security = true; ";
            string queryString = "select * from areasWithCurrentLocation";
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

        public static int AddAnArea(string areaname)
        {

            SqlConnection con = new SqlConnection(ConnectString);
            con.Open();
            SqlCommand cmd;
            int result = 90;
            try
            {
                cmd = new SqlCommand("addAreaToTour", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@areaname", SqlDbType.NVarChar, 30).Value = areaname;

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