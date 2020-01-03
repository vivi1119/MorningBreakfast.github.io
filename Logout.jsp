<%@page contentType="text/html"%>
<%@page pageEncoding="utf-8"%>
<html>
<head><title></title></head>
<body>
<%
session.removeAttribute("email");
%>
<script>
     window.location='index.jsp';
     alert(" 已成功登出 (◓Д◒) "); 
</script>

</body>
</html>