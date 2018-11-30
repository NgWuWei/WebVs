using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.Tutor
{
    public partial class AssignTestPart1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

       

        protected void ceratenewbtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Tutor/AddGroupMenu.aspx");
        }
    }
}