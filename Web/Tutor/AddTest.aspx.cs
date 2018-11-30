using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.Tutor
{
    public partial class AddTest : System.Web.UI.Page
    {
        static SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString);
        private static SqlCommand com = new SqlCommand();
        private static SqlDataAdapter da;
        protected void Page_Load(object sender, EventArgs e)
        {
            com = new SqlCommand { CommandText = "Select * from Exam" };
            da = new SqlDataAdapter(com.CommandText, con.ConnectionString);
            var dt = new DataTable();
            da.Fill(dt);
            Repeater1.DataSource = dt;
            Repeater1.DataBind();


        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            
            conn.Open();
            string insert = "insert into Exam ([Subject],[Status]) values ('" + TxtAddCat.Text + "','" + DropDownList1.SelectedItem.Text + "')";
            SqlCommand cmd = new SqlCommand(insert, conn);
            int m = cmd.ExecuteNonQuery();
            if (m != 0)
            {
                Messagelbl.Visible = true;
                Messagelbl.Text = "Sucessfully Added !! ";
                com = new SqlCommand { CommandText = "Select * from Exam" };
                da = new SqlDataAdapter(com.CommandText, conn.ConnectionString);
                var dt = new DataTable();
                da.Fill(dt);
                Repeater1.DataSource = dt;
                Repeater1.DataBind();
            }
            else
            {

            }
            conn.Close();

        }
    }
}