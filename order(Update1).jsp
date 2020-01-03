<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<!DOCTYPE html>
<html lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<head>
<title>訂單修改</title>
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
					String id = request.getParameter("id");
					String sql_get="SELECT * FROM allyoubought WHERE id='"+id+"'"; 
					ResultSet rs_get =  con.createStatement().executeQuery(sql_get);
					
					if(rs_get.next())
					{
						String o_state=rs_get.getString(8);
					%>
					
					<center>
						<table>
							<form action="order(Update2).jsp" method="post">
							<tr><td><b>請修改訂單狀態</td></tr>
							<tr><td><b>接單狀態：<input type="text" name="state" value="<%=o_state%>" required oninvalid="setCustomValidity('接單狀態不能為空值');" oninput="setCustomValidity('');" class="padding"></td></tr>
							<td><input type="text" name="id" value="<%=id%>" hidden>
							<input type="submit" name="確定" value="確定" class="submit"></td>
							</form>
						</table>
					</center>
					<%}
					else
					{
                  %>    <script>
						window.location='listmodify.jsp';
						alert("輸入商品編號有誤");  /*返回後新的那頁重新整理*/
						</script>
					<%
					}

%>
</body>
</html>
