using System;
using System.Collections.Generic;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace Web.App_Code
{
    public class GlobalConnection
    {
        public SqlConnection cnn;

        public GlobalConnection()
        {
            string stringConnection = ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString;
            cnn = new SqlConnection(stringConnection);
            cnn.Open();
        }
    }
}