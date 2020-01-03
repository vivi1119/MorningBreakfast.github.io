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
		String sql_4="select email from manager where email='" + session.getAttribute("email")+"'"; 	
		ResultSet rss_4=con.createStatement().executeQuery(sql_4); 	

if(session.getAttribute("email")==null){
%>
<script>
     window.location='signin.jsp';
     alert(" 請先登入 (◓Д◒) "); 
</script>

<%
}
else if ( rss_4.next()){ %>
	<script>
     window.location='index.jsp';
     alert(" 為保障會員權益請換成會員帳號燈入 (◓Д◒) "); 
    </script>
	
<%}
else{
%>
<%

	   String sql_2="select * from comsumer where email='"+session.getAttribute("email")+"'"; 
	   ResultSet rs_0=con.createStatement().executeQuery(sql_2);
	   rs_0.next();  
	   String name = rs_0.getString(2);			
				

					
					String howmany = request.getParameter("quantity");
					String pid = request.getParameter("id");
					String keyword = request.getParameter("search_word") ;
                    con.createStatement().execute("USE test");
					
					String sqllcatch = "SELECT sort FROM sort ";
                    ResultSet reccatch = con.createStatement().executeQuery(sqllcatch);
					reccatch.next();
					String sortstring = reccatch.getString(1);
					int changing = Integer.valueOf(sortstring);
                    String sqll = "SELECT id, kinds, price, stock FROM product WHERE  id = '"+pid+"' ";
                    ResultSet rec = con.createStatement().executeQuery(sqll);
					rec.next();
						String amount = howmany ; 
						String stockstring = rec.getString(4);
						String pricestring = rec.getString(3);
						String kindsstring = rec.getString(2);
						
                    int outofstock = 0 ;
					int num1 = Integer.valueOf(stockstring);
					int num2 = Integer.valueOf(amount);
					if (num2 > num1){
						outofstock = 1 ;
					}
					if( outofstock < 1 && session.getAttribute("email")!=null ) {	
					
						String intocar = "INSERT car(email,howmany,price,product,sort,name)" +
                                 "VALUES ('"+session.getAttribute("email")+"','"+howmany+"','"+pricestring+"','"+kindsstring+"','"+sortstring+"','"+name+"')";
						con.createStatement().execute(intocar);
						changing++ ;
						int aftersel = Integer.valueOf(rec.getString(4)) - Integer.valueOf(howmany) ;
					
						String sqla = "UPDATE product SET stock = '"+aftersel+"' WHERE id = '"+pid+"' ";
						con.createStatement().execute(sqla);
						
						String sqlarenew = "UPDATE sort SET sort = '"+changing+"' ";
						con.createStatement().execute(sqlarenew);
					}
					
                    if ( session.getAttribute("email")!=null  && outofstock < 1 ) {
                
                     //可回傳異動數
					
%>
					<script>
						window.location='menu.jsp';
						alert(" 加入成功 :) "); 
					</script>
<%                        
					}
					else {
						%>
					<script>
						window.location='menu.jsp';
						alert(" 來亂的是不是 !?(･_･;? "); 
					</script>
						
						<%
					}
}
					con.close();
							
                          





%>

		</body>
</html>