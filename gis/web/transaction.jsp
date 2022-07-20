<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        <title>Transaction History</title>
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
                <p class="gis-left" style="margin-left:35%; color:white">WALLET SYSTEM</p>

            </header>

    </body>
    <style>
        .payment-info {
            margin-top: 20px;
            background-color: #f2f2f2;
            padding: 20px;
        }
        table {
            /*background-image:url(media/auction.png);*/
            background-size:1250px 780px;
            background-repeat:no-repeat;
            padding: 30px;
            padding-left:100px;
            /*color:white;*/
            border: 1px white;
            border:none;
            margin-left:7%;
            font-size:150%;
        }
        th {
            background-color:black;
            color:white;
        }
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

    </style>
    <div class="gis-link">
        <a class="link" href="transaction.jsp">Transaction History</a>
        <a class="link" href="recharge.jsp">Recharge</a>
        <a class="link" href="withdraw.jsp">Withdraw</a>
        <a class="link" href="#">Payment Method</a>
    </div>
    <div class="payment-info">
        <table>
            <thead>
                <tr>
                    <th>Payment ID</th>
                    <th>Wallet ID</th>
                    <th>Method</th>
                    <th>Balance</th>
                    <th>Date</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <input id="text" type="hidden" value=""/>
                <c:forEach items="${pList}" var="pay"> 
                    <tr>
                        <td>${pay.paymentID}</td>
                        <td>${pay.walletID}</td>
                        <td>${pay.method}</td>
                        <td>${pay.value}</td>
                        <td>${pay.date}</td>
                        <td>
                            <button onclick='document.getElementById("${pay}").style.display="block";document.getElementById("text").value="${pay.paymentID}";'>Generate Invoice</button>
                            <div id='${pay}' style="display:none;position:absolute;z-index:10;background-color:white;border:1px solid black;border-radius:100px;top:250px;left:400px;right:300px;bottom:50px;">
                                <img onclick='document.getElementById("${pay}").style.display="none"' src='media/close.jpg' width="5%" height="auto" style="position:absolute;border-radius:60%;margin-left:90%;margin-top:2%;"/>
                                <div id="${pay.paymentID}">                             
                                <img src="media/Genshin-Impact-Logo.png" width="200px" height="auto" style="margin-left:39%;top:-20px"/>
                                <h1 style="font-size:150%;color:white;background-color:black;text-align:center;"> INVOICE </h1>         
                                <h3 style="position:absolute;margin-left:8%;margin-top:10px;font-size:150%;"> Genshin Impact Shop </h3>
                                <h4 style="position:absolute;margin-left:5%;margin-top:-50px;color:white;"> User: ${sessionScope.acc.username}</h4>
                                <div style="margin-left:70%;margin-top:30px;">
                                <h4> Payment ID: ${pay.paymentID}</h3>
                                <h4> Date: ${pay.date}</h4>
                                
                                </div>
                                <div style="text-align:center;margin-top:30px;">
                                <c:if test="${pay.value>0}">
                                    <h4> Balance increased: <a style="font-weight:bold;font-size:150%;">${pay.value}$</a></h4>
                                </c:if>
                                <c:if test="${pay.value<0}">
                                <h4> Balance decreased: <a style="font-weight:bold;font-size:150%;">${pay.value}</a></h4>
                                </c:if>
                                <h4> Payment Method: <a style="font-weight:bold;text-transform:capitalize;">${pay.method}</a></h4>
                                <h4>Status: <a style="font-weight:bold;">SUCCESS</a></h4>
                                </div>
                            </div>
                                <button style="margin-left:39%;color:white;background-color:black;" onmouseout="this.style='margin-left:40%;color:white;background-color:black;'" onmouseover="this.style='margin-left:40%;color:black;background-color:grey;'" onclick="generatePDF()">Download as PDF</button>
                            </div>
                                <script>
                                    function generatePDF() {
                                        var x = document.getElementById("text").value;
				// Choose the element that our invoice is rendered in.
				const element = document.getElementById(x);
				// Choose the element and save the PDF for our user.
                                html2pdf().from(element).save();
			}
                                </script>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
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
