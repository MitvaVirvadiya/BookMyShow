<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="About.aspx.cs"
Inherits="BookMyShow.About" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <title>About Us - Book My Show</title>
    <link rel="stylesheet" href="Style/style.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
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
        <div class="about-content">
          <h2>About Us</h2>
          <p>
            BookMyShow is your ultimate destination for all things
            entertainment. With a passion for movies, events, and live
            performances, we strive to bring you the best experiences that the
            world of entertainment has to offer.
          </p>
          <p>
            Our mission is to make booking tickets and experiencing your
            favorite movies and events as seamless and enjoyable as possible. We
            believe in creating memories that last a lifetime and providing our
            users with unforgettable moments.
          </p>
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
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
  </body>
</html>
