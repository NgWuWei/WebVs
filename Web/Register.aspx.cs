using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web {
    public partial class Register : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {

        }

        protected void BirthDateCalendar_SelectionChanged(object sender, EventArgs e) {
            // get values from content template container
            TextBox calTextBox = (TextBox)this.CreateUserWizardStep1.ContentTemplateContainer.FindControl("BirthDate");
            Calendar calendar = (Calendar)this.CreateUserWizardStep1.ContentTemplateContainer.FindControl("BirthDateCalendar");
            calTextBox.Text = calendar.SelectedDate.ToString("dd/MM/yyyy");
        }

        protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e) {
            // error when creating account
            Literal errMsg = (Literal)this.CreateUserWizardStep1.ContentTemplateContainer.FindControl("ErrorMessage");
            
            // initialize register value
            TextBox regName = (TextBox)this.CreateUserWizardStep1.ContentTemplateContainer.FindControl("UserName");
            TextBox regEmail = (TextBox)this.CreateUserWizardStep1.ContentTemplateContainer.FindControl("Email");
            TextBox regPass = (TextBox)this.CreateUserWizardStep1.ContentTemplateContainer.FindControl("Password");
            RadioButtonList regGender = (RadioButtonList)this.CreateUserWizardStep1.ContentTemplateContainer.FindControl("Gender");
            TextBox regBirthDate = (TextBox)this.CreateUserWizardStep1.ContentTemplateContainer.FindControl("BirthDate");
            DropDownList regDept = (DropDownList)this.CreateUserWizardStep1.ContentTemplateContainer.FindControl("Department");
            
            // open connection for database
            try {
                string str = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                //string str = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=D:\\GitHub\\Web\\Web\\App_Data\\Database1.mdf;Integrated Security=True";
                SqlConnection connection = new SqlConnection(str);
                connection.Open();

                // check if email exists
                SqlCommand cmd = new SqlCommand("select studEmail from Students where studEmail = '" + regEmail.Text+"'", connection);
                if (regEmail.Text == cmd.ExecuteScalar() as string) {
                    errMsg.Text = "This email is already been used by an account!\n";
                    throw new ArgumentException();
                }

                // count table and create custom id out of birthdate eg 19 00000
                cmd.CommandText = "select count(*) from students";
                int regId = Math.Abs(Int32.Parse(regBirthDate.Text.Substring(8, 2)) * 100000 + Convert.ToInt32(cmd.ExecuteScalar()));

                // insert data
                cmd.CommandText = "SET IDENTITY_INSERT dbo.Students ON;"+
                                  "insert into Students (studId, studName, studEmail, studPass, studGender, studBirthdate, studGrade) " +
                                  "values (@id, @name, @email, @pass, @gender, @birthdate, NULL);"+
                                  "SET IDENTITY_INSERT dbo.Students ON;";
                // pass in parameters
                cmd.Parameters.AddWithValue("@id", regId);
                cmd.Parameters.AddWithValue("@name", regName.Text);
                cmd.Parameters.AddWithValue("@email", regEmail.Text);
                cmd.Parameters.AddWithValue("@pass", regPass.Text);
                cmd.Parameters.AddWithValue("@gender", regGender.SelectedValue);
                cmd.Parameters.AddWithValue("@birthdate", regBirthDate.Text);
                //cmd.Parameters.AddWithValue("@dept", regDept.SelectedValue);      // TODO LINK DEPARTMENT ID , LINK DATABASE WITH DROPDOWNLIST
                cmd.ExecuteNonQuery();

                // close database
                connection.Close();
            } catch {
                errMsg.Text += "Error occur! Reload the page and try again";
            }
            /**TODO 1. force user to enter only integer in asp:textbox
                   2. set new user into database
                   3. for now only registers student, will add label to identify tutor
                   4. check from database 
                   5. either do security question or no 
                   6. if student is removed, do not remove database but add status as left**/
            // TODO recheck Register.aspx.cs
        }
    }
}