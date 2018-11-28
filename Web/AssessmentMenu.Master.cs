using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web
{
    public partial class AssessmentMenu : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // enable this when database is linked
            // HACK disable for testing remember
            //if (Session["user"] == null) {
            //    Response.Redirect("~/Login.aspx");
            //}
        }
    }
}