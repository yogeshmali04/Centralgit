<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String type=request.getParameter("types");
String name=request.getParameter("username");
String pass=request.getParameter("password");

System.out.print(type);
System.out.print(name);
System.out.print(pass);

try{  
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitaladv","root","root");  
//here sonoo is database name, root is username and password  
Statement stmt=con.createStatement();  

if(type.equals("Admin"))
{
ResultSet rs=stmt.executeQuery("select * from admin where username='"+name+"' and password='"+pass+"'");  
while(rs.next()) { 
	
	  session.setAttribute("adminname",name);
	  %>
	  <script>
	  alert("Login Successful");
	  
	  location.href="admin.jsp";
	  </script>
	  <%}
	}


if(type.equals("Doctor"))
{
	System.out.print("started");
	ResultSet rs=stmt.executeQuery("select * from doctor where username='"+name+"' and password='"+pass+"'");  
while(rs.next()) {
	session.setAttribute("doctor",name);
  %>
  <script>
  alert("Login Successful");
  location.href="doctor.jsp";
  </script>
  <%}
}



if(type.equals("Hospital"))
{
ResultSet rs=stmt.executeQuery("select * from hospital where username='"+name+"' and password='"+pass+"'");  
while(rs.next()) { 
	session.setAttribute("hospitalname",name);
  %>
  <script>
  alert("Login Successful");
  location.href="hospital.jsp";
  </script>
  <%}
}
if(type.equals("Pathology"))
{
ResultSet rs=stmt.executeQuery("select * from pathology where username='"+name+"' and password='"+pass+"'");  
while(rs.next()) { 
	session.setAttribute("pathology",name);
  %>
  <script>
  alert("Login Successful");
  location.href="pathalogy.jsp";
  </script>
  <%}
}

if(type.equals("Blood Bank"))
{
ResultSet rs=stmt.executeQuery("select * from bloodbank where username='"+name+"' and password='"+pass+"'");  
while(rs.next()) { 
	session.setAttribute("bloodbank",name);
  %>
  <script>
  alert("Login Successful");
  location.href="bloodbank.jsp";
  </script>
  <%}
}

if(type.equals("User"))
{
ResultSet rs=stmt.executeQuery("select * from user where username='"+name+"' and password='"+pass+"'");  
while(rs.next()) { 
	session.setAttribute("user",name);
  %>
  <script>
  alert("Login Successful");
  location.href="user.jsp";
  </script>
  <%}
}




%>
<script>
alert("Please Try again");
location.href="index.jsp";
</script>
<%

con.close();  
}catch(Exception e)
{
	System.out.println(e);  
}  
%>
</body>
</html>
