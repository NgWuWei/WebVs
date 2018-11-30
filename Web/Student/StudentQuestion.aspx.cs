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
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // this button to send this question answer
            MultiQuestion mq = new MultiQuestion();

            using(SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                // TODO get student ID
                //insert answer given
                SqlCommand cmd = new SqlCommand("insert into studentassessments values (stasAnswerGiven, mqQuestionID) values (@stasAns, mqID)", con);
              //  cmd.Parameters.AddWithValue("@stasAns", );
            }

            // if contains same answer
            if (AnswerText.Text.Contains(mq.mqCorrectAnswer)){
                TotalScore += (float) mq.mqEachMarks;                
            }else if(AnswerText.Text != "" && AnswerText.Text != mq.mqCorrectAnswer)
            {
                // if student append answer again
                TotalScore -= (float)mq.mqEachMarks;
            }            
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            // display select question
            QuestionDisplay.Text = GridView1.SelectedRow.Cells[1].Text;
        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            using(SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                // get id from active user
                // select student
                SqlCommand cmd = new SqlCommand("select studId from students where studId = ", con);
                //cmd.Parameters.AddWithValue("@id", );

                // if student exist then table shown is more than 0
                if(cmd.ExecuteNonQuery() >= 0)
                {
                    cmd.CommandText = "update student set studScore = @tscore where studID = @id";
                    cmd.Parameters.AddWithValue("@tscore", TotalScore);
                    //cmd.Parameters.AddWithValue("@id", );
                    cmd.ExecuteNonQuery();
                }
                // auto close connection
            }


            // TODO after calculating, read into database

        }
    }
}