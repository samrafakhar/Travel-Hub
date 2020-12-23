using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data.SqlClient;
using System.Data.Sql;
using System.Data;


namespace Travel_Hub.Models
{
    public class Bill
    {
        public static string ConnectString = "data source=.\\SQL2014; Initial Catalog=Tourism; Integrated Security = true; ";
        public static SqlDataReader getBill()
        {

            string queryString = "select * from currentBill";
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
        public static int FindBill(int tour, int noOfPeople)
        {
            
            SqlConnection con = new SqlConnection(ConnectString);
            con.Open();
            SqlCommand cmd;
            int result = 90;
            try
            {
                cmd = new SqlCommand("BillCalculationAndReservation", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@tourid", SqlDbType.Int).Value = tour;
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

    }
}