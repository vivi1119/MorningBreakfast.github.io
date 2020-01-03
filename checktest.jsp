<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<% request.setCharacterEncoding("UTF-8");%>
<%

  
if(request.getParameter("email") !=null && request.getParameter("password") != null){
	
    sql = "SELECT * FROM comsumer WHERE email='" +request.getParameter("email") + "'  AND password='" + request.getParameter("password") + "'"  ; 
    ResultSet paperrs =con.createStatement().executeQuery(sql);
	sql = "SELECT * FROM manager WHERE email='" +request.getParameter("email") + "'  AND password='" + request.getParameter("password") + "'"  ; 
    ResultSet paperrss =con.createStatement().executeQuery(sql);
	
    if( paperrs.next() ){         
	    out.print("<script>alert('登入成功 ก็ʕ•͡ᴥ•ʔ ก้  '); location.href= 'index.jsp'; </script>");
        session.setAttribute("email",request.getParameter("email"));
    }
	else if ( paperrss.next() ) {
		out.print("<script>alert('哈囉管理員( ͡°͜ʖ͡°)'); location.href= 'index.jsp'; </script>");
        session.setAttribute("email",request.getParameter("email"));
    }
    else
        out.print("<script>alert('登入失敗！帳號或密碼錯誤 '); self.location=document.referrer; </script>");
}
%>