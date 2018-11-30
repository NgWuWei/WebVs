using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web {
    public partial class Login : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {

        }

        protected void LoginButton_Click(object sender, EventArgs e) {
            // reset both to empty
            string isTutor = "";
            string isStudent = "";

            // match user ID to see if valid
            string str = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            //string str = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\GitHub\Web\Web\App_Data\Database1.mdf;Integrated Security=True";
            SqlConnection connection = new SqlConnection(str);
            // open connection
            connection.Open();

            // get tutor
            SqlCommand cmd = new SqlCommand("select tutorID from Tutors where tutorEmail = @tutorEmail", connection);
            cmd.Parameters.AddWithValue("@tutorEmail", Email.Text);
            isTutor = cmd.ExecuteScalar() as string;
            // get student
            cmd = new SqlCommand("select studId from Students where studEmail = @studEmail", connection);
            cmd.Parameters.AddWithValue("@studEmail", Email.Text);
            isStudent = cmd.ExecuteScalar() as string;

            connection.Close();

            // direct to respective pages
            if (isTutor != null) {
                // set this session to this user
                Session["user"] = isTutor;
                Session["auth"] = "Tutor";
                Response.Redirect("~/Tutor/Tutor.aspx");
            } else if (isStudent != null) {
                Session["user"] = isStudent;
                Session["auth"] = "Student";
                Response.Redirect("~/Student/Student.aspx");
            } else {
                // remove this and replace with error
                Response.Redirect("~/Login.aspx");
                // UNDONE sign in fail and display error
            }
        }

        /** TODO    a function to toggle textmode of password textfield
                    password recovery asp
                    add model in Models Folder **/
    }

}