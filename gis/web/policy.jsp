<%-- 
    Document   : auction
    Created on : Jun 16, 2022, 12:20:02 PM
    Author     : HP
--%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page import="Model.*"%>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js" integrity="sha512-GsLlZN/3F2ErC5ifS5QtgpiJtWd43JWSuIgh7mbzZ8zBps+dvLusV+eNQATqgA/HdeKFVgA5v3S/cIrLF7QnIg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

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
        <input type="submit" class="gis-bar-item gis-button" style="color:black; background-color:white" value="AUCTION">
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
    <p class="gis-left" style="margin-left:40%; color:white">AUCTION</p>

  </header>

    </body>
    <style>
        table {
            background-color:white;
            background-size:1250px 780px;
            background-repeat:no-repeat;
            border-radius:100px;
            padding-top:11%;
            padding-bottom:10%;
            padding-left:8%;
            padding-right:10%;
            color:white;
            border: 1px white;
            border:none;
            margin-left:7%;
            font-size:150%;
        }
        th {
            background-color:black;
            color:white;
        }
        td {
            color:black;
        }
        .bid {
            color:white;
            background-color:black;
        }
        .bid:hover {
            color:black;
            background-color:white;
        }
    </style>
    <div style="background-color:white;margin-left:15%;margin-right:15%;margin-bottom:10%;padding:5%;padding-top:2%;border-radius:100px;">
        <h1 style="text-align:center;"> TERMS OF SERVICE </h1>
        <h2>1.GENERAL STATEMENT</h2>
    These policies aim to establish guidelines for the proper development of GIS and the quality of experience for all GIS users.
    <h2>2.TRADING POLICIES</h2>
    -To be able to put your accounts on sale on GIS, please make sure that all the information sent is true, we assure you that the credential will be safely managed for the sake of both sides.
    <BR>-For buyers, we can not display all the crucial information directly related to confidential information in order to keep the process safe, with all the information provided, please make up your mind before buying an account.
    <BR>-No refund is available after sale has been settled.
    <h2>3.TRADEMARK</h2>
    -All rights reserved.
    <BR>-GIS is a registered trademark by all the members of Genshin Gang, which is prohibited from copying by all means.
    <h2> 
        <button style="margin-left:30%;color:white;background-color:green;" onmouseover="style='margin-left:30%;color:white;background-color:#00FF00;'" onmouseout="style='margin-left:30%;color:white;background-color:green;'" onclick="document.getElementById('input').style.display='block'">I Agree</button>
        <button style="color:white;background-color:#800000;" onmouseover="style='color:white;background-color:red;'" onmouseout="style='color:white;background-color:#800000;'" onclick="history.back()">I Decline</button>
        <form style="position:absolute;margin-top:-27%;margin-left:-3.2%;;padding:7%;border:1px solid black;border-radius:100px;margin-bottom:-5%;z-index:10;display:none;background-color:white;" id="input" action="insertaccount" method="POST">
            Input your Genshin Impact account information:<BR>
                <input type="hidden" value="${primo}" name="primo"/>
                <input type="hidden" value="${charlist}" name="clist"/>
                <input type="hidden" value="${weaplist}" name="wlist"/>
                <input type="hidden" value="${eval}" name="value"/>
            User ID:<input id="uID" style="margin-left:10%;" type="text" name="uID" value=""/><BR>
            Password:<input id="pass" style="margin-left:5.3%;" type="password" name="pass" value=""/><BR>
            <img id="showimg" onclick="show()" style="display:block;position:absolute;margin-left:60%;margin-top:-4%;" src="media/show.png" width="35px" height="auto"/>
            <img id="hideimg" onclick="hide()" style="display:none;position:absolute;margin-left:60%;margin-top:-4%;" src="media/hide.png" width="35px" height="auto"/>
            <input style="margin-left:40%;margin-top:5%;" onclick="check()" type="submit" value="Confirm"/>
        </form>
    </div>
    <script>
        function show() {
            document.getElementById("pass").type="text";
            document.getElementById("showimg").style.display="none";
            document.getElementById("hideimg").style.display="block";
        }
        function hide() {
            document.getElementById("pass").type="password";
            document.getElementById("showimg").style.display="block";
            document.getElementById("hideimg").style.display="none";
        }
        function check() {
            var x=document.getElementById("uID").value;
            var y=document.getElementById("pass").value;
            if (x==="") {
                alert("You must input user ID");
                event.preventDefault();
            } 
            if (y==="") {
                alert("You must input password");
                event.preventDefault();
            }
            if (x!=="" && y!=="") {
                if (!confirm("Confirm you information?")) {
                    event.preventDefault();
                }
            }
        }
			function generatePDF() {
				// Choose the element that our invoice is rendered in.
				const element = document.getElementById('invoice');
				// Choose the element and save the PDF for our user.
				html2pdf().from(element).save();
			}
// Accordion 
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
