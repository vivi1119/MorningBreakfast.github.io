<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<!DOCTYPE html>
<html language="en">
<head>
	<title>傳送聯絡我們</title>
</head>
<body>
<%

				      if(request.getParameter("name")!=null || request.getParameter("email")!=null||request.getParameter("date")!=null ||request.getParameter("coment")!=null)
				       {
						sql="INSERT board(name,email,date,comment)"+"VALUE('"+request.getParameter("name")+"','"+request.getParameter("email")+"','"+request.getParameter("date")+"','"+request.getParameter("coment")+"')";
						boolean no= con.createStatement().execute(sql); //執行成功傳回false
						//int no=con.createStatement().executeUpdate(sql); //可回傳異動數
							if (!no)
								out.println("<script>alert('已成功送出評論!');  window.location.href = 'index.jsp' </script>");
							else
								out.println("評論傳送失敗");  
					   }

%>
</body>
</html>