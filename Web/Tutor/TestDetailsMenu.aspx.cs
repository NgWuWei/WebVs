using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.Tutor
{
    public partial class TestDetailsMenu : System.Web.UI.Page
    {
        String str = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;



        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ShowGridview();
            }
        }

        void ShowGridview()
        {

            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(str))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM MultiQuestions", sqlCon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                MultiTestView2.DataSource = dtbl;
                MultiTestView2.DataBind();

            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                MultiTestView2.DataSource = dtbl;
                MultiTestView2.DataBind();
                MultiTestView2.Rows[0].Cells.Clear();
                MultiTestView2.Rows[0].Cells.Add(new TableCell());
                MultiTestView2.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                MultiTestView2.Rows[0].Cells[0].Text = "There is no data record ..!";
                MultiTestView2.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }
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