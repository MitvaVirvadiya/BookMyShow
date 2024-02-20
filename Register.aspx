<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="BookMyShow.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Signup</title>
    <link rel="stylesheet" href="Style/login.css" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
      crossorigin="anonymous"
    />
</head>
<body>
    <form id="form1" runat="server">
        <div class="admin-login">
            <div class="main">
                <h2>User Register</h2>
                <div class="form-group">
                    <asp:Label ID="usernameLB" runat="server" class="label" Text="Username:"></asp:Label>
                    <asp:TextBox ID="usernameTxt" class="input" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="emailLB" runat="server" class="label" Text="Email:"></asp:Label>
                    <asp:TextBox ID="emailTxt" class="input" runat="server" TextMode="Email"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="passwordLB" runat="server" class="label" Text="Password:"></asp:Label>
                    <asp:TextBox ID="passwordTxt" class="input" runat="server" TextMode="Password"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="profileLB" runat="server" class="label" Text="Profile:"></asp:Label>
                    <!-- Assuming "profile" is a dropdown -->
                    <asp:DropDownList ID="profileDDL" runat="server" class="input"></asp:DropDownList>
                </div>
                <div class="form-group">
                    <asp:Label ID="genderLB" runat="server" class="label" Text="Gender:"></asp:Label>
                    <!-- Assuming "gender" is a radio button list -->
                    <asp:RadioButtonList ID="genderRBL" runat="server" class="input" RepeatDirection="Horizontal">
                        <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                        <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                    </asp:RadioButtonList>
                </div>
                <div class="form-group">
                    <asp:Label ID="ageLB" runat="server" class="label" Text="Age:"></asp:Label>
                    <asp:TextBox ID="ageTxt" class="input" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="locationLB" runat="server" class="label" Text="Location:"></asp:Label>
                    <!-- Assuming "location" is a dropdown -->
                    <asp:DropDownList ID="locationDDL" runat="server" class="input"></asp:DropDownList>
                </div>
                <asp:Button ID="registerBtn" runat="server" Text="Register" class="button" OnClick="registerBtn_Click" />
            </div>
        </div>
        
    </form>
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"
      ></script>
</body>
</html>
