<!DOCTYPE html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<html lang="en" >
<head>

	<meta charset="UTF-8">
	<title>Shopping</title>
	<link href="assets/css/index.css" rel="stylesheet" media="all">
  <link rel="stylesheet" type="text/css" href="assets/css/shopping.css">
  <!--字體/首頁-->
	<link href="https://fonts.googleapis.com/css?family=Amatic+SC|Boogaloo|Permanent+Marker&display=swap" rel="stylesheet">

  <!--search-->   
  <link rel="stylesheet" type="text/css" href="assets/css/default.css">
  <link rel="stylesheet" type="text/css" href="assets/css/component.css">
  <!--header-->
	<link rel="stylesheet" href="assets/css/style.css">
	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
 	

 	<link rel="stylesheet" href="assets/css/shopping.css">


 	<script src="assets/js/shopping.js"></script>
 	


</head>
<body style="background-color:#F6E6C5 ; overflow-x: hidden;">
    <div  id="header2">
      <div id="title" >
      <a href="index.html"> <font id="title-font">
      Morning<br>
      Breakfast
      </font>
      </a>
     
      </div>
    <img src="img/sun.png" id="sun">
    
   <a href="shopping.html">
    <div id="shoppingcart1">
      <img src="img/shopping-cart.png" >
    </div>
    </a>

    <div id="signin">
      <a href = "signin.html" id="signin-font">
        
      Sign in 
       
      </a>
    </div>
    

	<nav id="header3" >
     <ul  id="main">
          <li><a  href="hamburger.html" style="font-size:35px;color:#FFFFFF">MENU</a>  
           
          </li>
          <li><a href="#" style="font-size:35px;color:#FFFFFF">MEMBER</a> 
            <ul class="drop">
            <div >
              <li style="font-size:25px;"><a href="qa.html" style="font-size:23px; color:#FFFFFF;">Q&A</a></li>

               <li style="font-size:25px;"><a href="information.html" style="font-size:23px; color:#FFFFFF;">INFORMATION</a></li>
              
            </div>
            </ul> 
          </li>
          <li><a href="#" style="font-size:35px;color:#FFFFFF">CONTACT US</a> 
            <ul class="drop">
            <div >
              <li style="font-size:25px;"><a href="about.html" style="font-size:23px; color:#FFFFFF;">ABOUT US</a></li>
              <li style="font-size:25px;"><a href="email.html" style="font-size:23px; color:#FFFFFF;">E-mail</a></li>
            </div>
            </ul> 
          </li>
          <div id="marker"></div>
        </ul>
    </nav>



    <div id="d1">
    	Step1.確認訂單數量
    </div>
    <div id="d2">
    	Step2.確認訂單位置/付款資訊
    </div>
    <div id="d3">
    	Step3.訂購成功
    </div>

    <font id="contact2">
    	確認訂單數量
    </font>

    <table border="1" style="text-align: center;" align="center" id="table1">
            <thead style="height: 50">

                <td style="WIDTH: 300px">
                    商品名稱
                </td>
       
                <td style="WIDTH: 170px">
                    數量
                </td>
                <td style="WIDTH: 170px">
                    單價
                </td>
                <td style="WIDTH: 250px">
                    小計
                </td>

            </thead>
            <tbody>
                <tr>
                    <td class="name">卡啦厚漢堡</td>
                    <td class="quantity">
                        <input id="quantity1" value="1" onblur="total(1);" />
                    </td>
                    <td class="price">
                        <input type="hidden" id="price1" value="65" />
                        65
                    </td>
                    <td class="total">
                        <span id="smallTotal1"> 元
                    </td>
                </tr>

                <tr>
                    <td class="name">營養小肉豆</td>
                     <td class="quantity">
                        <input id="quantity2" value="2" onblur="total(2);" />
                    </td>
                    <td class="price">
                        <input type="hidden" id="price2" value="30" />
                        30
                    </td>
                    <td class="total">
                        <span id="smallTotal2"> 元
                    </td>
                </tr>
                <tr>
                    <td colspan="3" class="cart_total">
                        

                    </td>
                    <td>
                        <span class="red">總計:<span id="total">  元
                    </td>
                </tr>
            </tbody>
        </table>


    <div id="e">

   		<div id="contact">
   			確認訂單位置/付款資訊
   		</div>
   		<div id="e2">
   			1. &ensp;請輸入您的姓名<p>
   			(Please write down your name)<p>
   			 <input type="text" id="input1">
   		</div>
   		<div id="e3">
   			2. &ensp;請輸入您的電話<p>
   			(Please write down your phone number)<p>
        <input type="text" id="input1">
   		</div>

   		<button type="button" class="enter"><a href="check.html" style="color:white">送出</button>

   		
   	
   </div>
	</body>

	</html>