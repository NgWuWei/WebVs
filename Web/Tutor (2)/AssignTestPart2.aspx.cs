using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.Tutor
{
	public partial class AssignTestPart2 : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

        protected void confirmbtn_Click(object sender, EventArgs e)
        {
            Confirmlbl.Text = "Your Test is assigned to your Group. " + "<br />" +
                "You can edit these settings at any time by going to the Tests section, then select the Settings link for this assignment.";

        }
    }
}