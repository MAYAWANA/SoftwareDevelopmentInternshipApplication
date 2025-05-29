# SurveyApp

SurveyApp is an ASP.NET Web Forms application designed to collect and analyze user survey data efficiently. It allows users to submit personal preferences and ratings, stores data in a Microsoft SQL Server database, and provides visual insights via interactive charts and a reporting dashboard.

## Features

- User-friendly survey form with client-side validation
- Automatic age calculation from date of birth
- Data storage using Microsoft SQL Server
- GridView display of survey submissions
- Chart.js visualization of average survey ratings
- SweetAlert pop-ups for form feedback
- Chatbot integration for user assistance

## Technologies Used

- ASP.NET Web Forms (C#)
- Microsoft SQL Server
- Chart.js
- SweetAlert
- HTML/CSS/JavaScript

## Getting Started

1. Clone the repository.
2. Update the connection string in `Web.config` to match your SQL Server instance.
3. Run the SQL script to create the `SurveyAppDB` database and `Surveys` table.
4. Launch the project in Visual Studio.

## Pages Overview

- `SurveyForm.aspx`: User survey submission form
- `SurveyReport.aspx`: Admin page to view results and charts
- `SurveyResults.aspx`: Summary or redirect after submission

## License

This project is for academic and demonstration purposes.
