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

        string str = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

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
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM MultiQuestionDetail", sqlCon);
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
                MultiTestView.Rows[0].Cells[0].Text = "No Data Found ..!";
                MultiTestView.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }

        }

        protected void multiTest_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.Equals("AddNew"))
                {
                    using (SqlConnection sqlCon = new SqlConnection(str))
                    {
                        sqlCon.Open();
                        string query = "INSERT INTO MultiQuestionDetail ( mqdAnswerLabel, mqdAnswerDesc) VALUES (@mqdAnswerLabel,@mqdAnswerDesc)";
                        SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                        sqlCmd.Parameters.AddWithValue("@mqdAnswerLabel", (MultiTestView.FooterRow.FindControl("txtAnswerLabelFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@mqdAnswerDesc", (MultiTestView.FooterRow.FindControl("txtmqdAnswerDescFooter") as TextBox).Text.Trim());
                       
                        sqlCmd.ExecuteNonQuery();
                        ShowGridview();

                    }
                }
            }
            catch (Exception ex)
            {
               
            }
        }


    }
}