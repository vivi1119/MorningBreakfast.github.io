<!DOCTYPE html>
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
 	
  <script src="assets/js/function setTotal.js"></script>



</head>
<body style="background-color:#F6E6C5 ; overflow-x: hidden;">
    <div  id="header2">
      <div id="title" >
      <a href="index.jsp"> <font id="title-font">
      Morning<br>
      Breakfast
      </font>
      </a>
     
      </div>
    <img src="img/sun.png" id="sun">
    
	<% 	
			sql="select email from comsumer where email='" + session.getAttribute("email")+"'"; 
			ResultSet rrs=con.createStatement().executeQuery(sql);  
			if(rrs.next()) { //已登入
	 %>
   <a href="car.jsp">
      <div id="shoppingcart1">
      <img src="img/shopping-cart.png" >
      </div>
   </a>
		<%}%>
	<%
		if(session.getAttribute("email")==null)
		{
			sql="select email from comsumer where email='" + session.getAttribute("email")+"'"; 
			ResultSet rs=con.createStatement().executeQuery(sql); 
			sql="select email from manager where email='" + session.getAttribute("email")+"'"; 	
			ResultSet rss=con.createStatement().executeQuery(sql); 			
			if(!rs.next() || !rss.next()) //未登入
			{ 	  
    %>			<div id="signin">
                   <a href = "signin.jsp" id="signin-font">
                     Sign in 
                    </a> 
				</div>
		<% }
		}
		else if(session.getAttribute("email")!=null)
		{
			sql="select email from comsumer where email='" + session.getAttribute("email")+"'"; 
			ResultSet rs=con.createStatement().executeQuery(sql);  
			sql="select email from manager where email='" + session.getAttribute("email")+"'"; 	
			ResultSet rss=con.createStatement().executeQuery(sql); 	
			if(rs.next() ) //登入
			{ %> 
				<div id="signin">
				  <a href = "Logout.jsp" id="signin-font">
					 Logout
				  </a>
				</div>
	<%		}
	        else if ( rss.next()) 
			{ %>
				<div id="signin">
				  <a href = "Logout.jsp" id="signin-font">
					 Logout
				  </a>
				</div>
				<div id="back">
					<a href = "back.jsp" id="back-font">
						後台 
					</a>
				</div>
		<%	}
	    }%>
    

	<nav id="header3" >
     <ul  id="main">
          <li><a  href="menu.jsp" style="font-size:35px;color:#FFFFFF">MENU</a>  
           
          </li>
          <li><a href="#" style="font-size:35px;color:#FFFFFF">MEMBER</a> 
            <ul class="drop">
            <div >
              <li style="font-size:25px;"><a href="qa.jsp" style="font-size:23px; color:#FFFFFF;">Q&A</a></li>
           <% 	
		if(session.getAttribute("email")!=null)
		{
			sql="select email from comsumer where email='" + session.getAttribute("email")+"'"; 
			ResultSet rs=con.createStatement().executeQuery(sql);  
			if(rs.next()) //已登入
			{ %>
              <li style="font-size:25px;"><a href="information.jsp" style="font-size:23px; color:#FFFFFF;">INFORMATION</a></li>
		 <% } 
		}%>
		<%if(session.getAttribute("email")!=null)
		{
			sql="select email from comsumer where email='" + session.getAttribute("email")+"'"; 
			ResultSet rs=con.createStatement().executeQuery(sql);  
			if(rs.next()) //已登入
		{ %>
              <li style="font-size:25px;"><a href="check.jsp" style="font-size:23px; color:#FFFFFF;">ORDER</a></li>
		 <% } 
		}%>   
            </div>
            </ul> 
          </li>
          <li><a href="#" style="font-size:35px;color:#FFFFFF">CONTACT US</a> 
            <ul class="drop">
            <div >
              <li style="font-size:25px;"><a href="about.jsp" style="font-size:23px; color:#FFFFFF;">ABOUT US</a></li>
            </div>
            </ul> 
          </li>
          <div id="marker"></div>
        </ul>
    </nav>

	<% String sql_2="select * from comsumer where email='"+session.getAttribute("email")+"'"; 
	   ResultSet rs_0=con.createStatement().executeQuery(sql_2);
	   rs_0.next(); 
	   String sql_3="select * from state " ; 
	   ResultSet rs_3=con.createStatement().executeQuery(sql_3);
	   rs_3.next(); 	   %>

    <div id="d1">
    	Step1.確認訂單位置/付款資訊
    </div>
    <div id="d2">
    	Step2.確認訂單數量
    </div>
    <div id="d3">
    	Step3.訂購成功
    </div>
	<form method="get" action="fuck.jsp> 
	<div>
	<div>
	    <div id="e">
    </div>
      <div id="contact">
        確認訂單位置/付款資訊
      </div>
	 
      <div id="e2">
	  
    
        1. &ensp;訂購人的姓名<p>
         <input type="text" id="input1" value=<%=rs_0.getString(2)%>  name="name" readonly="readonly"><p>
        2. &ensp;訂購人的E-mail<p>
        <input type="text" id="input1" value=<%=rs_0.getString(3)%> name="email" readonly="readonly"><p>
		3. &ensp;取貨及付款方式<p>
        <input type="text" id="input1" value=<%=rs_3.getString(1)%> name="email" readonly="readonly"><p>
		4. &ensp;訂購日期<p>
        <input type="text"  id="myDate" readonly="readonly" name="datee" readonly="readonly"><p>
		
	
    <SCRIPT LANGUAGE="JavaScript"> 
	var now = new Date(); 
	myDate.value=now.getFullYear() + "-"+ (now.getMonth()+1)+"-"+now.getDate(); 
	</SCRIPT> 

      </div>

   </div>
   </div>
  	 </form>	
<div id="step2">
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
			<%
                    con.createStatement().execute("USE test");
//Step 4: 執行 SQL 指令
                    int fucking = 0 ;
                    String sqll = "SELECT * FROM car WHERE email='"+session.getAttribute("email")+"'";
                    //SQL語法，選擇要顯示的欄位。
                    ResultSet rec = con.createStatement().executeQuery(sqll);
                    int carrisnull = 0 ;

%>
            <tbody>
			<% 
              while (rec.next()){
					carrisnull++ ;
                    int howmany = Integer.valueOf(rec.getString(5)); 
                    int price = Integer.valueOf(rec.getString(4)); 
                    int sum = howmany * price ;
                    fucking += sum ;
					String sortt = rec.getString(7);
					String pid = rec.getString(1);
                    String kindsstring = rec.getString(3);
										String sqlaa = "UPDATE car SET subtotal = '"+sum+"' WHERE id = '"+pid+"' ";
                    con.createStatement().execute(sqlaa);
                    %>
                <tr>
                    <form  action = "regret.jsp" ><td class="name"> <input type="submit" value = "刪除" ><%=kindsstring%></td><input hidden value ="<%= sortt %>" name = "sorting" /></form>
                    <td class="quantity">
                    <%=howmany%> 
          
                    </td>
                    <td class="price">
                        <input type="hidden" id="price0" value="65" />
                        <%=price%>
                    </td>
                    <td >
                        <span id="total" > <%=sum%> <script>total();</script>
                    </td>
                </tr>
				
			  <%}
%>
                <tr>

               
                    <td colspan="3" class="cart_total">
                        

                    </td>
                    <td>
                        <span class="red">總計:<span id="total"> <%=fucking%> 元
                    </td>
                </tr>

                  <tr>

               
                    <td colspan="3" class="cart_total">
                        
                        請幫我再次確認您的訂單~
                    </td>
                    <td>
                       <button type="submit"><a href="discard.jsp" style="color:white" >結帳</button>
                    </td>
                </tr>
            </tbody>
        </table>

        
</div>
    

	</body>

	</html>