<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<!DOCTYPE html>
<html lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<head>
<title>商品刪除</title>
</head>
<body>
<%
			sql="DELETE FROM product WHERE id='"+request.getParameter("id")+"'";
			int rs=con.createStatement().executeUpdate(sql);
			if(rs==1)
			{%>
				<script>
				window.location='productdelete.jsp';
				alert("商品刪除成功!!");
				</script>
			<%}
			else
			{%>
				<script>
				window.location='productdelete.jsp';
				alert("沒有此項商品");
				</script>
			<%}
%>
</body>
</html>