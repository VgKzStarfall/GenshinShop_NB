
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
        <title>Wallet System</title>
        <style>
            .gis-sidebar a {font-family: "Roboto", sans-serif}
            body,h1,h2,h3,h4,h5,h6,.gis-wide {font-family: "Montserrat", sans-serif;}
            .gis-link {
                display: flex;
                justify-content: space-between;
                flex-direction: row;
            }
            .link {
                background-color:#673ab7;
                padding: 20px;
                text-decoration: none;
                text-align: center;
                color: white;
                text-transform: uppercase;
                font-size: 30px;
                font-weight: bold;

            }
            .link:hover {
                background-color:#607d8b;
            }

            .wallet-info{
                display: block;
                background-color: white;
                margin-top: 20px;
            }
/*            td{
                text-align: center;
                font-size: 20px;
            }
            th{
                font-size: 30px;
            }*/
            table, th, td {
                border-collapse: collapse;
            }
            th, td {
                padding: 20px;
                font-size: 20px;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <nav class="gis-sidebar gis-bar-block gis-black gis-collapse gis-top" style="z-index:3;width:250px" id="mySidebar">

            <div class="gis-container gis-display-container gis-padding-16">
                <i onclick="gis_close()" class="fa fa-remove gis-hide-large gis-button gis-display-topright"></i>
                <img src="media\logo.gif" style="width:100%" onclick="checkses(${sessionScope.acc})">
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

                <form action="sellservlet" method="GET">
        <input type="hidden" value="${sessionScope.acc.username}" name="acc"/>
        <input type="submit" class="gis-bar-item gis-button" value="SELL ACCOUNT">
    </form>
    <form action="auctionservlet" method="GET">
        <input type="hidden" value="${sessionScope.acc.username}" name="acc"/>
        <input type="submit" class="gis-bar-item gis-button" value="AUCTION">
    </form>
                <a class="gis-bar-item gis-button" style="color:black; background-color:white">WALLET SYSTEM</a>
            </div>

            <a href="#footer" class="gis-bar-item gis-button gis-padding">Contact</a> 
            <a href="javascript:void(0)" class="gis-bar-item gis-button gis-padding" onclick="document.getElementById('newsletter').style.display = 'block'">Newsletter</a> 
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
                <p class="gis-left" style="margin-left:30%; color:white">WALLET SYSTEM</p>
            </header>
            <div class="gis-link">
                <a class="link" href="transactionservlet">Transaction History</a>
                <a class="link" href="rechargeservlet">Recharge</a>
                <a class="link" href="withdraw.jsp">Withdraw</a>
                <a class="link" href="#">Payment Method</a>
            </div>
            <div class="wallet-info">

                <table style="width:75%">
                    <tr>
                        <th>Wallet ID</th>
                        <td>${list[i].walletID}</td>
                    </tr>
                    <tr>
                        <th>Username</th>
                        <td>${list[i].username}</td>
                    </tr>
                    <tr>
                        <th>Balance</th>
                        <td>${list[i].balance}</td>
                    </tr>
                </table>
            </div>
    </body>

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
</html>
