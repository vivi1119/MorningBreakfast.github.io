<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%
       sql = "INSERT allyoubought(when)" + 
		     "VALUES ('"+request.getParameter("datee")+"')";
		boolean no= con.createStatement().execute(sql); //執行成功傳回false
		if (!no)
		{
			session.setAttribute("email",request.getParameter("email"));
			out.println("<script>alert('會員註冊成功!');  location.href='signin.jsp'; </script>");
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
