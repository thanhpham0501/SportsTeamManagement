<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>HomePage</title>
  <link rel="stylesheet" href="css/swiper-bundle.min.css">
  <link rel="stylesheet" href="css/style2.css">
  <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
</head>
<body>

  <header>
    <div class="nav-bar">
      <a href="" class="logo">Galaxy Sports Team</a>
      <div class="navigation">
        <div class="nav-items">
          <i class="uil uil-times nav-close-btn"></i>
          <a href="Events_fetch.jsp"><i class="uil uil-home"></i> Events</a>
          <a href="Players_fetch.jsp"><i class="uil uil-compass"></i> Players</a>
          <a href="ClubStats_fetch.jsp"><i class="uil uil-info-circle"></i> Club Statistics</a>
          <a href="AdminLogin.jsp"><i class="uil uil-document-layout-left"></i>Login</a>
          <a href="Register.jsp"><i class="uil uil-document-layout-left"></i>Register</a>
        </div>
      </div>
      <i class="uil uil-apps nav-menu-btn"></i>
    </div>
  </header>

  <section class="home">
 
    <div class="swiper bg-slider">
      <div class="swiper-wrapper">
        <div class="swiper-slide">
          <img src="images/bg9.jpg" alt="">
         
        </div>
        
        
        <div class="swiper-slide dark-layer">
          <img src="images/bg8.jpg" alt="">
        
          
        </div>
        <div class="swiper-slide dark-layer">
          <img src="images/bg10.jpg" alt="">
         
        </div>
        
        <div class="swiper-slide">
          <img src="images/bg6.jpg" alt="">
          
        </div>
      </div>
    </div>
    
    
  </section>

  <section class="about section">
    <h2>About</h2>
    <p>
    </p>
    
    <div class="bg-slider-thumbs">
      <div class="media-icons">
      <a href="#"><i class="uil uil-facebook-f"></i></a>
      <a href="#"><i class="uil uil-instagram"></i></a>
      <a href="#"><i class="uil uil-twitter"></i></a>
    </div>
    </div>
    
  </section>

  <script src="js/swiper-bundle.min.js"></script>
  <script src="js/main.js"></script>

</body>
</html>
      