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
					
		if(paperrs1.next())
			out.print("<script>alert('此帳號已被註冊過!');  self.location=document.referrer; </script>");
		else if(paperrs.next())
			out.print("<script>alert('此帳號已被註冊過!');  self.location=document.referrer; </script>");
		else if(!paperrs.next() || !paperrs1.next())
		    int Z=(Math.round((float)Math.random()*10));
			int R=Z+1;

			sql = "INSERT comsumer(username,email,password,tel,birthday)" + "Values('"+request.getParameter("username") + "','" + request.getParameter("email") + "','" + request.getParameter("password") + "','" +  request.getParameter("tel") + "','" +  request.getParameter("birthday") )";
			boolean no= con.createStatement().execute(sql); //執行成功傳回false
			if (!no)
			{
				session.setAttribute("email",request.getParameter("email"));
				out.println("<script>alert('註冊成功!');  self.location=document.referrer; </script>");
			}
			else
				out.println("<script>alert('發生錯誤!');  self.location=document.referrer; </script>");
			}
				}
			else
				out.println("<script>alert('請填入名字、信箱、密碼!!');  self.location=document.referrer; </script>");
	
				
%>
