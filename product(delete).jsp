<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<% request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<head>
<title>商品刪除</title>
</head>
<body>
<%
					sql="DELETE FROM product WHERE id='"+request.getParameter("proid")+"'";
					int rs=con.createStatement().executeUpdate(sql);
					if(rs==1)
					{%>
						<script>
						window.location='product(show).jsp';
						alert("刪除成功");
						</script>
					<%}
					else
					{%>
						<script>
						window.location='product(delete).jsp';
						alert("沒有此項商品");
						</script>
					<%}
				}
			}
		 con.close();
			}
    catch (SQLException sExec) {
           out.println("SQL錯誤"+sExec.toString());
    }
}
catch (ClassNotFoundException err) {
   out.println("class錯誤"+err.toString());
}
%>
</body>
</html>