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

        String str = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        static int j = -1;
        static int k = 1;
        static int a = 1;
        static int totalMarks = 0;

        Label LabelNo = new Label();

        protected void Page_Load(object sender, EventArgs e)
        {
            

            QuestionNolbl.Text = a.ToString();

            SqlConnection con1 = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            DataTable dt = new DataTable();
            con1.Open();
            SqlDataReader myReader = null;
            SqlCommand myCommand = new SqlCommand("SELECT * FROM Assessments WHERE asID = (SELECT MAX(asID) FROM Assessments)", con1);

            myReader = myCommand.ExecuteReader();

            while (myReader.Read())
            {
                testnamelbl.Text = (myReader["asName"].ToString());
                questiontypelbl.Text = (myReader["asQuestionType"].ToString());
                
            }
            con1.Close();


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
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM MultiAnswers", sqlCon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                MultiTestView.DataSource = dtbl;
                MultiTestView.DataBind();

            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                MultiTestView.DataSource = dtbl;
                MultiTestView.DataBind();
                MultiTestView.Rows[0].Cells.Clear();
                MultiTestView.Rows[0].Cells.Add(new TableCell());
                MultiTestView.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                MultiTestView.Rows[0].Cells[0].Text = "Please Enter Answer Option ..!";
                MultiTestView.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }
        }


        TextBox txtAnswerLabelFooter = new TextBox();

        protected void multiTest_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.Equals("AddNew"))
                {

                    ++j;
                    LabelNo.Text = Convert.ToChar(j + 65).ToString();
                    using (SqlConnection sqlCon = new SqlConnection(str))
                    {
                        
                        sqlCon.Open();
                        string query = "INSERT INTO MultiAnswers (maAnswerID,maAnswerDesc) VALUES (@maAnswerID, @maAnswerDesc)";
                        SqlCommand sqlCmd = new SqlCommand(query, sqlCon);

                        sqlCmd.Parameters.AddWithValue("@maAnswerID", LabelNo.Text);
                        sqlCmd.Parameters.AddWithValue("@maAnswerDesc", (MultiTestView.FooterRow.FindControl("txtmqdAnswerDescFooter") as TextBox).Text.Trim());


                        sqlCmd.ExecuteNonQuery();
                        ShowGridview();
                    }
                }
            }
            catch (Exception ex)
            {

            }
        }



        protected void multiTest_RowEditing(object sender, GridViewEditEventArgs e)
        {
            MultiTestView.EditIndex = e.NewEditIndex;
            ShowGridview();
        }

        protected void multiTest_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            MultiTestView.EditIndex = -1;
            ShowGridview();
        }

        protected void multiTest_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(str))
                {
                    sqlCon.Open();
                    string query = "UPDATE MultiAnswers SET maAnswerID=@maAnswerID, maAnswerDesc= @maAnswerDesc WHERE No = @No";

                        
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@maAnswerDesc", (MultiTestView.Rows[e.RowIndex].FindControl("txtmqdAnswerDescName") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@maAnswerID", (MultiTestView.Rows[e.RowIndex].FindControl("txtmqdAnswerID") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@No", Convert.ToInt32(MultiTestView.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    MultiTestView.EditIndex = -1;
                    ShowGridview();
                    
                }
            }
            catch (Exception ex)
            {
                //lblSuccessMessage.Text = "";
                //lblErrorMessage.Text = ex.Message;
            }
        }

        protected void multiTest_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(str))
                {
                    sqlCon.Open();
                    string query = "DELETE FROM MultiAnswers WHERE No = @No";

                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@No", Convert.ToInt32(MultiTestView.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    ShowGridview();

                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void MultiTestView_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private DataTable GetData()
        {
            string connection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connection))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM MultiQuestions", con))
                {
                    using (SqlDataAdapter da = new SqlDataAdapter())
                    {
                        da.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            da.Fill(dt);
                            return dt;
                        }
                    }
                }
            }
        }

        protected void savebtn_Click1(object sender, EventArgs e)
        {
            MultiTestView.DataSource = this.GetData();

            foreach (GridViewRow row in MultiTestView.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkEmployee = (CheckBox)row.FindControl("cbSelect");
                    if (chkEmployee.Checked)
                    {
                        Label correctAnswer = (Label)row.FindControl("txtmqdAnswerID");
                         
                        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                        {
                            using (SqlCommand cmd = new SqlCommand("INSERT INTO MultiQuestions(mqCorrectAnswer) VALUES (@mqCorrectAnswer)", con))
                            {
                                cmd.Parameters.AddWithValue("@mqCorrectAnswer", correctAnswer.Text.Trim());
                               
                                con.Open();
                                cmd.ExecuteNonQuery();
                                con.Close();
                            }
                        }
                    }
                }
            }

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();

            string query = "INSERT INTO MultiQuestions(mqQuestionDesc, mqEachMarks) VALUES (@mqQuestionDesc, @mqEachMarks)";
            SqlCommand sqlCmd = new SqlCommand(query, conn);

            sqlCmd.Parameters.AddWithValue("@mqQuestionDesc", QuestionTxt.Text);
            sqlCmd.Parameters.AddWithValue("@mqEachMarks", Markstxt.Text);

            int marks = Convert.ToInt32(Markstxt.Text);

            sqlCmd.ExecuteNonQuery();

            string query2 = "INSERT INTO MultiAnswers(maQuestionNo) VALUES (@maQuestionNo)";
            SqlCommand sqlCmd2 = new SqlCommand(query2, conn);

            sqlCmd2.Parameters.AddWithValue("@maQuestionNo", QuestionNolbl.Text);

            
            sqlCmd2.ExecuteNonQuery();

            ++a;
            totalMarks += marks;




            QuestionTxt.Text = string.Empty;
            Markstxt.Text = string.Empty;


            MultiTestView.DataSource = null;
            MultiTestView.DataBind();

            Response.Redirect("~/Tutor/AddMultipleTest.aspx");

        }

        protected void returnbtn_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();

            string query = "INSERT INTO Assessments(asTotalMarks) VALUES (@asTotalMarks)";
            SqlCommand sqlCmd = new SqlCommand(query, conn);

            sqlCmd.Parameters.AddWithValue("@asTotalMarks", totalMarks.ToString());
            sqlCmd.ExecuteNonQuery();

            Response.Redirect("~/Tutor/TestDetailsMenu.aspx");
        }
    }
}