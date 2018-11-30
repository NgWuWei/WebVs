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
        string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        static int j = 1;
        protected void Page_Load(object sender, EventArgs e)
        {

            testnamelbl.Text = Request.QueryString["name"];
            QuestionNolbl.Text = j.ToString();
            //int id = int.Parse(Request.QueryString["id"]);

        }

        void PopulateGridview()
        {
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
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


        protected void multiTest_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.Equals("AddNew"))
                {
                    using (SqlConnection sqlCon = new SqlConnection(connectionString))
                    {
                        sqlCon.Open();
                        string query = "INSERT INTO MultiAnswers(maAnswerNo , maAnswerDesc) VALUES (@maAnswerNo,@maAnswerDesc)";
                        SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                        sqlCmd.Parameters.AddWithValue("@maAnswerNo", (MultiTestView.FooterRow.FindControl("txtmqdAnswerIDFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@maAnswerDesc", (MultiTestView.FooterRow.FindControl("txtmqdAnswerDescFooter") as TextBox).Text.Trim());
                        sqlCmd.ExecuteNonQuery();
                        PopulateGridview();
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
            PopulateGridview();
        }

        protected void multiTest_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            MultiTestView.EditIndex = -1;
            PopulateGridview();
        }

        protected void multiTest_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = "UPDATE PhoneBook SET maAnswerNo=@maAnswerNo, maAnswerDesc =@maAnswerDesc WHERE maAnswerID = @maAnswerID";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@maAnswerNo", (MultiTestView.Rows[e.RowIndex].FindControl("txtmqdAnswerID") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@maAnswerDesc", (MultiTestView.Rows[e.RowIndex].FindControl("txtmqdAnswerDescName") as TextBox).Text.Trim());

                    sqlCmd.Parameters.AddWithValue("@maAnswerID", Convert.ToInt32(MultiTestView.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    MultiTestView.EditIndex = -1;
                    PopulateGridview();
                    
                }
            }
            catch (Exception ex)
            {
               
            }
        }

        protected void multiTest_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = "DELETE FROM MultiAnswers WHERE maAnswerID = @maAnswerID";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@maAnswerID", Convert.ToInt32(MultiTestView.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    PopulateGridview();
                }
            }
            catch (Exception ex)
            {
               
            }
        }


        protected void confirmbtn_Click(object sender, EventArgs e)
        {
            Label1.Text = "Save Before u want to create next question!!! + <br />";

            PopulateGridview();
            

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
        static int totalResult = 0;


        protected void savebtn_Click(object sender, EventArgs e)
        {
            int result = int.Parse(Markstxt.Text);

            MultiTestView.DataSource = this.GetData();

            foreach (GridViewRow row in MultiTestView.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox cb = (CheckBox)row.FindControl("cbSelect");
                    if (cb.Checked)
                    {
                        Label correctAnswer = (Label)row.FindControl("txtmqdAnswerID");

                        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                        {
                            using (SqlCommand cmd = new SqlCommand("INSERT INTO MultiQuestions( mqQuestionDesc, maQuestionNo, mqCorrectAnswer, mqQuestionDesc , mqEachMarks) VALUES" +
                                "(@mqQuestionDesc, @maQuestionNo, @mqCorrectAnswer, @mqQuestionDesc , @mqEachMarks)", con))
                            {
                                cmd.Parameters.AddWithValue("@mqCorrectAnswer", (MultiTestView.FooterRow.FindControl("txtmqdAnswerIDFooter") as TextBox).Text.Trim());
                                cmd.Parameters.AddWithValue("@mqQuestionDesc", QuestionTxt.Text);
                                cmd.Parameters.AddWithValue("@mqEachMarks", Markstxt.Text);
                                

                                con.Open();
                                cmd.ExecuteNonQuery();

                            }
                        }
                    }
                }
            }


            SqlConnection conn2 = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn2.Open();

            string query2 = "INSERT INTO MultiAnswers( maQuestionNo ) VALUES ( @maQuestionNo, )";

            SqlCommand sqlCmd2 = new SqlCommand(query2, conn2);

            sqlCmd2.Parameters.AddWithValue("@maQuestionNo", QuestionNolbl.Text);


            sqlCmd2.ExecuteNonQuery();


            QuestionTxt.Text = string.Empty;
            Markstxt.Text = string.Empty;
            totalResult =+ result;
            QuestionTxt.Text = " ";
            Markstxt.Text = " ";

            MultiTestView.DataSource = null;
            MultiTestView.DataBind();

            j++;

            Response.Redirect("~/Tutor/AddMultipleTest.aspx");
        }


        protected void returnbtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Tutor/TestDetailsMenu.aspx");
        }
    }



}
