<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SurveyReport.aspx.cs" Inherits="SoftwareDevelopmentInternshipApplication.SurveyReport" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Survey Report</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    
    <link href="StyleSheet3.css" rel="stylesheet" />
    <a href="Landing.aspx">Back To Home</a>

    
</head>
<body>
    <form id="form1" runat="server">
        <h2>Survey Data</h2>
        <asp:GridView ID="gvSurveyData" runat="server" AutoGenerateColumns="true" CssClass="gridview" />

        <h2>Average Ratings Chart</h2>
        <canvas id="ratingsChart" width="600" height="400"></canvas>
    </form>
    <!--Start of Tawk.to Script-->
<script type="text/javascript">
var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
(function(){
var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
s1.async=true;
s1.src='https://embed.tawk.to/683897aaf0b8b1190b1290b8/1iseh0tem';
s1.charset='UTF-8';
s1.setAttribute('crossorigin','*');
s0.parentNode.insertBefore(s1,s0);
})();
</script>
<!--End of Tawk.to Script-->
</body>
</html>
