<%-- 
    Document   : bid
    Created on : Jun 16, 2022, 6:58:05 PM
    Author     : HP
--%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="style/style.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Bidding</title>
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
        <input type="submit" class="gis-bar-item gis-button" " value="SELL ACCOUNT">
    </form>
    <form action="auctionservlet" method="GET">
        <input type="submit" class="gis-bar-item gis-button" style="color:black; background-color:white" value="AUCTION">
    </form>
      <form action="walletservlet" method="GET">
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
    <p class="gis-left" style="margin-left:30%; color:white">AUCTION</p>

  </header>
  <style>
      div.body {
          padding-top:10%;
          background-color:white;
          border-radius:20px;
          margin-left:10%;
          margin-right:10%;
      }
      form.a {
          padding-left:20%;
          padding-bottom:20%;
      }
  </style>
<body>
    <div class="body">
    <h1 style="padding-left:25%">Account ${pro.productID} Info</h1>
    <h2 style="padding-left:15%">Char list:</h2>
    <a style="padding-left:20%"></a>
    <%
        String clist = (String)request.getAttribute("list");
        String wlist = (String)request.getAttribute("list2");
        String[] charlist= clist.split(",");
        String[] weaplist= wlist.split(",");
        for (int i=0;i<charlist.length;i++) {
            String url="media/"+charlist[i].substring(0,charlist[i].length()-1)+".jpg";
            int cons= Integer.parseInt(charlist[i].substring(charlist[i].length()-1));
            %>
            <img style="" class="char" src="<%=url%>" width="15%"/>
            <a> Constellation: <%=cons%> </a>
            <%
        }
    %>
    <h2 style="padding-left:15%">Weapon list:</h2>
        <a style="padding-left:20%"></a>
    <% for (int i=0;i<weaplist.length;i++) {
        String url2="media/"+weaplist[i].substring(0,weaplist[i].length()-1)+".jpg";
        int ref= Integer.parseInt(weaplist[i].substring(weaplist[i].length()-1));
        %>
        <img style="" class="weap" src="<%=url2%>" width="15%"/>
        <a> Refinement: <%=ref%> </a>
        <%
    }%>
        <h3 style="padding-left:15%"> Current bid for this account: ${auc.currentPrice}</h3>
        <form class="a" action="startauction" method="POST">
            <input type="hidden" value="${sessionScope.acc.username}" name="acc"/>
            <input id="bal" type="hidden" value="${wal.balance}" name=""/>
            <input id="price" type="hidden" value="${pro.price}" name=""/>
            <input type="hidden" value="${pro.productID}" name="proID"/>
            Bid for this account: <input id="bid" type="text" value="0" name="bid"/>
            <input type="submit" onclick="check()" value="CONFIRM"/>
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

function check() {
    var x=document.getElementById("bal").value;
    var y=document.getElementById("price").value;
    var z=document.getElementById("bid").value;
    if (x<y) {
        alert("You don't have enough money");
        event.preventDefault();
    }
    if (y>z) {
        alert("You must input more money than current bid");
        event.preventDefault();
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