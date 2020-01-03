<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@page import="java.io.*,java.util.*, javax.servlet.*" %>
<% request.setCharacterEncoding("UTF-8");%>
<%@include file="config.jsp" %>
<%@page import="java.text.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<html>
	<head>
		<title>
		</title>
	</head>
	<body>

<%
			SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date datee = new Date();
			String strDate = sdFormat.format(datee);
			out.print(strDate);
		String itt = "INSERT allyoubought(when) VALUES ('"+(sdFormat.format(datee)).toString() +"')";
						con.createStatement().execute(itt);
%>

		</body>
</html>