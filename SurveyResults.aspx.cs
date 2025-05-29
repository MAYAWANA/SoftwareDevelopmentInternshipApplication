using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace SoftwareDevelopmentInternshipApplication
{
	public partial class SurveyResults : System.Web.UI.Page
	{
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadSurveyResults();
            }
        }

        private void LoadSurveyResults()
        {
            string connectionString = @"Server=DESKTOP-PIDNR9H\MSSQLSERVER2;Database=SurveyAppDB;Trusted_Connection=True;";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM Surveys";
                SqlDataAdapter adapter = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                if (dt.Rows.Count == 0)
                {
                    lblNoData.Visible = true;
                    pnlResults.Visible = false;
                    return;
                }

                pnlResults.Visible = true;
                lblNoData.Visible = false;

                int totalSurveys = dt.Rows.Count;
                int totalAge = 0;
                int oldest = int.MinValue;
                int youngest = int.MaxValue;
                int totalRating1 = 0, totalRating2 = 0, totalRating3 = 0, totalRating4 = 0;
                int pizzaCount = 0, pastaCount = 0, papWorsCount = 0;

                foreach (DataRow row in dt.Rows)
                {
                    int age = Convert.ToInt32(row["Age"]);
                    totalAge += age;
                    if (age > oldest) oldest = age;
                    if (age < youngest) youngest = age;

                    totalRating1 += Convert.ToInt32(row["Rating1"]);
                    totalRating2 += Convert.ToInt32(row["Rating2"]);
                    totalRating3 += Convert.ToInt32(row["Rating3"]);
                    totalRating4 += Convert.ToInt32(row["Rating4"]);

                    string foods = row["FavoriteFoods"].ToString().ToLower();
                    if (foods.Contains("pizza")) pizzaCount++;
                    if (foods.Contains("pasta")) pastaCount++;
                    if (foods.Contains("pap and wors")) papWorsCount++;
                }

                lblTotalSurveys.Text = totalSurveys.ToString();
                lblAverageAge.Text = (totalAge / (double)totalSurveys).ToString("0.0");
                lblOldestAge.Text = oldest.ToString();
                lblYoungestAge.Text = youngest.ToString();
                lblPizzaPercentage.Text = ((pizzaCount * 100.0) / totalSurveys).ToString("0.0");
                lblPastaPercentage.Text = ((pastaCount * 100.0) / totalSurveys).ToString("0.0");
                lblPapWorsPercentage.Text = ((papWorsCount * 100.0) / totalSurveys).ToString("0.0");

                lblAvgEatOutRating.Text = (totalRating1 / (double)totalSurveys).ToString("0.0");
                lblAvgWatchMoviesRating.Text = (totalRating2 / (double)totalSurveys).ToString("0.0");
                lblAvgWatchTVRating.Text = (totalRating3 / (double)totalSurveys).ToString("0.0");
                lblAvgListenRadioRating.Text = (totalRating4 / (double)totalSurveys).ToString("0.0");
            }
        }
    }
}