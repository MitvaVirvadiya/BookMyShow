<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="BookMyShow.Home" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BookMyShow</title>
    <link rel="stylesheet" href="Style/style.css">
    <style>
        .img {
            width: 30px;
            height: 30px;
            object-fit: cover;
            border-radius: 50%;
            border: 2px solid white;
        }

        .main{
            margin: 10px auto;
        }

        .card-movie{
            width: 100px;
            height: auto;
            border: 1px solid #000;
            background-color: aquamarine;
        }
    </style>
</head>
<body>
     <form id="form1" runat="server">
          <header class="nav sticky">
            <div class="logo"><img src="assets/images/logo1.png" alt="logo" /></div>
            <div class="menu">
              <ul>
                <li><a href="#">Movies</a></li>
                <li>
                    <a href="UserProfile.aspx">User</a>
                    <asp:Image ID="profileControl" runat="server" CssClass="img" />
                </li>
              </ul>
            </div>
          </header>
          <div class="container">
              <div class="content-main main">
                  <h1>
                    Welcome, 
                    <asp:Label ID="emailTxt" runat="server" Text=""></asp:Label>
                  </h1>
              </div>
              <div>
                  <asp:DataList ID="DisMovieDtl" RepeatColumns="5" runat="server" CellPadding="4" ForeColor="#333333">
                      <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
                      <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                      <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                      <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
                      <ItemTemplate>
                          <div>
                              <asp:Image ID="MovieIMG" runat="server" Height="100px" Width="100px" ImageUrl='<%# Eval("image")%>' />
                          </div>
                          <b>Name</b><asp:Label ID="lblName" runat="server" Text='<%# Eval("MovieName")%>'></asp:Label><br />
                          <b>Description</b><asp:Label ID="lblDesc" runat="server" Text='<%# Eval("Description")%>'></asp:Label>
                          <asp:Button ID="movieBtn" runat="server" Text="Shows" />
                      </ItemTemplate>
                      <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                  </asp:DataList>
              </div>
          </div>
          <footer>
            <div class="logo">
              <img src="assets/images/logo1.png" alt="BookMyShow Logo" />
            </div>
            <div class="copyright">
              &copy; 2024 BookMyShow. All rights reserved.
            </div>
          </footer>
          <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"
          ></script>
        </form>
</body>
</html>
