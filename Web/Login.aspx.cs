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
            if (Session["user"] != null)
                Response.Redirect("~/Mainpage.aspx");
        }

        protected void LoginButton_Click(object sender, EventArgs e) {
            // reset both to empty
            string isTutor = "", isStudent = "";
            string userName = "";

            // match user ID to see if valid
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                // open connection
                connection.Open();

                // get tutor
                SqlCommand cmd = new SqlCommand("select tutorID, tutorName from Tutors where tutorEmail = @tutorEmail and tutorPass = @tutorPass", connection);
                cmd.Parameters.AddWithValue("@tutorEmail", Email.Text);
                cmd.Parameters.AddWithValue("@tutorPass", Password.Text);
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        isTutor = reader["tutorID"].ToString();
                        userName = reader["tutorName"].ToString();
                    }
                }
                // clear var
                cmd.Parameters.Clear();

                // if its not tutor then search student
                if (isTutor == null || isTutor == "")
                {
                    // get student
                    cmd = new SqlCommand("select studId, studName from Students where studEmail = @studEmail and studPass = @studPass", connection);
                    cmd.Parameters.AddWithValue("@studEmail", Email.Text);
                    cmd.Parameters.AddWithValue("@studPass", Password.Text);
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            isStudent = reader["studID"].ToString();
                            userName = reader["studName"].ToString();
                        }
                    }
                }
                cmd.Parameters.Clear();
            }

            // direct to respective pages
            if (isTutor != null && isTutor != "") {
                // set this session to this user
                Session["user"] = isTutor;
                Session["auth"] = "Tutor";
                Session["name"] = userName;
                Response.Redirect("~/Tutor/Tutor.aspx");
            } else if (isStudent != null && isStudent != "") {
                Session["user"] = isStudent;
                Session["auth"] = "Student";
                Session["name"] = userName;
                Response.Redirect("~/Student/Student.aspx");
            } else {
                Response.Redirect("~/Login.aspx", false);
                // UNDONE sign in fail and display error
            }
        }

        /** TODO    a function to toggle textmode of password textfield
                    password recovery asp
                    add model in Models Folder **/
    }

}