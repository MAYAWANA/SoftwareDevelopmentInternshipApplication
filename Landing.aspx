<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Landing.aspx.cs" Inherits="SoftwareDevelopmentInternshipApplication.Landing" %>

<<!DOCTYPE html>
<html>
<head runat="server">
    <title>Welcome | Survey App</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/5/w3.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="StyleSheet4.css" rel="stylesheet" />
</head>
<body>


<div class="bgimg-1 w3-display-container w3-opacity-min">
    <div class="w3-display-middle hero-text w3-center w3-animate-opacity">
        <h1 class="w3-xxxlarge w3-text-white">Welcome to Ame Mayawana's Survey App</h1>
        <p class="w3-large w3-text-white">
            This web-based survey application was built to collect, analyze, and present data efficiently.<br />
            It includes features like auto-age calculation, input validation,chart representation and a secure backend.
        </p>
        <a href="SurveyForm.aspx" class="w3-button w3-white w3-padding-large w3-margin-top">Start Survey</a>
    </div>
</div>

<!-- About Section -->
<div class="w3-content w3-container w3-padding-64" id="about">
    <h2 class="w3-center">About This Project</h2>
    <p>
        This survey app was developed during my software development internship. It's built using ASP.NET Web Forms and includes JavaScript-powered form validation and logic.
        The system captures essential information like name, date of birth, gender, and calculates age dynamically. All data is securely stored and ready for further analysis.
    </p>

    <h2 class="w3-center w3-padding-32">About Me</h2>
    <div class="w3-row">
        <div class="w3-col m6 w3-center w3-padding-large">
            <p><b><i class="fa fa-user w3-margin-right"></i>Mr Ame Mayawana</b></p>
            <img src="Images/Prof%20Grd.jpg"class="w3-round w3-image w3-opacity w3-hover-opacity-off" alt="Me" width="7000"/>
        </div> 
        </div>
        <div class="w3-col m6 w3-padding-large">
            <p>
                I’m seeking a software development internship with a Bachelor of Commerce in Information Systems from the University of Fort Hare. 
                My skills include full-stack development, user experience design, and database management. I am passionate 
                about creating simple, efficient applications that solve real-world problems. This survey app is one example 
                of my ability to build functional and user-friendly web tools.
            </p>
        </div>
    </div>

    <div class="w3-center w3-padding-32">
        <a href="SurveyResults.aspx" class="w3-button w3-black w3-large">See Survey Results</a>
    </div>
</div>


<footer class="w3-center w3-black w3-padding-64 w3-opacity w3-hover-opacity-off">
    <a href="#home" class="w3-button w3-light-grey"><i class="fa fa-arrow-up w3-margin-right"></i>To the top</a>
    <div class="w3-xlarge w3-section">
        <i class="fa fa-facebook-official w3-hover-opacity"></i>
        <i class="fa fa-instagram w3-hover-opacity"></i>
        <i class="fa fa-linkedin w3-hover-opacity"></i>
    </div>
    <p>Developed by Ame Mayawana &copy; 2025</p>
</footer>
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
