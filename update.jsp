<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<!DOCTYPE html>
<%
		String newone=request.getParameter("newone");
		String newtwo=request.getParameter("newtwo");
		String username=request.getParameter("username");
		String tel=request.getParameter("tel");
		String birthday=request.getParameter("birthday");
		String email=request.getParameter("email");

		if( ( newtwo=="" || newtwo==null ) && ( newone==null || newone=="" ))
		{
			session.removeAttribute("email");
			sql="UPDATE comsumer SET username='"+username+"',tel='"+tel+"',birthday='"+birthday+"' WHERE email='"+email+"'";
			con.createStatement().execute(sql);
			out.print("<script>alert('會員資料更改成功!!');  window.location.href = 'signin.jsp' </script>");
			
		}
		else 
		{
			if ( newone.equals(newtwo) ) {
			  session.removeAttribute("email");
			  sql="UPDATE comsumer SET password='"+newtwo+"',tel='"+tel+"' ,username='"+username+"',birthday='"+birthday+"' WHERE email='"+email+"'";
			  con.createStatement().execute(sql);
			  out.print("<script>alert('會員資料更改成功!!');   window.location.href = 'signin.jsp' </script>");
			} // if()
			else  {
			  out.print("<script>alert('密碼輸入不一致，請重新修改資料!!');  self.location=document.referrer; </script>");		
            } // else if()		
		}

%>
