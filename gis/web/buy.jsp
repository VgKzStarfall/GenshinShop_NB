<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : buy
    Created on : Jul 11, 2022, 10:08:20 AM
    Author     : khang
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
        <title>Sell Account</title>
        <style>
            .gis-sidebar a {font-family: "Roboto", sans-serif}
            body,h1,h2,h3,h4,h5,h6,.gis-wide {font-family: "Montserrat", sans-serif;}
        </style>
    </head>
    <body>
    <nav class="gis-sidebar gis-bar-block gis-black gis-collapse gis-top" style="z-index:3;width:250px" id="mySidebar">
  
    <div class="gis-container gis-display-container gis-padding-16">
    <i onclick="gis_close()" class="fa fa-remove gis-hide-large gis-button gis-display-topright"></i>
    <img src="media\logo.gif" style="width:100%" onclick="checkses(${sessionScope.acc.username})">
    <script>
        function checkses(x) {
            if(x === null) {
                window.location.href='index.html';
            } else {
                window.location.href='home.jsp';
            }
        }
         
    </script>
  </div>

  <div class="gis-padding-64 gis-large gis-text-white" style="font-weight:bold">

    <a onclick="myAccFunc()" href="javascript:void(0)" class="gis-button gis-block gis-black gis-left-align" id="myBtn">
      BUY ACCOUNT <i class="fa fa-caret-down"></i>
    </a>
    <div id="demoAcc" class="gis-bar-block gis-hide gis-padding-large gis-medium">
        
        
      <a href="buy?vip=0" class="gis-bar-item gis-button">SUGGESTED ACCOUNTS</a>
      <a href="buy?vip=1" class="gis-bar-item gis-button">VIP ACCOUNTS</a>
      
    </div>
    <c:if test="${sessionScope.acc != null }">
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
    </form>
    </c:if>
      
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
    <p class="gis-left" style="margin-left:27%; color:white">GENSHIN IMPACT SHOP</p>
    <button id="next" style="float: right; margin-top: 100px; margin-right: 20px" onclick="page(${vip},${page}, ${endpage})">Next</button>
    
    <button id="back" style="float: left; margin-top: 100px; margin-left:  20px;" onclick="backpage(${vip},${page})" value="${page}">Back</button>
  </header>
  <script>
      function page(vip , count, endpage ) {
         
           count++;
           if(vip === 1) {
               if(count >= endpage) {
                   window.location.href = 'buy?vip=' + vip +'&page=' + endpage;
               } else {
                   window.location.href = 'buy?vip=' + vip +'&page=' + count;
               }
               
           } else {
               if(count == endpage) {
                   window.location.href = 'buy?vip=' + vip +'&page=' + endpage;
               } else {
                   window.location.href = 'buy?vip=' + 0 +'&page=' + count;
               }
           }
          
      }
      function backpage(vip, count) {
          
            count--;
            
            if(vip === 1) {
               if(count === 0) {
                window.location.href = 'buy?vip=' + vip +'&page=' + 1;
                } else {
                     window.location.href = 'buy?vip=' + vip +'&page=' + count;
                }
              
           } else {
               if(count === 0) {
                window.location.href = 'buy?vip=' + vip +'&page=' + 1;
                } else {
                     window.location.href = 'buy?vip=' + vip +'&page=' + count;
                }
              
               
           }
          
         
           
           
      }
  </script>
  <style>
      div.body {
          border-radius:20px;
         
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
      .input {
          color:white;
          background-color:black;
      }
      .input:hover {
          color:black;
          background-color:lightblue;
      }
      input[type=text], input[type=password] {
          width: 100%;
          padding: 12px 20px;
          margin: 8px 0;
          display: inline-block;
          border: 1px solid #ccc;
          box-sizing: border-box;
      }

       button:hover {
        opacity: 0.8;
        }

       .cancelbtn {
        width: auto;
        padding: 10px 18px;
        background-color: #f44336;
        margin-left: 200px;
      }       

      .imgcontainer {
  text-align: center;
  margin: 24px 0 12px 0;
  position: relative;
}

img.avatar {
  width: 40%;
  border-radius: 50%;
}

.container {
  padding-top:10%;
  padding-left:100px;
  padding-right:18px;
  padding-bottom:10%;
  background-repeat:no-repeat;
  background-size:100px;
  background-position:center;
}

.container2 {
  padding: 16px;

}
span.psw {
  float: right;
  padding-top: 16px;
}

.modal {
  display: none;
  position: fixed;
  z-index: 100;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto;
  padding-top: 60px;

}

.modal-content {
  background-color: #fefefe;
  margin: 5% auto 15% auto;
  border: 1px solid #888;
  width: 30%;
}

.close {
  position: absolute;
  right: 25px;
  top: 0;
  color: #000;
  font-size: 35px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: red;
  cursor: pointer;
}

.animate {
  -webkit-animation: animatezoom 0.6s;
  animation: animatezoom 0.6s
}

@-webkit-keyframes animatezoom {
  from {-webkit-transform: scale(0)} 
  to {-webkit-transform: scale(1)}
}
  
@keyframes animatezoom {
  from {transform: scale(0)} 
  to {transform: scale(1)}
}

@media screen and (max-width: 300px) {
  span.psw {
     display: block;
     float: none;
  }
  .cancelbtn {
     width: 100%;
  }
}
  

  </style>
  <body>
      <c:if test="${vip==0}">
          <div style="color:white;background-color:brown;margin-left:20%;margin-right:20%;font-size:120%;padding-left:10%;text-decoration:none;padding-top:10px;padding-bottom:10px;">View current meta unit <a  href="https://genshin.gg/tier-list" target="_blank">here</a>
          <h4> Currently viewing suggestion for character: Kaedehara Kazuha </h4></div>
      </c:if>
      <c:forEach var="o" items="${list}" varStatus="loop">
        <div class="gis-col l3 s6">
            <div class="gis-container">
                <div class="gis-display-container">
                <img src="media\char5.jpg" style="width:100%">
                <span class="gis-tag gis-display-topleft">${o.price}$</span>
        <div class="gis-display-middle gis-display-hover">
            <button class="gis-button gis-black" onclick="document.getElementById('${loop.count}').style.display='block'">Get now!<i class="fa fa-shopping-cart"></i></button>
        </div>
                </div>
          <p class="gis-text-red" style="margin-left: 40%">Account ${loop.count} <br></p>
            </div> 
        </div>
            
        <div id="${loop.count}" class="modal">     
            <form class="modal-content animate" action="payment" method="post">
                <input type="hidden" value="${sessionScope.acc.username}" name="acc"/>
                <div class="imgcontainer">
                <span onclick="document.getElementById('${loop.count}').style.display='none'" class="close" title="Close Modal">&times;</span>
                </div>
                <div class="container">
                    <table border="1">
                        <thead>
                            <tr> <th>Account:</th><th> <input type="text" name="pro" value="${o.productID}"/></th>
                            </tr>
                            <tr>
                                <th>Character List</th>
                               <th><input type="text" name="" value="${o.charlist}" disabled="disabled" /></th>
                            </tr>
                            <tr>
                                <th>Weapon List</th>
                                <th><input type="text" name="" value="${o.weaponlist}" disabled="disabled" /></th>
           
                            </tr>
                                <th>Primogems</th>
                                <th><input type="text" name="" value="${o.primogems}" disabled="disabled" /></th>
                            </tr>
                        </thead>
                       
                    </table>

                    
                </div>

                <div class="container2" style="background-color:#f1f1f1">
                    <button type="submit" style="float: bottom" onclick="logged(${sessionScope})"class="cancelbtn">Done</button>
               <script>
    function logged(x) {
        if (x === null) {
        window.alert("You have to login to use this feature");
        event.preventDefault();
    } else document.getElementById('${loop.count}').style.display='none';
    }
    </script>
                </div>
            </form>
        </div>
                
        
  </c:forEach>
    <br>
  
    
   
  </body>
  
    <script>
  function myAccFunc() {
  var x = document.getElementById("demoAcc");
  if (x.className.indexOf("gis-show") === -1) {
    x.className += " gis-show";
  } else {
    x.className = x.className.replace(" gis-show", "");
  }
}
 function checklogged(check) {
     if(check === null) {
        window.alert("You have to login to use this feature!");
     } else window.location.href = 'buy';
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

var modal = document.getElementById('id01');

window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

</script>
</html>
