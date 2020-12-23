﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Data;

namespace Travel_Hub.Models
{
    public class ViewAllAreas
    {
        public static SqlDataReader getAreaDetails()
        {
            string ConnectString = "data source=.\\SQL2014; Initial Catalog=Tourism; Integrated Security = true; ";
            string queryString = "select * from viewAreaDetails";
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
    }
}