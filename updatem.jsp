<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<!DOCTYPE html>
<%
		String newone=request.getParameter("newone");
		String newtwo=request.getParameter("newtwo");
		String name=request.getParameter("name");
		String email=request.getParameter("email");

		if(newtwo=="" || newtwo==null)
		{
			session.removeAttribute("email");
			sql="UPDATE manager SET name='"+name+"' WHERE email='"+email+"'";
			con.createStatement().execute(sql);
			out.print("<script>alert('管理員資料更改成功!!');  window.location.href = 'signin.jsp' </script>");			
		}
		else 
		{
			if ( newone.equals(newtwo) ) {
			session.removeAttribute("email");
			sql="UPDATE manager SET password='"+newtwo+"',name='"+name+"' WHERE email='"+email+"'";
			con.createStatement().execute(sql);
			out.print("<script>alert('管理員資料更改成功!!');   window.location.href = 'signin.jsp' </script>");
			} // if()
			else {
			 out.print("<script>alert('密碼輸入不一致，請重新修改資料!!');  self.location=document.referrer; </script>");		
			}
		}

%>
