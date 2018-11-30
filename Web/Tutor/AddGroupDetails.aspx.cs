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
    //public partial class AddGroupDetails : System.Web.UI.Page
    //{
    //    protected void Page_Load(object sender, EventArgs e)
    //    {
    //        groupNamelbl.Text = Request.QueryString["Gname"];
    //    }

    //    protected void GroupConfirmbtn_Click(object sender, EventArgs e)
    //    {
    //        foreach (GridViewRow row in GridView1.Rows)
    //        {
    //            if (row.RowType == DataControlRowType.DataRow)
    //            {
    //                CheckBox chkEmployee = (CheckBox)row.FindControl("assignBox");
    //                if (chkEmployee.Checked)
    //                {
    //                    Label correctAnswer = (Label)row.FindControl("txtmqdAnswerID");

    //                    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
    //                    {
    //                        using (SqlCommand cmd = new SqlCommand("INSERT INTO MultiQuestions(mqCorrectAnswer) VALUES" +
    //                            "(@mqCorrectAnswer)", con))
    //                        {
    //                            cmd.Parameters.AddWithValue("@mqCorrectAnswer", mulquestionlbl.Text.Trim());

    //                            con.Open();
    //                            cmd.ExecuteNonQuery();

    //                        }
    //                    }
    //                }
    //            }
    //        }

    //    }
    //}
}