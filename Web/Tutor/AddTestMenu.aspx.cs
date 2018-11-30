using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.Tutor
{
    public partial class AddTestMenu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
         
                string query = "INSERT INTO Assessments(asName, asQuestionType, asTime, asDueDate) VALUES (@asName, @asQuestionType, @asTime, @asDueDate)";

            SqlCommand sqlCmd = new SqlCommand(query, conn);

                sqlCmd.Parameters.AddWithValue("@asName", TextBox1.Text);
                sqlCmd.Parameters.AddWithValue("@asQuestionType", DropDownList1.SelectedItem.Value);
                sqlCmd.Parameters.AddWithValue("@asTime", DateTime.Now.ToString("HH:mm:ss"));
                sqlCmd.Parameters.AddWithValue("@asDueDate", DateTime.Today.ToString("dd-MM-yyyy"));


                sqlCmd.ExecuteNonQuery();
                Response.Redirect("~/Tutor/AddMultipleTest.aspx");


        }
    }
}