<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Welcome.aspx.cs"
Inherits="BookMyShow.Welcome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <title>Welcome to Book My Show</title>
    <link rel="stylesheet" href="Style/style.css" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
      crossorigin="anonymous"
    />
      <style>
          .error{
              color: blue;
          }
      </style>
  </head>
  <body>
    <form id="form1" runat="server">
      <header class="nav sticky">
        <div class="logo"><img src="assets/images/logo1.png" alt="logo" /></div>
        <div class="menu">
          <ul>
            <li><a href="Login.aspx">Login</a></li>
            <li><a href="Register.aspx">Register</a></li>
          </ul>
        </div>
      </header>
      <div class="container">
        <div class="section-one">
          <div class="dark"></div>
          <div class="content">
            <div class="content-main">
              <h2>Book My Show</h2>
              <p>
                Experience the magic of movies like never before. Book your
                tickets now and immerse yourself in a world of entertainment.
              </p>
            </div>
          </div>
        </div>
        <div class="section-two">
          <div class="cta">
            <p>
              Join millions of movie lovers who trust Book My Show for an
              unforgettable cinema experience. Start your journey with us today!
            </p>
            <button><a href="Register.aspx">Get Started</a></button>
          </div>
        </div>
        <div class="section-three">
          <div class="container">
            <h2>About Us</h2>
            <div class="content">
              <p>
                BookMyShow is your ultimate destination for all things
                entertainment. With a passion for movies, events, and live
                performances, we strive to bring you the best experiences that
                the world of entertainment has to offer.
              </p>
              <p>
                Our mission is to make booking tickets and experiencing your
                favorite movies and events as seamless and enjoyable as
                possible. We believe in creating memories that last a lifetime
                and providing our users with unforgettable moments.
              </p>
              <button><a href="About.aspx">Learn More</a></button>
            </div>
          </div>
        </div>
        <div class="admin-login">
          <div class="container">
            <h2>Admin Login</h2>
            <div class="form-group">
              <asp:Label
                ID="emailLB"
                runat="server"
                class="label"
                Text="Email:"
              ></asp:Label>
              <asp:TextBox
                ID="emailTxt"
                class="input"
                runat="server"
                TextMode="Email"
              ></asp:TextBox>
            </div>
            <div class="form-group">
              <asp:Label
                ID="passwordLB"
                runat="server"
                class="label"
                Text="Password:"
              ></asp:Label>
              <asp:TextBox
                ID="passwordTxt"
                class="input"
                runat="server"
                TextMode="Password"
              ></asp:TextBox>
                <asp:Label ID="msgLB" runat="server" Text="" CssClass="error"></asp:Label>
            </div>
            <asp:Button ID="adminLogBtn" runat="server" Text="Login" class="button" OnClick="adminLogBtn_Click" />

          </div>
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
