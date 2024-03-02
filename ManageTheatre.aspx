<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageTheatre.aspx.cs" Inherits="BookMyShow.ManageTheatre" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Theatre</title>
    <link rel="stylesheet" href="Style/admin.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="sidebar">
              <div class="menu">
                <div class="menu-option"><a href="ManageUsers.aspx">Users</a></div>
                <div class="menu-option target"><a href="ManageTheatre.aspx">Manage Theatre</a></div>
                <div class="menu-option"><a href="ManageMovies.aspx">Manage Movies</a></div>
                <div class="menu-option"><a href="ManageShows.aspx">Manage Shows</a></div>
                <div class="menu-option"><a href="AdminPanel.aspx" class="settings">Admin 📱</a></div>
              </div>
            </div>
            <div class="main-content">
              <div class="form">
                <h2>Manage Theatre</h2>
                <div class="form-group">
                  <asp:Label ID="theatreNameLB" runat="server" class="label" Text="Theatre name:"></asp:Label>
                  <asp:TextBox ID="theatreNameTxt" class="input" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                  <asp:Label ID="locationLB" runat="server" class="label" Text="Location:"></asp:Label>
                  <asp:DropDownList ID="locationDDL" runat="server" class="input"></asp:DropDownList>
                </div>
                <div class="form-group">
                  <asp:Label ID="totalSeatsLB" runat="server" class="label" Text="Total Seats:"></asp:Label>
                  <asp:TextBox ID="totalSeatsTxt" class="input" runat="server" TextMode="Number"></asp:TextBox>
                </div>
                <div class="btns">
                    <asp:Button ID="submitBtn" runat="server" Text="Submit" class="button" />
                    <asp:Button ID="clearBtn" runat="server" Text="Clear" class="button" />
                    <asp:Button ID="editBtn" runat="server" Text="Edit" class="button" />
                </div>
              </div>
            </div>
            <div>
                <asp:GridView ID="dgvTheatre" runat="server"></asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
