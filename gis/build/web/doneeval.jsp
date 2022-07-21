<%-- 
    Document   : doneeval
    Created on : Jun 16, 2022, 10:08:34 PM
    Author     : HP
--%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
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
        <title>Evaluation Done!</title>
        <style>
            .gis-sidebar a {font-family: "Roboto", sans-serif}
            body,h1,h2,h3,h4,h5,h6,.gis-wide {font-family: "Montserrat", sans-serif;}
        </style>
    </head>
    <body>
    <nav class="gis-sidebar gis-bar-block gis-black gis-collapse gis-top" style="z-index:3;width:250px" id="mySidebar">
  
    <div class="gis-container gis-display-container gis-padding-16">
    <i onclick="gis_close()" class="fa fa-remove gis-hide-large gis-button gis-display-topright"></i>
  <img src="media\logo.gif" style="width:100%" onclick="window.location.href='home.jsp'">
  </div>

  <div class="gis-padding-64 gis-large gis-text-white" style="font-weight:bold">

    <a onclick="myAccFunc()" href="javascript:void(0)" class="gis-button gis-block gis-black gis-left-align" id="myBtn">
      BUY ACCOUNT <i class="fa fa-caret-down"></i>
    </a>
    <div id="demoAcc" class="gis-bar-block gis-hide gis-padding-large gis-medium">
      <a href="buy?vip=0" class="gis-bar-item gis-button">SUGGESTED ACCOUNTS</a>
      <a href="buy?vip=1" class="gis-bar-item gis-button">VIP ACCOUNTS</a>
     
    </div>

        <form action="sellservlet" method="GET">
        <input type="hidden" value="${sessionScope.acc.username}" name="acc"/>
        <input type="submit" class="gis-bar-item gis-button" value="SELL ACCOUNT">
    </form>
    <form action="auctionservlet" method="GET">
        <input type="hidden" value="${sessionScope.acc.username}" name="acc"/>
        <input type="submit" class="gis-bar-item gis-button" value="AUCTION">
    </form>
      <form action="walletservlet" method="GET">
          <input type="hidden" value="${sessionScope.acc.username}" name="acc"/>
        <input type="submit" class="gis-bar-item gis-button" value="WALLET">
    </form>
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
    <p class="gis-left" style="margin-left:30%; color:white">EVALUATION</p>

  </header>
    <style>
      div.body {
          border-radius:20px;
          background-color:white;
          font-size:200%;
          margin-left:10%;
          margin-right:10%;
          margin-bottom:10%;
          padding-left:8%;
          padding-top:5%;
          padding-bottom:10%;
      }
      td {
          border: 1px solid black;
      }
      .eval:hover {
          color:white;
          background-color:black;
      }
  </style>
  <body>    
      <form action="insertaccount" method="GET">
          <input type="hidden" value="${primo}" name="primo"/>
      <input type="hidden" value="${charlist}" name="clist"/>
      <input type="hidden" value="${weaplist}" name="wlist"/>
      <input type="hidden" value="${eval}" name="value"/>
      <input type="hidden" value="${sessionScope.acc.username}" name="acc"/>   
      
      <input style="position:absolute;margin-left:35%;margin-top:6%;padding:10px;" type="${submit}" value="Input Account Information"/>
      </form>
      <a style="position:absolute;margin-left:35%;margin-top:6.5%;font-size:150%;color:#00FF00;" ${hidden}>Security Information inputted!</a>
   
  <div class="body">
      <p>Primogems: ${primo}</p>
      <table class="body">
          <thead> <tr>
          <td style="font-weight:bold;" width="460px">Character List:</td>
          <td style="font-weight:bold;">Constellation:</td>
          </tr>
          </thead>
          <tbody>
                <c:forEach items="${clist}" var="p">
                <tr>
                    <td>${p.charname}</td>
                    <td>${p.cons}</td>
                </tr>
                </c:forEach>
          </tbody>
        </table>
      <table class="body">
          <thead> <tr>
          <td style="font-weight:bold;" width="460px">Weapon List:</td>
          <td style="font-weight:bold;" width="205px">Refinement:</td>
          </tr>
          </thead>
          <tbody>
                <c:forEach items="${wlist}" var="w">
                <tr>
                    <td>${w.weapName}</td>
                    <td>${w.refine}</td>
                </tr>
                </c:forEach>
          </tbody>
        </table>
      <p style="color:black">Account value after auto-evaluation: <a style="font-weight:bold;">${eval}$</a></p>
    <h6 style="color:red;" ${hidden2}> Please input account security information before open sale or auction for this account!</h6> 
  <form action="sell2" method="GET">
      <input type="hidden" value="${primo}" name="primo"/>
      <input type="hidden" value="${charlist}" name="clist"/>
      <input type="hidden" value="${weaplist}" name="wlist"/>
      <input type="hidden" value="${eval}" name="value"/>
      <input type="hidden" value="${sessionScope.acc.username}" name="acc"/>
      <input type="hidden" value="${acc_info}" name="acc_info"/>
      <input class="sellbut" style="margin-left:10%;clip-path: polygon(0 0, 100% 0%, 75% 100%, 0% 100%);width:300px;text-align:left;border:1px solid black;height:50px;color:white;background-color:blue;" onclick="confirm('Confirm!')" type="${dis}" value="Sell this Account"/>
  </form>
  <style>
      input.sellbut:hover {
              background-color:#000080;
      }
      input.auctionbut:hover {
              background-color:green;
      }
  </style>
  <form action="startauction" method="GET">
      <input class="auctionbut" style="position:absolute;margin-top:-54px;margin-left:20%;clip-path: polygon(25% 0%, 100% 0%, 100% 100%, 0% 100%);border:1px solid black;width:300px;text-align:right;height:50px;color:white;background-color:#00FF00;" onclick="confirm('Confirm!')" type="${dis}" value="Start an Auction"/>
      <input type="hidden" value="${primo}" name="primo"/>
      <input type="hidden" value="${charlist}" name="clist"/>
      <input type="hidden" value="${weaplist}" name="wlist"/>
      <input type="hidden" value="${eval}" name="value"/>
      <input type="hidden" value="${sessionScope.acc.username}" name="acc"/>
      <input type="hidden" value="${acc_info}" name="acc_info"/>
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