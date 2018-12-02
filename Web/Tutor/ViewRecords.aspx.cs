using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.Tutor {
    public partial class ViewRecords : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // set grade manually
            using(SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                string studentID = GridView1.SelectedDataKey[0].ToString();

                con.Open();
                SqlCommand cmd = new SqlCommand("update students set studGrade = @grade where studid = @id", con);
                cmd.Parameters.AddWithValue("@grade", TextBox1.Text);
                cmd.Parameters.AddWithValue("@id", Convert.ToInt32(studentID));
                cmd.ExecuteNonQuery();
                cmd.Parameters.Clear();

                // update gridview
                GridView1.DataBind();
                this.Controls.Add(new LiteralControl("Grade added!"));
            }
        }
    }
}