<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" href="style.css">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin</title>
</head>
<body onload="doctors()">
<%
String ss=(String)session.getAttribute("adminname");
System.out.print("user="+ss);

%>

<jsp:include page="header.jsp"></jsp:include>
<br>
<%

	
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitaladv","root","root");  
//here sonoo is database name, root is username and password  
Statement stmt=con.createStatement();  
ResultSet rs=stmt.executeQuery("select * from admin where username='"+ss+"'");  
if(rs.next()) { 
	
	String uname=rs.getString(1);
	String pass=rs.getString(2);
	String name=rs.getString(3);
%><br>
<div style="margin-left:0%;background-color:lightgreen;height:50px;border-radius:10px;border:1px solid red;"><br>
<a href="adminprofile.jsp" class="nav">Profile</a>

<a href="hospitalviewbyadmin.jsp"  class="nav">Hospital</a>
<a href="doctorviewbyadmin.jsp"  class="nav">Doctor</a>
<a href="pathalogyviewbyadmin.jsp"  class="nav">Pathalogy</a>
<a href="bloodbankviewbyadmin.jsp"  class="nav">Blood Bank</a>
<a href="logout.jsp" class="nav"><span style="color:white;style:bold;"><%=uname%></span>(Logout)</a>
</div><br>
<div>

<fieldset style="margin-left:20%;margin-right:20%;">


<div style="margin-left:35%;">
<form action="adminprofile.jsp" method="post">
<table style="align:center;">


<tr>

<h1>Update Admin Profile</h1>
</tr>

<tr>

<td>UserName</td><td><input type="text" name="uname"  value="<%=uname%>"required></td></tr>
<tr>
<td>Password</td><td><input type="text"name="pass"value="<%=pass%>"></td>
</tr>
<tr>
<td>Name</td><td><input type="text"name="name"value="<%=name%>"></td>
</tr>
<tr>
<td><input type="submit" value="submit" name="submit"></td><td><input type="reset" value="Clear"></td>
</tr>
</form>
</table>
</fieldset>
</div>

<%}
if(request.getParameter("submit")!=null)
{
try
{
	
	String uname=request.getParameter("uname");
	
	String pass=request.getParameter("pass");
	String name=request.getParameter("name");
	String q="update admin set username='"+uname+"',password='"+pass+"',name='"+name+"'";
	//Statement stmt=con.createStatement();
	//stmt.executeUpdate(q);
		PreparedStatement ps=con.prepareStatement(q);
		int done=ps.executeUpdate();
	//ResultSet rs=stmt.executeQuery("select * from admin where username='"+name+"' and password='"+pass+"'");
if(done==1)
{
	%>
	<script>
	alert("Profile Updated ");
	location.href="adminprofile.jsp";
	</script>
	<%
	
}
else{
	%>
	<script>
	alert("Please try again");
	location.href="adminprofile.jsp";
	</script>
	<%
}

	
	
}catch(Exception e){
	System.out.print(e);
	out.print(e);
	e.printStackTrace();
	

}}
%>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>