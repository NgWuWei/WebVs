using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web.Models;

namespace Web.Student
{
    public partial class StudentQuestionChoice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // TODO button to submit answer for 1 question

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            MultiQuestion mq = new MultiQuestion();
            MultiAnswer ma = new MultiAnswer();

            if (ma.mqQuestionID == mq.mqQuestionID)
            {
                ddlAnswer.Items.Add(ma.maAnswerDesc);
            }
        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            // submit with score
        }
    }
}