<%@include file="config.jsp" %>
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.* , java.util.Scanner" %>


<html>
	<head>
		<title>
		</title>
	</head>
	<body>
<%
if(session.getAttribute("email")==null){
%>
<script>
     window.location='signin.jsp';
     alert(" 請先登入 (◓Д◒) "); 
</script>

<%
}
%>
<%
				java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMddHHmmss");    
				java.util.Date currentTime_1 = new java.util.Date(); 
				con.createStatement().execute("USE test");
				
					String sortnumber = request.getParameter("sorting"); // 抓從購物車刪除鈕的商品id
                    
					String sqlls = "SELECT product  FROM car WHERE  sort = '"+sortnumber+"' ";
                    ResultSet recs = con.createStatement().executeQuery(sqlls);
					recs.next();
						String productstring = recs.getString(1); // 用序號抓那筆訂單的商品名稱
					
					
					
                    String sqll = "SELECT stock  FROM product WHERE  kinds = '"+productstring+"' "; // 用商品名稱抓存貨
                    ResultSet rec = con.createStatement().executeQuery(sqll);
					rec.next();
						String stockstring = rec.getString(1); 
						
						
					String sqlll = "SELECT howmany  FROM car WHERE  sort = '"+sortnumber+"' ";
                    ResultSet recc = con.createStatement().executeQuery(sqlll);
					recc.next();
						String back = recc.getString(1); // 抓加進購物車的數量
						
						
					int aftersel = Integer.valueOf(stockstring) + Integer.valueOf(back) ; // 把退回的數量加回庫存
					String sqla = "UPDATE product SET stock = '"+aftersel+"' WHERE kinds = '"+productstring+"' ";
                    con.createStatement().execute(sqla);	
						
					String sqllll = "DELETE FROM car WHERE sort = '"+sortnumber+"' ";
                    // 該資料從溝務車移除
                    con.createStatement().executeUpdate(sqllll);	

						
                    
                    
					
					
					
					
                    
                    if ( session.getAttribute("email")!=null ) {
                
                     //可回傳異動數
					
%>
					<script>
						window.location='car.jsp';
						alert(" 刪除成功 ^>^ "); 
					</script>>
<%                        
					}
					con.close();
							
                          





%>

		</body>
</html>