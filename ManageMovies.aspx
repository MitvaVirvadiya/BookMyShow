<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageMovies.aspx.cs" Inherits="BookMyShow.ManageMovies" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Movies</title>
    <link rel="stylesheet" href="Style/admin.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
    <div class="sidebar">
      <div class="menu">
        <div class="menu-option"><a href="ManageUsers.aspx">Users</a></div>
        <div class="menu-option"><a href="ManageTheatre.aspx">Manage Theatre</a></div>
        <div class="menu-option target"><a href="ManageMovies.aspx">Manage Movies</a></div>
        <div class="menu-option"><a href="ManageShows.aspx">Manage Shows</a></div>
        <div class="menu-option"><a href="AdminPanel.aspx" class="settings">Admin 📱</a></div>
      </div>
    </div>
    <div class="main-content">
      <div class="form">
        <h2>Manage Movies</h2>
        <div class="form-group">
          <asp:Label ID="movieNameLB" runat="server" class="label" Text="Movie name:"></asp:Label>
          <asp:TextBox ID="movieNameTxt" class="input" runat="server"></asp:TextBox>
        </div>
        <div class="form-group">
          <asp:Label ID="descriptionLB" runat="server" class="label" Text="Description:"></asp:Label>
          <asp:TextBox ID="descriptionTxt" class="input" runat="server" TextMode="MultiLine"></asp:TextBox>
        </div>
        <div class="form-group">
          <asp:Label ID="releaseDateLB" runat="server" class="label" Text="Release Date:"></asp:Label>
          <asp:TextBox ID="releaseDateTxt" class="input" runat="server" TextMode="Date"></asp:TextBox>
        </div>
        <div class="form-group">
          <asp:Label ID="imageLB" runat="server" class="label" Text="Image:"></asp:Label>
          <asp:FileUpload ID="imageUpload" runat="server" />
        </div>
        <div class="form-group">
          <asp:Label ID="durationLB" runat="server" class="label" Text="Duration (minutes):"></asp:Label>
          <asp:TextBox ID="durationTxt" class="input" runat="server" TextMode="Number"></asp:TextBox>
        </div>

        <div class="form-group">
          <asp:Label ID="genreLB" runat="server" class="label" Text="Genre:"></asp:Label>
          <div class="checkbox-group space-grp">
            <asp:CheckBox ID="actionCB" runat="server" Text="Action" class="space"/>
            <asp:CheckBox ID="comedyCB" runat="server" Text="Comedy" class="space" />
            <!-- Add more genre checkboxes as needed -->
          </div>
        </div>

        <div class="form-group">
          <asp:Label ID="languageLB" runat="server" class="label" Text="Language:"></asp:Label>
          <div class="checkbox-group space-grp">
            <asp:CheckBox ID="englishCB" runat="server" Text="English" class="space" />
            <asp:CheckBox ID="hindiCB" runat="server" Text="Hindi" class="space" />
            <!-- Add more language checkboxes as needed -->
          </div>
        </div>

        <div class="form-group">
          <asp:Label ID="ratingLB" runat="server" class="label" Text="Rating (1-5):"></asp:Label>
          <div class="rating-options space-grp">
            <asp:RadioButton ID="rating1RB" runat="server" Text="1" GroupName="ratingGroup" class="space" />
            <asp:RadioButton ID="rating2RB" runat="server" Text="2" GroupName="ratingGroup" class="space" />
            <asp:RadioButton ID="rating3RB" runat="server" Text="3" GroupName="ratingGroup" class="space" />
            <asp:RadioButton ID="rating4RB" runat="server" Text="4" GroupName="ratingGroup" class="space" />
            <asp:RadioButton ID="rating5RB" runat="server" Text="5" GroupName="ratingGroup" class="space" />
          </div>
        </div>


        <div class="btns">
            <asp:Button ID="submitBtn" runat="server" Text="Submit" class="button" />
            <asp:Button ID="clearBtn" runat="server" Text="Clear" class="button" />
            <asp:Button ID="editBtn" runat="server" Text="Edit" class="button" />
        </div>
      </div>
    </div>

    <div>
        <asp:GridView ID="dgvMovies" runat="server"></asp:GridView>
    </div>
</div>
    </form>
</body>
</html>
