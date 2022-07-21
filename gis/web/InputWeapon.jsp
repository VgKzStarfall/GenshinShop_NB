<%-- 
    Document   : InputInfo
    Created on : Jun 23, 2022, 5:03:07 PM
    Author     : HP
--%>
<%@page import="Model.*" %>
<%@page import="java.util.ArrayList" %>
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
        <title>input Information</title>
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

<a style="background-color:white;color:black;" class="gis-bar-item gis-button">SELL ACCOUNT</a>
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
    <p class="gis-left" style="margin-left:30%; color:white">Input Weapon</p>

  </header>
  <style>
      div.input {
          background-color:white;
          border-radius:50px;
          margin-left:3%;
          padding-left:5%;
          margin-right:3%;
          padding-top:2%;
      }
      img.char {
          margin: 2% 1% 9% 1%;
      }
      input.done {
          margin-bottom:7%;
          margin-top:5%;
          margin-left:40%;
          padding: 10px 10px 10px 10px;
          background-color:black;
          color:white;
      }
      input.done:hover {
          background-color:grey;
          color:black;
      }
      div.weap {
          display:inline;
      }
  </style>
  <body>
      <div class="input">
          <form action="middle2" method="POST">
              <img src="media/searching.png" width='25px' style='padding-left:20%;'/>
              <input type="text" style="width:50%;height:30px;" id="myInput" onkeyup="myFunction()" placeholder="Search for Weapons.."><BR>
              <a href="#submit"> <img style="width:70px;height:70px;border-radius:50%;position:fixed;left:92%;top:80%;" src="media/down.png"/></a>
      <% 
        ArrayList<WeapValue> wv = (ArrayList<WeapValue>) request.getAttribute("list");
        int n = wv.size();
        int m=(int)n/5 + 1;
        for (int i=0;i<n;i++) {
                String Cname= wv.get(i).CodeName;
                String s= "media/"+Cname+".jpg";
                String Wname= wv.get(i).WeapName;
                String h1=Cname+"1";
      %>
      <div class='weap'>     
            <img style="" class="char" src="<%=s%>" width="15%"/>
            <input id="<%=h1%>" style="position:relative; left:-180px;top:100px;" type="checkbox" name="<%=Cname%>" value="<%=Cname%>" />
            <label for="<%=h1%>" style="position:absolute;margin-left:-10%;padding-top:252px;"><a> <%=Wname%> </a></label>
            <a  style="position:absolute;margin-left:-12%;margin-top:280px;"> Refinement: </a>
            <select style="position:absolute;margin-left:-5%;margin-top:280px;width:50px;" type="text" name="<%=h1%>">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
            </select>
      </div>
      <%
            }
      %>
         <BR>
            <input id="submit" onclick="confirm('Confirm!')" class="done" type="submit" value="Done inputting info"/>
          </form>
      </div>
  </body>
    <script>
        function myFunction() {
            var input, filter, lidiv, li, a, i, txtValue;
            input = document.getElementById('myInput');
            filter = input.value.toUpperCase();
            li = document.getElementsByTagName('label');
            lidiv = document.getElementsByTagName('div');

  // Loop through all list items, and hide those who don't match the search query
    for (i = 0; i < li.length; i++) {
    a = li[i].getElementsByTagName("a")[0];
    txtValue = a.textContent || a.innerText;
    if (txtValue.toUpperCase().indexOf(filter) > -1) {
      li[i].style.display = "";
      lidiv[i+8].style.display="";
    } else {
      lidiv[i+8].style.display="none";
      li[i].style.display = "none";
    }
  }
        }
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