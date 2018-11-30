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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateGridview();
            }

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
                    sqlCmd.Parameters.AddWithValue("@FirstName", (MultiTestView.Rows[e.RowIndex].FindControl("txtFirstName") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@LastName", (MultiTestView.Rows[e.RowIndex].FindControl("txtLastName") as TextBox).Text.Trim());

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

    }



}
