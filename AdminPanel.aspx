<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminPanel.aspx.cs" Inherits="BookMyShow.AdminPanel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Panel</title>
    <link rel="stylesheet" href="Style/admin.css">
</head>
<body>
    <div class="container">
        <div class="sidebar">
          <div class="menu">
            <div class="menu-option"><a href="#">Users</a></div>
            <div class="menu-option"><a href="#">Manage Theatre</a></div>
            <div class="menu-option"><a href="#">Manage Movies</a></div>
            <div class="menu-option"><a href="#">Manage Shows</a></div>
            <div class="menu-option"><a href="#" class="settings">Settings</a></div>
          </div>
        </div>
        <div class="main-content">
          <div class="welcome">
            <h2>Welcome, Admin!</h2>
            <p>Here you can manage all aspects of BookMyShow.</p>
          </div>
          <div class="info">
            <h3>About BookMyShow</h3>
            <p>BookMyShow is India's leading entertainment destination. With millions of users, we strive to provide the best movie and event booking experience.</p>
          </div>
        </div>
      </div>
</body>
</html>
