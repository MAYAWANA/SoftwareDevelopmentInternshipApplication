<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SurveyForm.aspx.cs" Inherits="SoftwareDevelopmentInternshipApplication.SurveyForm" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Survey Form</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link href="StyleSheet1.css" rel="stylesheet" />
    <script type="text/javascript">
        function calculateAgeFromDOB() {
            var dateInput = document.getElementById('<%= txtDate.ClientID %>').value;
            var ageField = document.getElementById('<%= txtAge.ClientID %>');

            if (dateInput) {
                var dob = new Date(dateInput);
                var today = new Date();
                var age = today.getFullYear() - dob.getFullYear();
                var monthDiff = today.getMonth() - dob.getMonth();
                if (monthDiff < 0 || (monthDiff === 0 && today.getDate() < dob.getDate())) {
                    age--;
                }

                if (!isNaN(age)) {
                    ageField.value = age;
                } else {
                    ageField.value = "";
                }
            }
        }

        function validateForm() {
            calculateAgeFromDOB();

            var name = document.getElementById('<%= txtName.ClientID %>').value.trim();
            var age = document.getElementById('<%= txtAge.ClientID %>').value.trim();
            var email = document.getElementById('<%= txtEmail.ClientID %>').value.trim();
            var contact = document.getElementById('<%= txtContact.ClientID %>').value.trim();
            var date = document.getElementById('<%= txtDate.ClientID %>').value.trim();

            if (!name || !age || !email || !contact || !date) {
                Swal.fire("Validation Error", "Please complete all text fields.", "warning");
                return false;
            }

            var ageNum = parseInt(age);
            if (isNaN(ageNum) || ageNum < 5 || ageNum > 120) {
                Swal.fire("Validation Error", "Age must be between 5 and 120.", "warning");
                return false;
            }

            var ratingIds = ['<%= rblRating1.ClientID %>', '<%= rblRating2.ClientID %>', '<%= rblRating3.ClientID %>', '<%= rblRating4.ClientID %>'];
            for (var i = 0; i < ratingIds.length; i++) {
                var group = document.getElementById(ratingIds[i]);
                var inputs = group.getElementsByTagName("input");
                var selected = false;
                for (var j = 0; j < inputs.length; j++) {
                    if (inputs[j].checked) {
                        selected = true;
                        break;
                    }
                }
                if (!selected) {
                    Swal.fire("Validation Error", "Please select a rating for each question.", "warning");
                    return false;
                }
            }

            return true;
        }

        window.onload = function () {
            document.getElementById('<%= txtDate.ClientID %>').addEventListener('change', calculateAgeFromDOB);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server" onsubmit="return validateForm();">
        <a href="SurveyResults.aspx">View Survey Results</a>

        <h2>Fill Out Survey</h2>

        <label>Name:</label>
        <asp:TextBox ID="txtName" runat="server" />


        <label>Age:</label>
<asp:TextBox ID="txtAge" runat="server" TextMode="Number" ReadOnly="true" placeholder="Skip Here as Auto-calculated from Date of Birth" />

        <label>Email:</label>
        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" />

        <label>Contact Number:</label>
        <asp:TextBox ID="txtContact" runat="server" TextMode="Phone" />

        <label>Date of Birth:</label>
        <asp:TextBox ID="txtDate" runat="server" TextMode="Date" />

        <label>Favourite Food:</label>
        <div class="checkbox-list">
            <asp:CheckBoxList ID="chkFoods" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem>Pizza</asp:ListItem>
                <asp:ListItem>Pasta</asp:ListItem>
                <asp:ListItem>Pap and Wors</asp:ListItem>
            </asp:CheckBoxList>
        </div>

        <div class="rating-group">
            <label>Do you like to eat out? Rate your level of agreement from a Scale of 1-5</label>
            <asp:RadioButtonList ID="rblRating1" runat="server" CssClass="rbl" RepeatDirection="Horizontal">
                <asp:ListItem Value="1" Text="1" />
                <asp:ListItem Value="2" Text="2" />
                <asp:ListItem Value="3" Text="3" />
                <asp:ListItem Value="4" Text="4" />
                <asp:ListItem Value="5" Text="5" />
            </asp:RadioButtonList>
        </div>

        <div class="rating-group">
            <label>Do you like to watch movies? Rate your level of agreement from a Scale of 1-5</label>
            <asp:RadioButtonList ID="rblRating2" runat="server" CssClass="rbl" RepeatDirection="Horizontal">
                <asp:ListItem Value="1" Text="1" />
                <asp:ListItem Value="2" Text="2" />
                <asp:ListItem Value="3" Text="3" />
                <asp:ListItem Value="4" Text="4" />
                <asp:ListItem Value="5" Text="5" />
            </asp:RadioButtonList>
        </div>

        <div class="rating-group">
            <label>Do you like to watch TV? Rate your level of agreement from a Scale of 1-5</label>
            <asp:RadioButtonList ID="rblRating3" runat="server" CssClass="rbl" RepeatDirection="Horizontal">
                <asp:ListItem Value="1" Text="1" />
                <asp:ListItem Value="2" Text="2" />
                <asp:ListItem Value="3" Text="3" />
                <asp:ListItem Value="4" Text="4" />
                <asp:ListItem Value="5" Text="5" />
            </asp:RadioButtonList>
        </div>

        <div class="rating-group">
            <label>Do you like to listen to radio? Rate your level of agreement from a Scale of 1-5</label>
            <asp:RadioButtonList ID="rblRating4" runat="server" CssClass="rbl" RepeatDirection="Horizontal">
                <asp:ListItem Value="1" Text="1" />
                <asp:ListItem Value="2" Text="2" />
                <asp:ListItem Value="3" Text="3" />
                <asp:ListItem Value="4" Text="4" />
                <asp:ListItem Value="5" Text="5" />
            </asp:RadioButtonList>
        </div>

        <asp:Button ID="btnSubmit" runat="server" Text="Submit Survey" CssClass="btn-submit" OnClick="btnSubmit_Click" />
        <asp:Label ID="lblMessage" runat="server" CssClass="message-label" /> 
        

    </form>
    <!--Start of Tawk.to Script-->
<script type="text/javascript">
    var Tawk_API = Tawk_API || {}, Tawk_LoadStart = new Date();
    (function () {
        var s1 = document.createElement("script"), s0 = document.getElementsByTagName("script")[0];
        s1.async = true;
        s1.src = 'https://embed.tawk.to/683897aaf0b8b1190b1290b8/1iseh0tem';
        s1.charset = 'UTF-8';
        s1.setAttribute('crossorigin', '*');
        s0.parentNode.insertBefore(s1, s0);
    })();
</script>
<!--End of Tawk.to Script-->
</body>
</html>
