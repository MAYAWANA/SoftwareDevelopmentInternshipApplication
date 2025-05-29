using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace SoftwareDevelopmentInternshipApplication
{
    public partial class SurveyReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadSurveyData();
                LoadAverageRatingsChart();
            }
        }

        private void LoadSurveyData()
        {
            string connectionString = @"Server=DESKTOP-PIDNR9H\MSSQLSERVER2;Database=SurveyAppDB;Trusted_Connection=True;";
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT Name, Age, Email, FavoriteFoods, Rating1, Rating2, Rating3, Rating4 FROM Surveys";
                SqlDataAdapter adapter = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                gvSurveyData.DataSource = dt;
                gvSurveyData.DataBind();
            }
        }

        private void LoadAverageRatingsChart()
        {
            string connectionString = @"Server=DESKTOP-PIDNR9H\MSSQLSERVER2;Database=SurveyAppDB;Trusted_Connection=True;";
            double avg1 = 0, avg2 = 0, avg3 = 0, avg4 = 0;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"
                    SELECT 
                        AVG(CAST(Rating1 AS FLOAT)) AS AvgRating1,
                        AVG(CAST(Rating2 AS FLOAT)) AS AvgRating2,
                        AVG(CAST(Rating3 AS FLOAT)) AS AvgRating3,
                        AVG(CAST(Rating4 AS FLOAT)) AS AvgRating4
                    FROM Surveys";
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    avg1 = Convert.ToDouble(reader["AvgRating1"]);
                    avg2 = Convert.ToDouble(reader["AvgRating2"]);
                    avg3 = Convert.ToDouble(reader["AvgRating3"]);
                    avg4 = Convert.ToDouble(reader["AvgRating4"]);
                }
            }

            string script = $@"
                <script>
                    const ctx = document.getElementById('ratingsChart').getContext('2d');
                    new Chart(ctx, {{
                        type: 'bar',
                        data: {{
                            labels: ['Eat Out', 'Watch Movies', 'Watch TV', 'Listen to Radio'],
                            datasets: [{{
                                label: 'Average Ratings',
                                data: [{avg1:F2}, {avg2:F2}, {avg3:F2}, {avg4:F2}],
                                backgroundColor: [
                                    'rgba(46, 125, 50, 0.7)',
                                    'rgba(76, 175, 80, 0.7)',
                                    'rgba(129, 199, 132, 0.7)',
                                    'rgba(165, 214, 167, 0.7)'
                                ],
                                borderColor: [
                                    'rgba(46, 125, 50, 1)',
                                    'rgba(76, 175, 80, 1)',
                                    'rgba(129, 199, 132, 1)',
                                    'rgba(165, 214, 167, 1)'
                                ],
                                borderWidth: 1
                            }}]
                        }},
                        options: {{
                            scales: {{
                                y: {{
                                    beginAtZero: true,
                                    max: 5
                                }}
                            }}
                        }}
                    }});
                </script>";

            ClientScript.RegisterStartupScript(this.GetType(), "renderChart", script, false);
        }
    }
}
