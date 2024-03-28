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
    <style>
    .success {
        font-size: 12px;
        color: green;
    }
    .error {
        font-size: 12px;
        color: red;
    }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="admin-login">
            <div class="main">
                <h2>User Register</h2>
                <div class="form-group">
                    <asp:Label ID="usernameLB" runat="server" class="label" Text="Username:"></asp:Label>
                    <asp:TextBox ID="usernameTxt" class="input" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="usernameTxt" CssClass="error" Display="Dynamic" ErrorMessage="Username is required"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <asp:Label ID="emailLB" runat="server" class="label" Text="Email:"></asp:Label>
                    <asp:TextBox ID="emailTxt" class="input" runat="server" TextMode="Email"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="emailTxt" CssClass="error" Display="Dynamic" ErrorMessage="Email is not valid" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </div>
                <div class="form-group">
                    <asp:Label ID="passwordLB" runat="server" class="label" Text="Password:"></asp:Label>
                    <asp:TextBox ID="passwordTxt" class="input" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="passwordTxt" CssClass="error" Display="Dynamic" ErrorMessage="password is required"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <asp:Label ID="profileLB" runat="server" class="label" Text="Profile:"></asp:Label>
                    
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                    
                </div>
                
                
                <div class="form-group">
                    <asp:Label ID="locationLB" runat="server" class="label" Text="Location:"></asp:Label>
                    <asp:DropDownList ID="locationDDL" runat="server" class="input" AutoPostBack="True">
                        <asp:ListItem>Surat</asp:ListItem>
                        <asp:ListItem>Pune</asp:ListItem>
                        <asp:ListItem>Mumbai</asp:ListItem>
                        <asp:ListItem>Ahemdabad</asp:ListItem>
                        <asp:ListItem>Delhi</asp:ListItem>
                        <asp:ListItem>Chennai</asp:ListItem>
                        <asp:ListItem>Kolkata</asp:ListItem>
                    </asp:DropDownList>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="error" />
                </div>
                <asp:Label ID="successLB" runat="server" Text="" CssClass="success"></asp:Label>
                <asp:Label ID="errorLB" runat="server" Text="" CssClass="error"></asp:Label>
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
