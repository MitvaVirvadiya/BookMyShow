<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminPanel.aspx.cs" Inherits="BookMyShow.AdminPanel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Panel</title>
    <link rel="stylesheet" href="Style/admin.css"/>
</head>
<body>
        <form id="form1" runat="server">

    <div class="container">
        <div class="sidebar">
          <div class="menu">
            <div class="menu-option"><a href="ManageUsers.aspx">Users</a></div>
            <div class="menu-option"><a href="ManageTheatre.aspx">Manage Theatre</a></div>
            <div class="menu-option"><a href="ManageMovies.aspx">Manage Movies</a></div>
            <div class="menu-option"><a href="ManageShows.aspx">Manage Shows</a></div>
            <div class="menu-option target"><a href="AdminPanel.aspx" class="settings">Admin 📱</a></div>
          </div>
        </div>
        <div class="main-content">
          <div class="welcome">
            <h2>Welcome, Admin!</h2>
            <p><asp:Label ID="emailTxt" runat="server" Text=""></asp:Label></p>
            <p>Here you can manage all aspects of BookMyShow.</p>
          </div>
          <div class="info">
            <h3>About BookMyShow</h3>
            <p>BookMyShow is India's leading entertainment destination. With millions of users, we strive to provide the best movie and event booking experience.</p>
          </div>
            <div class="btns">
                <asp:Button ID="logoutBtn" runat="server" Text="Logout" class="button" OnClick="logoutBtn_Click" />
            </div>
        </div>
      </div>
            </form>
</body>
</html>
