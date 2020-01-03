<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<!DOCTYPE html>
<html lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<head>
<title>商品新增</title>
</head>
<body>

<%
				request.setCharacterEncoding("UTF-8");
				String pro_kinds=request.getParameter("kinds");
				String pro_type=request.getParameter("type"); 
				String pro_photo=request.getParameter("photo");
				String pro_price=request.getParameter("price");
				String pro_stock=request.getParameter("stock");  

				String sql_proadd = "INSERT product(kinds,type,photo,price,stock,selled)VALUES('"+pro_kinds+"','"+pro_type+"','"+pro_photo+"','"+pro_price+"','"+pro_stock+"','0')"; 

				int rs_proadd = con.createStatement().executeUpdate(sql_proadd);
					
				if(rs_proadd==1)
				{
				%>  <script>
					window.location='productmanange.jsp';
					alert("新增成功!!");  /*返回後新的那頁重新整理*/
					</script>
	<%			}
				else
				{%>           
					<script>
					window.location='productmanange.jsp';
					alert("新增失敗!!");  /*返回後新的那頁重新整理*/
					</script>
	<%				}		%>
</body>
</html>
