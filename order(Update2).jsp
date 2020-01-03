<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<!DOCTYPE html>
<html lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<head>
<title>訂單修改2</title>
</head>
<body>
<%
					request.setCharacterEncoding("UTF-8");
					String id = request.getParameter("id");
					String o_state = request.getParameter("state");

					String sql_oupdate="UPDATE allyoubought SET fuck= '"+o_state+"' WHERE id='"+id+"'"; 
					int rs_oupdate=con.createStatement().executeUpdate(sql_oupdate);
					out.println(rs_oupdate);
					if(rs_oupdate>0)
					{%>
						<script>
						window.location='listmodify.jsp';
						alert("修改成功");
						</script>
					<%}
					else
					{
						
						%>
						<script>
						window.location='listmodify.jsp';
						alert("修改失敗");
						</script>
					<%}
%>
</body>
</html>