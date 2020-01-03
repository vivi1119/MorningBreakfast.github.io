<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<!DOCTYPE html>
<html lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<head>
<title>管理員刪除</title>
</head>
<body>
<%
			sql="DELETE FROM manager WHERE id='"+request.getParameter("id")+"'";
			int rs=con.createStatement().executeUpdate(sql);
			if(rs==1)
			{%>
				<script>
				window.location='manangerdelete.jsp';
				alert("管理員刪除成功!!");
				</script>
			<%}
			else
			{%>
				<script>
				window.location='manangerdelete.jsp';
				alert("沒有此管理員");
				</script>
			<%}
%>
</body>
</html>