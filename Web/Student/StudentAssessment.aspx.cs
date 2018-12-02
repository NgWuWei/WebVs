using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.Student
{
    public partial class StudentAssessment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            Response.Redirect("~/Student/StudentQuestion.aspx?id=" + e.CommandArgument.ToString());
            // UNDONE enable this after QuestionType is set
            //if (GridView1.SelectedRow.Cells[4].Text == "objective")
            //{
            //    Response.Redirect("~/Student/StudentQuestion.aspx?id=" + GridView1.SelectedRow.Cells[1].Text);
            //}
            //else if (GridView1.SelectedRow.Cells[4].Text == "subjective")
            //{
            //    Response.Redirect("~/Student/StudentQuestionSub.aspx?id=" + GridView1.SelectedRow.Cells[1].Text);
            //}
        }
    }
}