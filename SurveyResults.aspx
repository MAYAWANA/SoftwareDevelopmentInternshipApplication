<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SurveyResults.aspx.cs" Inherits="SoftwareDevelopmentInternshipApplication.SurveyResults" %>

<<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Survey Results</title>
    <link href="StyleSheet2.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <h2>Survey Results</h2>
        <asp:Panel ID="pnlResults" runat="server" Visible="false">
            <div class="result-item">
                <span class="label">Total Surveys Completed:</span>
                <span class="value"><asp:Label ID="lblTotalSurveys" runat="server" /></span>
            </div>
            <div class="result-item">
                <span class="label">Average Age:</span>
                <span class="value"><asp:Label ID="lblAverageAge" runat="server" /></span>
            </div>
            <div class="result-item">
                <span class="label">Oldest Participant:</span>
                <span class="value"><asp:Label ID="lblOldestAge" runat="server" /></span>
            </div>
            <div class="result-item">
                <span class="label">Youngest Participant:</span>
                <span class="value"><asp:Label ID="lblYoungestAge" runat="server" /></span>
            </div>
            <div class="result-item">
                <span class="label">Percentage of People Who Like Pizza:</span>
                <span class="value"><asp:Label ID="lblPizzaPercentage" runat="server" />%</span>
            </div>
            <div class="result-item">
                <span class="label">Percentage of People Who Like Pasta:</span>
                <span class="value"><asp:Label ID="lblPastaPercentage" runat="server" />%</span>
            </div>
            <div class="result-item">
                <span class="label">Percentage of People Who Like Pap and Wors:</span>
                <span class="value"><asp:Label ID="lblPapWorsPercentage" runat="server" />%</span>
            </div>
            <div class="result-item">
                <span class="label">Average Rating for "Like to Eat Out":</span>
                <span class="value"><asp:Label ID="lblAvgEatOutRating" runat="server" /></span>
            </div>
            <div class="result-item">
                <span class="label">Average Rating for "Like to Watch Movies":</span>
                <span class="value"><asp:Label ID="lblAvgWatchMoviesRating" runat="server" /></span>
            </div>
            <div class="result-item">
                <span class="label">Average Rating for "Like to Watch TV":</span>
                <span class="value"><asp:Label ID="lblAvgWatchTVRating" runat="server" /></span>
            </div>
            <div class="result-item">
                <span class="label">Average Rating for "Like to Listen to Radio":</span>
                <span class="value"><asp:Label ID="lblAvgListenRadioRating" runat="server" /></span>
            </div>
        </asp:Panel>

        <asp:Label ID="lblNoData" runat="server" CssClass="no-data" Visible="false" Text="No Surveys Available." />
        <a href="SurveyReport.aspx">View Detailed Report Results</a>


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