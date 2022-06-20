<%-- 
    Document   : evaluate
    Created on : Jun 16, 2022, 9:30:29 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="style/style.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Auction</title>
        <style>
            .gis-sidebar a {font-family: "Roboto", sans-serif}
            body,h1,h2,h3,h4,h5,h6,.gis-wide {font-family: "Montserrat", sans-serif;}
        </style>
    </head>
    <body>
    <nav class="gis-sidebar gis-bar-block gis-black gis-collapse gis-top" style="z-index:3;width:250px" id="mySidebar">
  
    <div class="gis-container gis-display-container gis-padding-16">
    <i onclick="gis_close()" class="fa fa-remove gis-hide-large gis-button gis-display-topright"></i>
    <img src="\src\main\media\logo.gif" style="width:100%">
  </div>

  <div class="gis-padding-64 gis-large gis-text-white" style="font-weight:bold">

    <a onclick="myAccFunc()" href="javascript:void(0)" class="gis-button gis-block gis-black gis-left-align" id="myBtn">
      BUY ACCOUNT <i class="fa fa-caret-down"></i>
    </a>
    <div id="demoAcc" class="gis-bar-block gis-hide gis-padding-large gis-medium">
      <a href="#" class="gis-bar-item gis-button">SUGGESTED ACCOUNTS</a>
      <a href="#" class="gis-bar-item gis-button">VIP ACCOUNTS</a>
      <a href="#" class="gis-bar-item gis-button">RANDOM ACCOUNTS</a>
    </div>

        <a class="gis-bar-item gis-button" style="color:black; background-color:white">SELL ACCOUNT</a>
        <a class="gis-bar-item gis-button" >AUCTION</a>
    </div>

        <a href="#footer" class="gis-bar-item gis-button gis-padding">Contact</a> 
        <a href="javascript:void(0)" class="gis-bar-item gis-button gis-padding" onclick="document.getElementById('newsletter').style.display='block'">Newsletter</a> 
        <a href="#footer"  class="gis-bar-item gis-button gis-padding">Subscribe</a>
    </nav>
        <header class="gis-bar gis-top gis-hide-large gis-black gis-xlarge">
  <div class="gis-bar-item gis-padding-24 gis-wide">GIS</div>
  <a href="javascript:void(0)" class="gis-bar-item gis-button gis-padding-24 gis-right" onclick="gis_open()"><i class="fa fa-bars"></i></a>
</header>      
<!-- Overlay effect when opening sidebar on small screens -->
<div class="gis-overlay gis-hide-large" onclick="gis_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="gis-main" style="margin-left:250px">

  <!-- Push down content on small screens -->
  <div class="gis-hide-large" style="margin-top:83px"></div>
  
  <!-- Top header -->
  <header class="gis-container gis-xlarge">
    <p class="gis-left" style="margin-left:27%; color:white">ACCOUNT VALUATION</p>

  </header>
  <style>
      div.body {
          border-radius:20px;
          background-image:url(media/eval.jpg);
          background-position:center;
          background-repeat:no-repeat;
          background-size:cover;
          font-size:200%;
          margin-left:10%;
          margin-right:10%;
          padding-left:10%;
          padding-top:10%;
          padding-bottom:10%;
      }
      .eval:hover {
          color:white;
          background-color:black;
      }
  </style>
  <body>
      <div class="body">
          <form action="sellservlet" method="POST">
              Enter Character list:<input style="width:500px;" type="text" name="charlist"><BR>
<!--              Enter Weapon list:   <input style="margin-left:12px;width:500px;" type="text" name="weaplist"><BR>-->
              Enter Primogems:     <input style="margin-left:13px;width:500px;" type="text" name="primos"><BR>
              <input class="eval" style="margin-left:32%;margin-top:20%;" type="submit" value="EVALUATE"/>
          </form>
      </div>
  </body>
    <script>
  function myAccFunc() {
  var x = document.getElementById("demoAcc");
  if (x.className.indexOf("gis-show") == -1) {
    x.className += " gis-show";
  } else {
    x.className = x.className.replace(" gis-show", "");
  }
}

// Click on the "accs" link on page load to open the accordion for demo purposes
document.getElementById("myBtn").click();


// Open and close sidebar
function gis_open() {
  document.getElementById("mySidebar").style.display = "block";
  document.getElementById("myOverlay").style.display = "block";
}
 
function gis_close() {
  document.getElementById("mySidebar").style.display = "none";
  document.getElementById("myOverlay").style.display = "none";
}
</script>
</html>