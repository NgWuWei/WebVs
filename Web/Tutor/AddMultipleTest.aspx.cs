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
    public partial class AddMultipleTest : System.Web.UI.Page
    {
        

        protected void Page_Load(object sender, EventArgs e)
        {
            ContentPlaceHolder mpContentPlaceHolder;
            TextBox testNametxt;
            DropDownList QType;
            mpContentPlaceHolder = (ContentPlaceHolder)PreviousPage.Master.FindControl("body");
            if (mpContentPlaceHolder != null)
            {
                testNametxt = (TextBox)mpContentPlaceHolder.FindControl("txtTestName");
                if (testNametxt != null)
                {
                    testNamelbl.Text = testNamelbl.Text;
                }
            }

        //Session["GroupName"] = txtGroupName.Text;
        // Session["TestName"] = txtTestName.Text;

        // Session["TestType"] = QuestionTypeList.SelectedItem.Value;

         }

        static int i = 0;
        static int questionNumber = 1;

        Label mulquestionlbl = new Label();

        protected void AddAnswerOptionbtn_Click(object sender, EventArgs e)
        {
            TextBox mulquestiontb;
            Label mulquestionResultlbl;
            Label mulquestionlbl2;
            CheckBox cbox;

            i++;
            for (int j = 0; j < i; j++)
            {
                mulquestiontb = new TextBox();
                mulquestionlbl = new Label();

                mulquestionResultlbl = new Label();
                mulquestionlbl2 = new Label();

                // checkbox id = body_cbox_{}
                cbox = new CheckBox
                {
                    ID = "cbox_" + j
                };

                /// TODO checkbox list dynamic control
                mulquestiontb.ID = j.ToString();
                mulquestionlbl.Text = Convert.ToChar(j + 65).ToString();
                mulquestionlbl2.Text = "(" + Convert.ToChar(j + 65).ToString() + ")";

                PlaceHolder1.Controls.Add(new LiteralControl("<br />"));
                PlaceHolder1.Controls.Add(mulquestionlbl2);

                PlaceHolder1.Controls.Add(new LiteralControl("<br />"));
                PlaceHolder1.Controls.Add(mulquestiontb);

                PlaceHolder1.Controls.Add(new LiteralControl("<br />"));
                //PlaceHolder1.Controls.Add(cbox);
                //PlaceHolder1.Controls.Add(optionlbl);
                PlaceHolder1.Controls.Add(new LiteralControl("<br />"));

            }
            CorrectAnswerddl.Items.Add(mulquestionlbl.Text);
        }

        int totalmarks; // for calculate the marks

        protected void savebtn_Click(object sender, EventArgs e)
        {
            TextBox mulquestiontb = new TextBox();
            //mulquestiontb.FindControl("body_" + i);
            // TODO get multiquestion id with numbers body_{}
            // loop to get all answer descriptions into database

            Label mulquestionlbl = new Label();

            int marks = int.Parse(Markstxt.Text);
            totalmarks += marks;

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string insertQuery1 = "INSERT into Assessments (asName, asQuestionType) values " +
                "( @asName, @asQuestionType)";

            string insertQuery2 = "INSERT into MultiQuestions( mqQuestionDesc, mqEachMarks, mqCorrectAnswer)values " +
                "( @mqQuestionDesc, @mqEachMarks, @mqCorrectAnswer)";

            string insertQuery3 = "INSERT into MultiQuestionDetail(mqdAnswerDesc, mqdAnswerLabel)values " +
                "( @mqdAnswerDesc, @mqdAnswerLabel)";

            SqlCommand cmd = new SqlCommand(insertQuery1, conn);

           // cmd.Parameters.AddWithValue("@asName", testNamelbl.Text);
           // cmd.Parameters.AddWithValue("@asQuestionType", questionTypelbl.Text);


            // second query
            cmd.CommandText = insertQuery2;
            cmd.Parameters.AddWithValue("@mqQuestionDesc", QuestionTxt.Text);
            cmd.Parameters.AddWithValue("@mqEachMarks", marks);
            cmd.Parameters.AddWithValue("@mqCorrectAnswer", CorrectAnswerddl.SelectedItem.Value);

            cmd.ExecuteNonQuery();

            // third query

            foreach (TextBox textBox in mulquestiontb.Controls.OfType<TextBox>())
            {
                cmd.CommandText = insertQuery3;
                cmd.Parameters.AddWithValue("@mqdAnswerDesc", mulquestiontb.Text);
                cmd.Parameters.AddWithValue("@mqdAnswerLabel", mulquestionlbl.Text);
                cmd.ExecuteNonQuery();
            }



            conn.Close();

            QuestionNolbl.Text = questionNumber.ToString();
            questionNumber++;

            Response.Redirect("~/Tutor/AddMultipleTest.aspx");

        }



        protected void returnbtn_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();

            string insertQuery1 = "INSERT into Assessment (asTotalMarks) values " +
                "(@asTotalMarks ) where asName = @asName;";

            SqlCommand cmd = new SqlCommand(insertQuery1, conn);


           // cmd.Parameters.AddWithValue("@asName", testNamelbl.Text);
            cmd.Parameters.AddWithValue("@asTotalMarks", totalmarks);

            Response.Write("New Test Name Added Successfully!!!Thank you");

            conn.Close();

            Response.Redirect("~/Tutor/TestDetailsMenu.aspx");
        }
    }
}