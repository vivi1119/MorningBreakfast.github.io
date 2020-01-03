<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<!DOCTYPE html>
<html lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<head>
<title>新增代碼</title>
<style>
	body
	{
		background-color:#f3f3f3;
	}
	table,td
	{
		font-family:"微軟正黑體";
		margin-top: 100px;
		text-align:center;
		border:2px solid #8cadac;
		padding:5px;
		border-collapse:collapse;
	}	
	.padding
	{
		padding:7px;
		width:220px;
	}
	.submit
	{
		padding:5px;
		background-color:#d8e6e7;
		border:1px solid #8cadac;
		font-family:"微軟正黑體";
	}
</style>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");	
	String id = request.getParameter("id");
	String sql_get="SELECT * FROM product WHERE id='"+id+"'"; 
	ResultSet rs_get =  con.createStatement().executeQuery(sql_get);
						
	if(rs_get.next())
	{
		String kind=rs_get.getString(2);
		String atype=rs_get.getString(3);
		String photo=rs_get.getString(6);
		String price=rs_get.getString(4);
		String stock=rs_get.getString(5);
	%>
	<center>
		<table>
		<form action="productupdate2.jsp" method="post">
			<tr><td><b>請修改以下欄位</td></tr>
			<tr><td><b>商品編號：<input type="text" name="id" value="<%=id%>" readonly="readonly" required oninvalid="setCustomValidity('商品編號不能為空值');" oninput="setCustomValidity('');" class="padding"></td></tr>
			<tr><td><b>商品名稱：<input type="text" name="kind" value="<%=kind%>" required oninvalid="setCustomValidity('商品名稱不能為空值');" oninput="setCustomValidity('');" class="padding"></td></tr>
			<tr><td><b>商品類別：<input type="text" name="type" value="<%=atype%>" required oninvalid="setCustomValidity('商品類別不能為空值');" oninput="setCustomValidity('');" class="padding"></td></tr>
			<tr><td><b>商品圖片：<input type="text" name="photo" value="<%=photo%>" required oninvalid="setCustomValidity('圖片檔案不能為空值');" oninput="setCustomValidity('');" placeholder="請輸入圖片" class="padding"></td></tr>
			<tr><td><b>商品價錢：<input type="text" name="price" value="<%=price%>" required oninvalid="setCustomValidity('價錢不能為空值');" oninput="setCustomValidity('');" class="padding"></td></tr>
			<tr><td><b>商品庫存：<input type="text" name="stock" value="<%=stock%>" required oninvalid="setCustomValidity('庫存不能為空值');" oninput="setCustomValidity('');" class="padding"></td></tr>
						
			<td><input type="submit" name="確定" value="確定" class="submit"></td>
		</form>
		</table>
	</center>
	<%}
	else
	{ %>    
	<script>
		window.location='productmodify.jsp';
		alert("輸入商品編號有誤");  /*返回後新的那頁重新整理*/
		</script>
	<%
	}%>
</body>
</html>
