<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<% request.setCharacterEncoding("UTF-8");%>


<%
String sql="";
try 
{
//Step 1: 載入資料庫驅動程式 
        	Class.forName("com.mysql.jdbc.Driver");
		try{
//Step 2: 建立連線  
			String url="jdbc:mysql://localhost/";
			Connection con=DriverManager.getConnection(url,"root","1234");   						
			if(con.isClosed())
				out.println("連線建立失敗"); 
//Step 3: 選擇資料庫			
			else
			{
				sql="use test";
				con.createStatement().execute(sql);
				request.setCharacterEncoding("UTF-8");
				String sql_0="SELECT * FROM manager WHERE email='"+session.getAttribute("email")+"'";
				ResultSet rs_11 =con.createStatement().executeQuery(sql_0);
				//不是使用者不能登入
				if(session.getAttribute("email")==null)
					 out.println("<script>alert('你不是管理員!');  window.location.replace('index.jsp'); </script>");
				else if(!rs_11.next())
					out.println("<script>alert('你不是管理員!');  window.location.replace('index.jsp'); </script>");
				else
				{
					if(request.getParameter("email") !=null && request.getParameter("password") != null)
					{	
						sql = "SELECT * FROM comsumer WHERE email='" +request.getParameter("email")+ "'" ; 
						ResultSet paperrs =con.createStatement().executeQuery(sql);
						
						sql = "SELECT * FROM manager WHERE email='" +request.getParameter("email")+ "'" ; 
						ResultSet paperrs1 =con.createStatement().executeQuery(sql);
						
						if(paperrs1.next())
							out.print("<script>alert('此email已被使用過!');  self.location=document.referrer; </script>");
						else if(paperrs.next())
							out.print("<script>alert('此email已被使用過!');  self.location=document.referrer; </script>");
						else if(!paperrs.next() || !paperrs1.next())
						{
							//增加到管理員的資料表
							sql = "INSERT manager(name,email,password)" + "Values('"+request.getParameter("name") + "','" + request.getParameter("email") + "','" + request.getParameter("password")+"')";
							boolean no= con.createStatement().execute(sql); //執行成功傳回false
							//int no=con.createStatement().executeUpdate(sql); //可回傳異動數

							if (!no)
							{
								session.setAttribute("email",request.getParameter("email"));
								out.println("<script>alert('成功!');  self.location=document.referrer; </script>");
							}
							else
								out.println("<script>alert('發生錯誤!');  self.location=document.referrer; </script>");
							
		
						}
					}
					else
						out.println("<script>alert('請填入名字、信箱、密碼!!');  self.location=document.referrer; </script>");
				}
//Step 4: 關閉連線
				con.close();	
			}
		}
		catch (SQLException sExec) {
			out.println("SQL錯誤!" + sExec.toString());
		}
}		
catch (ClassNotFoundException err) {
          out.println("class錯誤" + err.toString());
}
	
				
%>
