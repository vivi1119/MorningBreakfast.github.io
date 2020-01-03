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

  <link rel="stylesheet" type="text/css" href="assets/css/signin.css">
  <link rel="stylesheet" type="text/css" href="assets/css/signup.css">

</head>
<body style="background-color:#F6E6C5;">
<%if(session.getAttribute("email")!=null)
{
	sql="select name from manager where email='" + session.getAttribute("email")+"'"; 
	ResultSet rs=con.createStatement().executeQuery(sql);
	rs.next();
	String name=rs.getString(1);%>
  <div id="head">
    <p id="user" style="position:relative; left:600px; top: -5px;  font-face="微軟正黑體"; font-weight: bold;"><%=name%>管理員歡迎進入新增管理員頁面</p>
    <a href="index.jsp"><p id="backindex"><font size="4" face="微軟正黑體">回首頁</font></p></a>
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
  

<div class="form-bg">
    <div class="container2" >
        <div class="row sign size1 form" >
            <div class="col-md-offset-4 col-md-4 col-sm-offset-3 col-sm-6">
                <form class="form-horizontal" method="get" action="registerm.jsp">
                    <div class="heading">Sign Up Form</div>
                    <div class="form-group">
                        <i class="fa fa-user"></i><input required="" name="name" type="text" class="form-control" placeholder="Username" id="exampleInputEmail1">
                    </div>


                    <div class="form-group">
                        <i class="fa fa-user"></i><input required="" name="email" type="email" class="form-control" placeholder="E-mail" id="exampleInputEmail1">
                    </div>

                    <div class="form-group">
                        <i class="fa fa-lock"></i><input required="" name="password" type="password" class="form-control" placeholder="Password">
                    </div>



                    <div class="form-group">
                        <button type="submit" class="btn btn-default" ><i class="fa fa-arrow-right"></i></button>
                    </div>
                    
                </form>
            </div>
        </div>
    </div>
</div> 







</body>
</html>