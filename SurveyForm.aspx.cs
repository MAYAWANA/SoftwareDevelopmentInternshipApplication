using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace SoftwareDevelopmentInternshipApplication
{
    public partial class SurveyForm : System.Web.UI.Page
    {
        private string connStr = @"Server=DESKTOP-PIDNR9H\MSSQLSERVER2;Database=SurveyAppDB;Trusted_Connection=True;";

        protected void Page_Load(object sender, EventArgs e)
        {
            lblMessage.Text = "";
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtName.Text) ||
                string.IsNullOrWhiteSpace(txtEmail.Text) ||
                string.IsNullOrWhiteSpace(txtContact.Text) ||
                string.IsNullOrWhiteSpace(txtDate.Text) ||
                chkFoods.SelectedItem == null ||
                rblRating1.SelectedItem == null ||
                rblRating2.SelectedItem == null ||
                rblRating3.SelectedItem == null ||
                rblRating4.SelectedItem == null)
            {
                ShowSweetAlert("Validation Error", "Please complete all fields and selections.", "warning");
                return;
            }

            if (!DateTime.TryParse(txtDate.Text, out DateTime dob))
            {
                ShowSweetAlert("Validation Error", "Please enter a valid date.", "warning");
                return;
            }

            int age = CalculateAge(dob);
            if (age < 5 || age > 120)
            {
                ShowSweetAlert("Validation Error", "Age must be between 5 and 120.", "warning");
                return;
            }

            txtAge.Text = age.ToString();

            string favoriteFoods = "";
            foreach (ListItem item in chkFoods.Items)
            {
                if (item.Selected)
                {
                    if (favoriteFoods.Length > 0)
                        favoriteFoods += ", ";
                    favoriteFoods += item.Text;
                }
            }

            string insertQuery = @"INSERT INTO Surveys 
                (Name, Age, Email, ContactNumber, DateSubmitted, FavoriteFoods, Rating1, Rating2, Rating3, Rating4)
                VALUES (@Name, @Age, @Email, @ContactNumber, @DateSubmitted, @FavoriteFoods, @Rating1, @Rating2, @Rating3, @Rating4)";

            try
            {
                using (SqlConnection conn = new SqlConnection(connStr))
                using (SqlCommand cmd = new SqlCommand(insertQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                    cmd.Parameters.AddWithValue("@Age", age);
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@ContactNumber", txtContact.Text.Trim());
                    cmd.Parameters.AddWithValue("@DateSubmitted", dob);
                    cmd.Parameters.AddWithValue("@FavoriteFoods", favoriteFoods);
                    cmd.Parameters.AddWithValue("@Rating1", int.Parse(rblRating1.SelectedValue));
                    cmd.Parameters.AddWithValue("@Rating2", int.Parse(rblRating2.SelectedValue));
                    cmd.Parameters.AddWithValue("@Rating3", int.Parse(rblRating3.SelectedValue));
                    cmd.Parameters.AddWithValue("@Rating4", int.Parse(rblRating4.SelectedValue));

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }

                ShowSweetAlertWithRedirect("Success", "Survey submitted successfully!", "success", "SurveyResults.aspx");
            }
            catch (Exception ex)
            {
                ShowSweetAlert("Error", "Error submitting survey: " + ex.Message, "error");
            }
        }

        private int CalculateAge(DateTime dob)
        {
            DateTime today = DateTime.Today;
            int age = today.Year - dob.Year;
            if (dob > today.AddYears(-age)) age--;
            return age;
        }

        private void ShowSweetAlert(string title, string message, string icon)
        {
            string script = $@"Swal.fire({{
                title: '{title}',
                text: '{message}',
                icon: '{icon}',
                confirmButtonText: 'OK'
            }});";
            ClientScript.RegisterStartupScript(this.GetType(), "sweetalert", script, true);
        }

        private void ShowSweetAlertWithRedirect(string title, string message, string icon, string redirectUrl)
        {
            string script = $@"Swal.fire({{
                title: '{title}',
                text: '{message}',
                icon: '{icon}',
                confirmButtonText: 'OK'
            }}).then((result) => {{
                if (result.isConfirmed) {{
                    window.location.href = '{redirectUrl}';
                }}
            }});";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "sweetalertRedirect", script, true);
        }
    }
}
