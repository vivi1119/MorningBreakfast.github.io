<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<!DOCTYPE html>
<html lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<head>
<title>商品修改</title>
</head>
<body>
<%
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String kind = request.getParameter("kind");
		String atype = request.getParameter("type");
		String photo = request.getParameter("photo");
		String price = request.getParameter("price");
		String stock = request.getParameter("stock");
						
		String sql_proupdate="UPDATE product SET kinds= '"+kind+"',type= '"+atype+"',photo= '"+photo+"',price= '"+price+"',stock= '"+stock+"' WHERE id='"+id+"'"; 
		int rs_proupdate=con.createStatement().executeUpdate(sql_proupdate);
		if(rs_proupdate==1)
		{%>
			<script>
			window.location='productmodify.jsp';
			alert("修改成功");
			</script>
		<%}
		else{%>
			<script>
			window.location='productmodify.jsp';
			alert("修改失敗");
			</script>
		<%}

%>
</body>
</html>