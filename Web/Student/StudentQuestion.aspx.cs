using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web.Models;

namespace Web.Student
{
    public partial class StudentQuestion : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            //TODO display data in gridview, select and replace answer onto empty textbox

            // if querystring is null, send back to menu
            if (Request.QueryString["id"] == null)
                Response.Redirect("~/Student/StudentAssessment.aspx", false);
            // no question display
            if (GridView1.SelectedRow == null)
                Table1.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string answer = "";
            int score = 0;
            // TODO delete this line
            Session["user"] = "1";

            // this button to send this question 
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {

                // TODO REDO THIS AND SET TO UPDATE REDO 
                //string CommandString = "";
                //if (AnswerText.Text == "")
                //    CommandString = "insert into studentAssessments (stasAnswerGiven, mqQuestionID, studID) values (@stasAns, @mqID, @studID)";
                //else
                //    CommandString = "update studentAssessments set stasAnswerGiven = @stasAns where studID = @studID and mqQuestionID = @mqID";
                SqlCommand cmd = new SqlCommand("insert into studentAssessments (stasAnswerGiven, mqQuestionID, studID) values (@stasAns, @mqID, @studID)", con);
                con.Open();
                cmd.Parameters.AddWithValue("@stasAns", QuestionDisplay.Text);
                cmd.Parameters.AddWithValue("@mqID", GridView1.SelectedRow.Cells[3].Text);
                cmd.Parameters.AddWithValue("@studID", Session["user"]);
                cmd.ExecuteNonQuery();

                // get answer and score
                cmd.CommandText = "select mqEachMarks, mqCorrectAnswer from MultiQuestions where mqQuestionID = @mqID2";
                cmd.Parameters.AddWithValue("@mqID2", GridView1.SelectedRow.Cells[3].Text);
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
            if (answer.Contains(AnswerText.Text))
            {
                // if correct set score to question
                UpdateScore(score);
            }
            else if (AnswerText.Text != "" && !AnswerText.Text.Equals(answer))
            {
                // if student append answer again
                UpdateScore(0);
            }
        }

        private void UpdateScore(int score)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                // UNDONE each time set score follow question id
                SqlCommand cmd = new SqlCommand("update studentAssessments set stasScore = @score where studID = @id and mqQuestionID = @qID", con);
                con.Open();
                cmd.Parameters.AddWithValue("@score", score);
                cmd.Parameters.AddWithValue("@id", Session["user"].ToString());
                cmd.Parameters.AddWithValue("@qID", GridView1.SelectedRow.Cells[3].Text);
                cmd.ExecuteNonQuery();

                // auto close connection
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
            Response.Redirect("~/Student/EndAssessment.aspx");
        }
    }
}