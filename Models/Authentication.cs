using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Data;

namespace Travel_Hub.Models
{
    public class Authentication
    {
        public static string ConnectString = "data source=.\\SQL2014; Initial Catalog=Tourism; Integrated Security = true; ";
        public static int Login(string user, string password)
        {

            SqlConnection con = new SqlConnection(ConnectString);
            con.Open();
            SqlCommand cmd;
            int result = 90;
            try
            {
                cmd = new SqlCommand("UserLogIn", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@username", SqlDbType.NVarChar, 30).Value = user;
                cmd.Parameters.Add("@password", SqlDbType.NVarChar, 15).Value = password;

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

        public static int SignUp(string Name, string Contact, string email, string cnic, string Password, DateTime date, int age)
        {

            SqlConnection con = new SqlConnection(ConnectString);
            con.Open();
            SqlCommand cmd;
            int result = 90;
            try
            {
                cmd = new SqlCommand("signUp", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@_name", SqlDbType.NVarChar, 30).Value = Name;
                cmd.Parameters.Add("@_email", SqlDbType.NVarChar, 30).Value = email;
                cmd.Parameters.Add("@_pwd ", SqlDbType.NVarChar, 15).Value = Password;
                cmd.Parameters.Add("@_phone ", SqlDbType.NVarChar, 11).Value = Contact;
                cmd.Parameters.Add("@_age", SqlDbType.Int).Value = age;
                cmd.Parameters.Add("@_CNIC", SqlDbType.Char, 13).Value = cnic;

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

        public static int AdminLogin(string user, string password)
        {

            SqlConnection con = new SqlConnection(ConnectString);
            con.Open();
            SqlCommand cmd;
            int result = 90;
            try
            {
                cmd = new SqlCommand("AdministratorLogIn", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@username", SqlDbType.NVarChar, 30).Value = user;
                cmd.Parameters.Add("@password", SqlDbType.NVarChar, 15).Value = password;

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

        public static int SignOut()
        {
            SqlConnection con = new SqlConnection(ConnectString);
            con.Open();
            SqlCommand cmd;
            int result = 90;
            try
            {
                cmd = new SqlCommand("logOut", con);
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
    }
}