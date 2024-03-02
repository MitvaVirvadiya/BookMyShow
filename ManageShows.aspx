<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageShows.aspx.cs" Inherits="BookMyShow.ManageShows" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Shows</title>
    <link rel="stylesheet" href="Style/admin.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
    <div class="sidebar">
      <div class="menu">
        <div class="menu-option"><a href="ManageUsers.aspx">Users</a></div>
        <div class="menu-option"><a href="ManageTheatre.aspx">Manage Theatre</a></div>
        <div class="menu-option"><a href="ManageMovies.aspx">Manage Movies</a></div>
        <div class="menu-option target"><a href="ManageShows.aspx">Manage Shows</a></div>
        <div class="menu-option"><a href="AdminPanel.aspx" class="settings">Admin 📱</a></div>
      </div>
    </div>
    <div class="main-content">
      <div class="form">
        <h2>Manage Shows</h2>
        <div class="form-group">
          <asp:Label ID="movieDDL" runat="server" class="label" Text="Movie:"></asp:Label>
          <asp:DropDownList ID="movieDropDown" runat="server" class="input"></asp:DropDownList>
        </div>
        <div class="form-group">
          <asp:Label ID="theatreDDL" runat="server" class="label" Text="Theatre:"></asp:Label>
          <asp:DropDownList ID="theatreDropDown" runat="server" class="input"></asp:DropDownList>
        </div>
        <div class="form-group">
          <asp:Label ID="showTimeLB" runat="server" class="label" Text="Show Time:"></asp:Label>
          <asp:TextBox ID="showTimeTxt" class="input" runat="server" TextMode="Date"></asp:TextBox>
        </div>
        <div class="form-group">
          <asp:Label ID="availableSeatsLB" runat="server" class="label" Text="Available Seats:"></asp:Label>
          <asp:TextBox ID="availableSeatsTxt" class="input" runat="server" TextMode="Number"></asp:TextBox>
        </div>
        <div class="btns">
            <asp:Button ID="submitBtn" runat="server" Text="Submit" class="button" />
            <asp:Button ID="clearBtn" runat="server" Text="Clear" class="button" />
            <asp:Button ID="editBtn" runat="server" Text="Edit" class="button" />
        </div>
      </div>
    </div>

    <div>
        <asp:GridView ID="dgvShows" runat="server"></asp:GridView>
    </div>
</div>
    </form>
</body>
</html>
