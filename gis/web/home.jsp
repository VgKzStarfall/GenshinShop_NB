<%-- 
    Document   : home
    Created on : Jul 11, 2022, 9:20:04 AM
    Author     : khang
--%>

<%@page import="Model.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
<title>Genshin Impact Shop</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="style/style.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {font-family: Arial, Helvetica, sans-serif;}

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
  padding-right:100px;
  padding-bottom:10%;
  background-repeat:no-repeat;
  background-size:50px;
 
  
  
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
.gis-sidebar a {font-family: "Roboto", sans-serif}
body,h1,h2,h3,h4,h5,h6,.gis-wide {font-family: "Montserrat", sans-serif;}
</style>
</head>
<body class="gis-content" style="max-width:1600px">

<!-- Sidebar/menu -->
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

<!-- Top menu on small screens -->
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
      <button class="login" style="font-size: 70%" onclick="document.getElementById('id01').style.display='block'">${sessionScope.acc.username}</button>
    <div id="id01" class="modal">  
        <div class="modal-content animate" >
    <div class="imgcontainer">
        <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
    </div>

    <div class="container">
      
      
        <label><b>USER PROFILE</b><br></label>
      <label><b>Hello ${sessionScope.acc.username} !!</b></label>
      
        
       <button onclick="document.getElementById('id02').style.display='block'">Change password</button>
   
    </div>

    
  </div>
</div>
    <div id="id02" class="modal">  
  <form class="modal-content animate" action="changepass" method="post">
    <div class="imgcontainer">
        <span onclick="document.getElementById('id02').style.display='none'" class="close" title="Close Modal">&times;</span>
    </div>

    <div class="container">
      <input type="hidden" name="user" id="user" value="${sessionScope.acc.username}">
      <label for="opsw"><b>Old password</b></label>
      <input type="text" placeholder="Enter old password" name="opsw" id="oldpass" required value="">

      <label for="psw"><b>New Password</b></label>
      <input type="password" placeholder="Enter Password" name="psw" id="password" required value="">
        
      <button type="submit">Change</button>
      
    </div>

    
  </form>
</div>

<script>
var modal = document.getElementById('id01');

window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>
    <button class="register" onclick="window.location.href='logout';">Logout</button>
    <p class="gis-left">GENSHIN IMPACT SHOP</p>

  </header>

  <!-- Image header -->
  <div class="gis-display-container gis-container">
    <img src="media\img_header.jpg" alt="Header" style="width:100%">
    <div class="gis-display-topleft gis-text-white" style="padding:24px 48px">
      <h1 class="gis-jumbo gis-hide-small">NEW VERSION, NEW CHARACTERS</h1>
      <h1 class="gis-hide-large gis-hide-medium">HOT ACCOUNTS AND META CHAR NEW ARRIVAL</h1>
      <h1 class="gis-hide-small">GI VERSION 2.7 ACCOUNTS</h1>
      <p><a href="#accs" class="gis-button gis-black gis-padding-large gis-large">SHOP NOW</a></p>
    </div>
  </div>

  <div class="white">
    <h3>Top Tier Character's Value in Dollar</h3>
  </div>

  <!-- Product grid -->
  <div class="gis-row gis-grayscale">
    <div class="gis-col l3 s6">
        
      <div class="gis-container">

        <div class="gis-display-container">
          <img src="media\char1.jpg" style="width:100%">
          <span class="gis-tag gis-display-topleft-hn">Hot</span>
          <div class="gis-display-middle gis-display-hover">
            <button class="gis-button gis-black">Get him now!<i class="fa fa-shopping-cart"></i></button>
          </div>
        </div>
        
        <p class="gis-text-orange">Zhongli<br><b>$50</b></p>
      </div>

      <div class="gis-container">

        <div class="gis-display-container">
            <img src="media\char2.jpg" style="width:100%">
            
            <span class="gis-tag gis-display-topleft-hn">Hot</span>
            <div class="gis-display-middle gis-display-hover">
              <button class="gis-button gis-black">Get her now!<i class="fa fa-shopping-cart"></i></button>
            </div>
          </div>

          <p class="gis-text-purple">Raiden Shogun<br><b>$50</b></p>
        </div>
    </div>
    <div class="gis-col l3 s6">
        
      <div class="gis-container">

        <div class="gis-display-container">
          <img src="media\char3.jpg" style="width:100%">
          <span class="gis-tag gis-display-topleft-hn">New</span>
          <div class="gis-display-middle gis-display-hover">
            <button class="gis-button gis-black">Get her now!<i class="fa fa-shopping-cart"></i></button>
          </div>
        </div>
        
        <p class="gis-text-blue">Yelan<br><b>$50</b></p>
      </div>

      <div class="gis-container">

        <div class="gis-display-container">
            <img src="media\char4.jpg" style="width:100%">
            
            <span class="gis-tag gis-display-topleft-hn">Hot</span>
            <div class="gis-display-middle gis-display-hover">
              <button class="gis-button gis-black">Get him now!<i class="fa fa-shopping-cart"></i></button>
            </div>
          </div>

          <p class="gis-text-green">Kaedehara Kazuha<br><b>$50</b></p>
        </div>

    </div>

    <div class="gis-col l3 s6">

      <div class="gis-container">

        <div class="gis-display-container">
        <img src="media\char5.jpg" style="width:100%">

        <span class="gis-tag gis-display-topleft">DPS</span>
        <div class="gis-display-middle gis-display-hover">
          <button class="gis-button gis-black">Get her now!<i class="fa fa-shopping-cart"></i></button>
        </div>
      </div>
        <p class="gis-text-red">Hutao<br><b>$50</b></p>

      </div>

      <div class="gis-container">
        <div class="gis-display-container">
        <img src="media\char6.jpg" style="width:100%">
        
        <span class="gis-tag gis-display-topleft">DPS</span>
        <div class="gis-display-middle gis-display-hover">
          <button class="gis-button gis-black">Get her now!<i class="fa fa-shopping-cart"></i></button>
        </div>
      </div>
        <p class="gis-text-aqua">Ganyu<br><b>$50</b></p>
      </div>
    </div>

    <div class="gis-col l3 s6">

      <div class="gis-container">
        <div class="gis-display-container">
        <img src="media\char7.jpg" style="width:100%">

        <span class="gis-tag gis-display-topleft">DPS</span>
        <div class="gis-display-middle gis-display-hover">
          <button class="gis-button gis-black">Get her now!<i class="fa fa-shopping-cart"></i></button>
        </div>
      </div>

        <p class="gis-text-aqua">Kamisato Ayaka<br><b>$50</b></p>
      </div>

      <div class="gis-container">
        <div class="gis-display-container">
        <img src="media\char8.jpg" style="width:100%">
        <span class="gis-tag gis-display-topleft">DPS</span>
        <div class="gis-display-middle gis-display-hover">
          <button class="gis-button gis-black">Get him now!<i class="fa fa-shopping-cart"></i></button>
        </div>
      </div>

        <p class="gis-text-blue">Kamisato Ayato<br><b>$45</b></p>
      </div>
    </div>
  </div>


  
  <!-- Subscribe section -->
  <div class="gis-container gis-black gis-padding-32">
    <h1>Subscribe</h1>
    <p>To get special offers and VIP treatment:</p>
    <p><input class="gis-input gis-border" type="text" placeholder="Enter e-mail" style="width:100%"></p>
    <button type="button" class="gis-button gis-red gis-margin-bottom">Subscribe</button>
  </div>
  
  
  <!-- Footer -->
  <footer class="gis-padding-64 gis-light-grey gis-small gis-center" id="footer">
    <div class="gis-row-padding">
        
      <div class="gis-col s4">
        <h4>Contact</h4>
        <p>Questions? Go ahead.</p>
        <form action="/action_page.php" target="_blank">
          <p><input class="gis-input gis-border" type="text" placeholder="Name" name="Name" required></p>
          <p><input class="gis-input gis-border" type="text" placeholder="Email" name="Email" required></p>
          <p><input class="gis-input gis-border" type="text" placeholder="Subject" name="Subject" required></p>
          <p><input class="gis-input gis-border" type="text" placeholder="Message" name="Message" required></p>
          <button type="submit" class="gis-button gis-block gis-black">Send</button>
        </form>
      </div>

      <div class="gis-col s4">
        <h4>About</h4>
        <p><a href="#">About us</a></p>
        <p><a href="#">Support</a></p>
        <p><a href="#">Payment</a></p>
        <p><a href="#">Gift card</a></p>
      </div>

      <div class="gis-col s4 gis-justify">
        <h4>Store</h4>
        <p><i class="fa fa-fw fa-map-marker"></i> GIS Group </p>
        <p><i class="fa fa-fw fa-phone"></i> 0523234878732</p>
        <p><i class="fa fa-fw fa-envelope"></i> Genshingang@mail.com</p>
        <h4>We accept</h4>
        <p><i class="fa fa-fw fa-cc-amex"></i> Amex</p>
        <p><i class="fa fa-fw fa-credit-card"></i> Credit Card</p>
        <br>
      </div>
    </div>
  </footer>

  <div class="gis-black gis-center gis-padding-24">Sponsor by Genshin GANG</div>

  <!-- End page content -->
</div>

<!-- Newsletter Modal -->
<div id="newsletter" class="gis-modal">
  <div class="gis-modal-content gis-animate-zoom" style="padding:32px">
    <div class="gis-container gis-white gis-center">
      <i onclick="document.getElementById('newsletter').style.display='none'" class="fa fa-remove gis-right gis-button gis-transparent gis-xxlarge"></i>
      <h2 class="gis-wide">NEWSLETTER</h2>
      <p>Join our mailing list to receive updates on new arrivals and special offers.</p>
      <p><input class="gis-input gis-border" type="text" placeholder="Enter e-mail"></p>
      <button type="button" class="gis-button gis-padding-large gis-red gis-margin-bottom" onclick="document.getElementById('newsletter').style.display='none'">Subscribe</button>
    </div>
  </div>
</div>

<script>
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

</body>
</html>
