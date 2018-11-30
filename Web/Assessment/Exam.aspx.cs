using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.Assessment
{
    public partial class Exam : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Session.Add("Username", Session["Username"].ToString());
            }
            catch (Exception)
            {
                Response.Redirect("~/Login.aspx");
            }
        }
    }
}