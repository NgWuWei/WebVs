using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web
{
    public partial class Mainpage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Session["auth"].ToString() == "Tutor")
                Response.Redirect("~/Tutor/Tutor.aspx");
            else if (Session["auth"].ToString() == "Student")
                Response.Redirect("~/Student/Student.aspx");
        }
    }
}