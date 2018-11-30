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
    public partial class AddMultipleTest : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString;
        static int j = 1;
        protected void Page_Load(object sender, EventArgs e)
        {

            //testnamelbl.Text = Request.QueryString["name"];
            //QuestionNolbl.Text = j.ToString();
            //int id = int.Parse(Request.QueryString["id"]);

        }

        protected void reset_Click(object sender, EventArgs e)
        {

        }

        protected void btnAddQuestion_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString);
            
            conn.Open();
            SqlCommand cmd = new SqlCommand("Select max(QuestionOrder) as QuesOrder from Question where ExamID='" + ddlExamID.SelectedValue + "'", conn);
            Int32 QuesOrder = Convert.ToInt32(cmd.ExecuteScalar());

            Int32 quesOrder = QuesOrder + 1;
            string insert = "insert into Question (Title,Answer1,Answer2,Answer3,Answer4,CorrectAnswer,QuestionOrder,ExamID) values ('" + txtTitle.Text + "','" + txtAnswer1.Text + "','" + txtAnswer2.Text + "','" + txtAnswer3.Text + "','" + txtAnswer4.Text + "','" + ddlCorrectAnswer.SelectedItem.Text + "','" + quesOrder + "','" + ddlExamID.SelectedValue + "')";
            SqlCommand cmd1 = new SqlCommand(insert, conn);
            int m = cmd1.ExecuteNonQuery();
            if (m != 0)
            {
                Response.Redirect("~/Tutor/CheckQuestion.aspx");
            }
            else
            {

            }
            conn.Close();

        }
    }
}
