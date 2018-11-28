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
    public partial class TestMenu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        

        protected void AddTestbtn_Click(object sender, EventArgs e)
        {
           Session["TestName"] = txtTestName.Text;

            if (QuestionTypeList.SelectedItem.Value == "Multiple Question")
                {
                    Session["TestType"] = QuestionTypeList.SelectedItem.Value;
                    Response.Redirect("~/Tutor/AddMultipleTest.aspx");
                }
                else if(QuestionTypeList.SelectedItem.Value == "Free Text")
                {
                    
                }
                else if (QuestionTypeList.SelectedItem.Value == " ")
                {

                }
                else if (QuestionTypeList.SelectedItem.Value == " ")
                {

                }
               
        }
    }
}