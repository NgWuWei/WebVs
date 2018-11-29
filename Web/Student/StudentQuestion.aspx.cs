using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.Student {
    public partial class StudentQuestion : System.Web.UI.Page {
        private float TotalScore = 0;
        private string asId = "";

        protected void Page_Load(object sender, EventArgs e) {
            //TODO display data in gridview, select and replace answer onto empty textbox

            // if querystring is null, send back to menu
            if (Request.QueryString["id"] == null)
                Response.Redirect("~/Student/StudentAssessment.aspx", false);
        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            // UNDONE get score from database
            int score = 0;
            // sum scores
            TotalScore += score;

            // TODO after calculating, read into database

        }
    }
}