<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageMovies.aspx.cs" Inherits="BookMyShow.ManageMovies" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Movies</title>
    <link rel="stylesheet" href="Style/admin.css" />
    <style>
        .success {
            font-size: 12px;
            color: green;
        }
        .error {
            font-size: 12px;
            color: red;
        }
        .display {
            margin: 0 270px;
            max-height: 300px;
            overflow-y: auto;
            display: flex;
            justify-content: flex-start;
            align-items: center;
            width: 100%;
            text-align: center;
        }
    </style>
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
            <asp:RadioButtonList ID="genreRadioList" runat="server" CssClass="radio-group space-grp" RepeatDirection="Horizontal">
                <asp:ListItem Text="Action" Value="Action" />
                <asp:ListItem Text="Comedy" Value="Comedy" />
                <asp:ListItem Text="Drama" Value="Drama" />
                <asp:ListItem Text="Horror" Value="Horror" />
                <asp:ListItem Text="History" Value="History" />
            </asp:RadioButtonList>
        </div>

        <div class="form-group">
            <asp:Label ID="languageLB" runat="server" class="label" Text="Language:"></asp:Label>
            <asp:RadioButtonList ID="languageRadioList" runat="server" CssClass="radio-group space-grp" RepeatDirection="Horizontal">
                <asp:ListItem Text="English" Value="English" />
                <asp:ListItem Text="Hindi" Value="Hindi" />
                <asp:ListItem Text="Gujarati" Value="Gujarati" />
            </asp:RadioButtonList>
        </div>

        <div class="form-group">
            <asp:Label ID="ratingLB" runat="server" class="label" Text="Rating (1-5):"></asp:Label>
            <asp:RadioButtonList ID="ratingRadioList" runat="server" CssClass="rating-options space-grp" RepeatDirection="Horizontal">
                <asp:ListItem Text="1" Value="1" />
                <asp:ListItem Text="2" Value="2" />
                <asp:ListItem Text="3" Value="3" />
                <asp:ListItem Text="4" Value="4" />
                <asp:ListItem Text="5" Value="5" />
            </asp:RadioButtonList>
        </div>
        <asp:Label ID="successLB" runat="server" Text="" CssClass="success"></asp:Label>
        <asp:Label ID="errorLB" runat="server" Text="" CssClass="error"></asp:Label>
        <div class="btns">
            <asp:Button ID="submitBtn" runat="server" Text="Submit" class="button" OnClick="submitBtn_Click" />
            <asp:Button ID="clearBtn" runat="server" Text="Clear" class="button" />
            <asp:Button ID="editBtn" runat="server" Text="Edit" class="button" />
        </div>
      </div>
    </div>

    <div class="display">
        <asp:GridView ID="dgvMovies" runat="server" BackColor="White" BorderStyle="None" BorderWidth="1px" CellPadding="12" ForeColor="Black" GridLines="Horizontal" Width="727px" AutoGenerateDeleteButton="True" AutoGenerateSelectButton="True" >
            <Columns>
                <asp:ImageField DataImageUrlField="image" HeaderText="image">
                    <ControlStyle Height="100px" />
                </asp:ImageField>
            </Columns>
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
        </asp:GridView>
    </div>
</div>
    </form>
</body>
</html>
