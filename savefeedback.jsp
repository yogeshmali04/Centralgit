<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="sun.security.util.Password"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitaladv","root","root");

String cname=request.getParameter("cname");
	String email=request.getParameter("email");
	String feedback=request.getParameter("feedback");
	
	String query="insert into feedback (cname,email,feedback)values('"+cname+"','"+email+"','"+feedback+"')";
	Statement st2=con.createStatement();
	int done=st2.executeUpdate(query);
	if(done==1)
	{
		%>
		<script>
		
		alert("Feedback Saved Successfully");
		location.href="index.jsp";
		</script>
		<%
	}
%>
</body>
</html>