<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>後台</title>

  <link rel="stylesheet" type="text/css" href="assets/css/back.css">

  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  
</head>

<body style="background-color:#F6E6C5;">
<%if(session.getAttribute("email")!=null)
{
	sql="select name from manager where email='" + session.getAttribute("email")+"'"; 
	ResultSet rs=con.createStatement().executeQuery(sql);
	rs.next();
	String name=rs.getString(1);%>
  <div id="head">
    <p id="user" style="position:relative; left:600px; top: -5px;  font-face="微軟正黑體"; font-weight: bold;"><%=name%>管理員歡迎進入修改商品頁面</p>
    <a href="index.jsp"><p id="backindex">回首頁</p></a>
  </div>
<%}%>



<div class="w3-sidebar w3-bar-block w3-light-grey w3-card" style="width:20%;" id="sidebar">
   
  <div class="w3-dropdown-hover">
    <button class="w3-button">商品管理
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="w3-dropdown-content w3-bar-block">
      <a href="productmanange.jsp" class="w3-bar-item w3-button">商品新增</a>
      <a href="productdelete.jsp" class="w3-bar-item w3-button">商品刪除</a>
      <a href="productmodify.jsp" class="w3-bar-item w3-button">商品修改</a>
	   <a href="productlist.jsp" class="w3-bar-item w3-button">商品列表</a>
    </div>
  </div> 

  <div class="w3-dropdown-hover">
    <button class="w3-button">訂單管理
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="w3-dropdown-content w3-bar-block">
	 <a href="listmodify.jsp" class="w3-bar-item w3-button">訂單修改</a>
      <a href="all-list.jsp" class="w3-bar-item w3-button">訂單列表</a>
    </div>
  </div> 
  <a href="message.jsp" class="w3-bar-item w3-button">查看訊息</a>
  
  <div class="w3-dropdown-hover">
    <button class="w3-button">管理員管理
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="w3-dropdown-content w3-bar-block">
	  <a href="manangerplus.jsp" class="w3-bar-item w3-button">管理員新增</a>
      <a href="manangerrevise.jsp" class="w3-bar-item w3-button">管理員修改資料</a>
    </div>
  </div>
</div>


  <div style="margin-left:30%">

  </div>
<!---放東西的地方--->
<div id="b">

  <div id="c">
   <center>
<table>
	<tr>
		<form action="productupdate1.jsp" method="post">
		<tr><td><br><b><center><h2><font face="monospace"><b>商品修改</b></font></h3></center></br></td></tr>
		<tr><td><input type="text" name="id" required oninvalid="setCustomValidity('請輸入商品編號');" oninput="setCustomValidity('');" placeholder="請輸入商品編號" class="padding"></td></tr>
		<td><br><center><input type="submit" name="確定" value="確定" class="submit"></center></br></td>
		</form>
	</tr>
</table>
</center>
  </div>

</div>


</body>
</html>