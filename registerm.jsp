<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%
  if(request.getParameter("email") !=null && request.getParameter("password") != null)
  {	
	sql = "SELECT * FROM comsumer WHERE email='" +request.getParameter("email")+ "'" ; 
	ResultSet paperrs =con.createStatement().executeQuery(sql);
					
	sql = "SELECT * FROM manager WHERE email='" +request.getParameter("email")+ "'" ; 
	ResultSet paperrs1 =con.createStatement().executeQuery(sql);
					
	if(paperrs1.next()) {
		out.print("<script>alert('此email已被註冊過!');  self.location=document.referrer; </script>");
	}
	else if(paperrs.next()) {
		out.print("<script>alert('此email已註冊過了!');  self.location=document.referrer; </script>");
	}
	else if(!paperrs.next() || !paperrs1.next()) {
	
        sql = "INSERT manager(name,email,password)" + 
		      "VALUES ('"+request.getParameter("name") + "','" + request.getParameter("email") + "','" + request.getParameter("password") + "')";
		boolean no= con.createStatement().execute(sql); //執行成功傳回false
		//int no=con.createStatement().executeUpdate(sql); //可回傳異動數
		if (!no)
		{
			out.println("<script>alert('管理員註冊成功!');  self.location=document.referrer; </script>");
		}
		else {
			out.println("<script>alert('發生錯誤!');  self.location=document.referrer; </script>");
		}
	}
  }
	else {
	out.println("<script>alert('請填入名字、信箱、密碼!!');  self.location=document.referrer; </script>");
	}
  
	
				
%>
