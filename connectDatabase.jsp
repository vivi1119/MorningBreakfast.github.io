<%@page contentType="text/html; charset=Big5" pageEncoding="Big5"%>
<!-- Step 0: import library -->
<%@ page import = "java.sql.*" %> 
<html>
    <head>
        <title>JSP Page</title>
    </head>
    <body> 
<%  	
    try {
//Step 1: ���J��Ʈw�X�ʵ{�� 
        	Class.forName("com.mysql.jdbc.Driver");	  
	//�ϥ�JDBC�h�s��MySQL�A�ҥH�Ӧ�y�k���N��A�N�O�n�i�D�q���ڭn�ϥ�JDBC
        try {
//Step 2: �إ߳s�u 
        	String url="jdbc:mysql://localhost/";
            Connection con=DriverManager.getConnection(url,"root","1234");   
		//�إ�connection(�s�u)���y�k�Aurl�N��کҭn�s����MySQL�ҦbIP�Aroot�O�b���A1234�O�K�X
		//���s�u�O���MmySql�s�u�A���O�M�s�bmySql�����S�w��Ʈw�s�u�C		
//Step 5: ��ܵ��G 				
		   if(con.isClosed())
		//con.isClosed()�|�^��True�άOfalse�Ӫ�ܬO�_�s�u���\
              out.println("�s�u�إߥ���");
           else
              out.println("�s�u���\");
//Step 6: �����s�u
           con.close();
        }            
        catch (SQLException sExec) {
           out.println("SQL���~!" + sExec.toString());
        }
    }       
    catch (ClassNotFoundException err) {
          out.println("class���~" + err.toString());
    }    
%>      
    </body>
</html>
