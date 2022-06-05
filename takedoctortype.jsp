<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
    <%@page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>
<%
try{
	
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitaladv","root","root");  

Statement stmt1=con.createStatement();  


ResultSet rs1=stmt1.executeQuery("select doctortype from doctortype");  
while(rs1.next()) { 
	 //String subj=rs1.getString(1);
    
	out.print("<option>"+rs1.getString(1)+"</option>");
		 

					}

//System.out.print("Sem="+sem);
}
catch(Exception e)
{
out.print(e);	
}


%>
</body>
</html>