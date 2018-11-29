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
    public partial class TestDetailsMenu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Assignbtn_Click(object sender, EventArgs e)
        {
            //foreach (GridViewRow row in MultiTestView.Rows)
            //{
            //    if (row.RowType == DataControlRowType.DataRow)
            //    {
            //        CheckBox chkEmployee = (CheckBox)row.FindControl("cbSelect");
            //        if (chkEmployee.Checked)
            //        {
            //            Label correctAnswer = (Label)row.FindControl("txtmqdAnswerID");

            //            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            //            {
            //                using (SqlCommand cmd = new SqlCommand("INSERT INTO MultiQuestions(mqCorrectAnswer) VALUES (@mqCorrectAnswer)", con))
            //                {
            //                    cmd.Parameters.AddWithValue("@mqCorrectAnswer", correctAnswer.Text.Trim());

            //                    con.Open();
            //                    cmd.ExecuteNonQuery();
            //                    con.Close();
            //                }
            //            }
            //        }
            //    }
            //}

            Response.Redirect("~/Tutor/AssignTestPart1.aspx");

        }
    }
}