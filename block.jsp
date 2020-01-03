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

					
                    con.createStatement().execute("USE test");

						
					String sqll = "SELECT * FROM car WHERE  email = '"+session.getAttribute("email")+"' ";
                    ResultSet recc = con.createStatement().executeQuery(sqll);
					String sqlla = "" ;
					String sql_3="select * from state " ; 
					ResultSet rs_3=con.createStatement().executeQuery(sql_3);
					rs_3.next();	
					int price = 0 ;
					int amount = 0 ;
					int sum = 0 ;
					int detectcar = 0 ;
					while(recc.next()) {
						detectcar++ ;
						String idstring = recc.getString(1); 
						String emailstring = recc.getString(2);
						String productstring = recc.getString(3);
						String pricestring = recc.getString(4);
						String howmanystring = recc.getString(5);
						String name = recc.getString(9);
						String fuck = rs_3.getString(1);

						String subtotalstring = recc.getString(8);
						String intoallyoubought = "INSERT allyoubought(email,howmany,price,product,subtotal,name,fuck)" +
                                 "VALUES ('"+emailstring+"','"+howmanystring+"','"+pricestring+"','"+productstring+"','"+subtotalstring+"','"+name+"','"+fuck+"')";
								con.createStatement().execute(intoallyoubought); // 將購物車的資料嘉進購買紀錄裡

					sqlla = "SELECT selled FROM product WHERE  kinds = '"+productstring+"' ";  // 
                    ResultSet reccc = con.createStatement().executeQuery(sqlla);                
					reccc.next();
					price = Integer.valueOf(reccc.getString(1)); 
					amount = Integer.valueOf(howmanystring);
                    sum = amount + price ;

					String sqla = "UPDATE product SET selled = '"+sum+"' WHERE kinds = '"+productstring+"' ";
                    con.createStatement().execute(sqla);
					}
						
					String sqllll = "DELETE FROM car WHERE email = '"+session.getAttribute("email")+"' ";
                    // 該資料從溝務車移除
                    con.createStatement().executeUpdate(sqllll);	 
                    if ( session.getAttribute("email")!=null && detectcar > 0  ) {
                
                     //可回傳異動數
					
%>
					<script>
						window.location='email.jsp';
						alert(" 購買成功，去評論~~ ψ(｀∇´)ψ "); 
					</script>
<%                        
					}
					else {
						%>
					<script>
						window.location='menu.jsp';
						alert(" 購物車空空如也... 趕快去下單 ˊ_>ˋ "); 
					</script>>
						<%
					}
					con.close();
							
                          





%>

		</body>
</html>