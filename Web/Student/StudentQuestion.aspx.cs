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
            // if querystring is null, send back to menu
            if (Request.QueryString["id"] == null)
                Response.Redirect("~/Student/StudentAssessment.aspx", false);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // some local variable
            int totalQuestion = 0, score = 0, totalScore = 0;
            string answer = " ", correctAnswer = " ";

            // get all question selected from datalist
            foreach (DataListItem items in DataList1.Items)
            {
                // reset answer to blank
                answer = correctAnswer = " ";

                // open database
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    // update question index
                    score = 0;

                    // get all controls from each datalist items
                    Label qID = items.FindControl("lblID") as Label;
                    Label marks = items.FindControl("lblMarks") as Label;
                    RadioButton A = items.FindControl("maAnswerA") as RadioButton;
                    RadioButton B = items.FindControl("maAnswerB") as RadioButton;
                    RadioButton C = items.FindControl("maAnswerC") as RadioButton;
                    RadioButton D = items.FindControl("maAnswerD") as RadioButton;

                    // get correct answer from database
                    con.Open();
                    SqlCommand cmd = new SqlCommand("select mqCorrectAnswer from MultiQuestions where mqQuestionID = @mqID and asID = @asID", con);
                    cmd.Parameters.AddWithValue("@mqID", Convert.ToInt32(qID.Text));
                    cmd.Parameters.AddWithValue("@asID", Request.QueryString["id"].ToString());
                    correctAnswer = cmd.ExecuteScalar().ToString();
                    cmd.Parameters.Clear();

                    // get radio value
                    if (A.Checked)
                        answer = "A";
                    else if (B.Checked)
                        answer = "B";
                    else if (C.Checked)
                        answer = "C";
                    else if (D.Checked)
                        answer = "D";

                    // if correct then set marks, else it will be 0
                    if (correctAnswer.Equals(answer))
                        score = Convert.ToInt32(marks.Text);

                    // set into student assessment with answer provided
                    cmd.CommandText = "insert into studentAssessments(stasScore, stasAnswerGiven, mqQuestionID, studID) values (@score, @ans, @mqID, @studID)";
                    cmd.Parameters.AddWithValue("@score", score);
                    cmd.Parameters.AddWithValue("@ans", answer);
                    cmd.Parameters.AddWithValue("@mqID", Convert.ToInt32(qID.Text));
                    cmd.Parameters.AddWithValue("@studID", Session["user"].ToString());
                    cmd.ExecuteNonQuery();
                    cmd.Parameters.Clear();

                    // update total score
                    totalScore += score;
                    totalQuestion += score;
                }
            }

            // update score
            Response.Redirect("~/Student/EndAssessment.aspx?result=" + UpdateScore(totalScore, totalQuestion));
        }

        private int UpdateScore(int tScore, int tQuestion)
        {
            // set total score and update into Assessment
            int percent = 100 * tScore / tQuestion;
            using(SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("update Assessments set asTotalMarks = @Percent where asID = @asID and studID = @studID", con);
                cmd.Parameters.AddWithValue("@Percent", percent);
                cmd.Parameters.AddWithValue("@asID", Request.QueryString["id"].ToString());
                cmd.Parameters.AddWithValue("@studID", Session["user"].ToString());
                cmd.ExecuteNonQuery();
                cmd.Parameters.Clear();
            }
            return percent;
        }
    }
}