<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageUsers.aspx.cs" Inherits="BookMyShow.ManageUsers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Users</title>
    <link rel="stylesheet" href="Style/admin.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
    <div class="sidebar">
      <div class="menu">
        <div class="menu-option target"><a href="ManageUsers.aspx">Users</a></div>
        <div class="menu-option"><a href="ManageTheatre.aspx">Manage Theatre</a></div>
        <div class="menu-option"><a href="ManageMovies.aspx">Manage Movies</a></div>
        <div class="menu-option"><a href="ManageShows.aspx">Manage Shows</a></div>
        <div class="menu-option"><a href="AdminPanel.aspx" class="settings">Admin 📱</a></div>
      </div>
    </div>
    <div class="main-content">
      <div class="form">
        
      </div>
    </div>
    <div>
        <asp:GridView ID="dgvUsers" runat="server"></asp:GridView>
    </div>
</div>
    </form>
</body>
</html>
