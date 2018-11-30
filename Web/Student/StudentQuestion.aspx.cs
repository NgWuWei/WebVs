using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web.Models;

namespace Web.Student {
    public partial class StudentQuestion : System.Web.UI.Page {
        private static float TotalScore = 0;

        protected void Page_Load(object sender, EventArgs e) {
            //TODO display data in gridview, select and replace answer onto empty textbox

            // if querystring is null, send back to menu
            if (Request.QueryString["id"] == null)
                Response.Redirect("~/Student/StudentAssessment.aspx", false);
            // no question display
            if (QuestionDisplay.Text == "")
                Table1.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string answer = "";
            int score = 0;
            // TODO delete this line
            Session["user"] = "1";

            // this button to send this question 
            using(SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                // TODO get student ID
                //insert answer given
                SqlCommand cmd = new SqlCommand("insert into studentassessments values (stasAnswerGiven, mqQuestionID, studID) values (@stasAns, @mqID, @studID)", con);
                con.Open();
                cmd.Parameters.AddWithValue("@stasAns", QuestionDisplay.Text);
                cmd.Parameters.AddWithValue("@mqID", Request.QueryString["id"].ToString());
                cmd.Parameters.AddWithValue("@studID", Session["user"].ToString());

                // get answer and score
                cmd.CommandText = "select mqCorrectAnswer, mqEachMarks from MultiQuestions where mqQuestionID = @mqID2";
                cmd.Parameters.AddWithValue("@mqID2", Request.QueryString["id"].ToString());
                cmd.ExecuteScalar();
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        score = int.Parse(reader["mqEachMarks"].ToString());
                        answer = reader["mqCorrectAnswer"].ToString();
                    }
                }
            }

            // if contains same answer
            if (answer.Contains(AnswerText.Text)){
                TotalScore += score;                
            }else if(AnswerText.Text == "" || TotalScore == 0)
            {
                TotalScore += 0;
            }else if(AnswerText.Text != "" && !AnswerText.Text.Equals(answer))
            {
                // if student append answer again
                TotalScore -= score;
            }            
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            // reset
            Table1.Visible = true;
            AnswerText.Text = "";
            // UNDONE display questions and update screen
            QuestionDisplay.Text = GridView1.SelectedRow.Cells[1].Text;
        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            using(SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                // get id from active user
                // select student
                SqlCommand cmd = new SqlCommand("select * from students where studI = @id", con);
                con.Open();
                cmd.Parameters.AddWithValue("@id", Session["user"].ToString());

                // if student exist then table shown is more than 0
                if(cmd.ExecuteNonQuery() >= 0)
                {
                    cmd.CommandText = "update student set studScore = @tscore where studID = @id";
                    cmd.Parameters.AddWithValue("@tscore", TotalScore);
                    cmd.Parameters.AddWithValue("@id", Session["user"].ToString());
                    cmd.ExecuteNonQuery();
                }
                else
                {
                    // no student found
                    Panel1.Controls.Add(new LiteralControl("NO STUDENT FOUND"));
                }
                // auto close connection
            }


            // TODO after calculating, read into database

        }
    }
}