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
%><br>
<div style="margin-left:0%;background-color:lightgreen;height:50px;border-radius:10px;border:1px solid red;"><br>
<a href="adminprofile.jsp" class="nav">Profile</a>

<a href="hospitalviewbyadmin.jsp"  class="nav">Hospital</a>
<a href="doctorviewbyadmin.jsp"  class="nav">Doctor</a>
<a href="pathalogyviewbyadmin.jsp"  class="nav">Pathalogy</a>
<a href="bloodbandviewbyadmin.jsp"  class="nav">Blood Bank</a>
<a href="logout.jsp" class="nav"><span style="color:white;style:bold;"><%=uname%></span>(Logout)</a>
</div><br>

<div style="margin-left:20%;">
<img src="" >

</div>

<%}
if(request.getParameter("submit")!=null)
{
try
{
	
	String name=request.getParameter("name");
	String hname=request.getParameter("hname");
	
	String q="insert into hospitalseriveces(name, hospitalname) values('"+name+"','"+hname+"')";
	//Statement stmt=con.createStatement();
	//stmt.executeUpdate(q);
		PreparedStatement ps=con.prepareStatement(q);
		int done=ps.executeUpdate();
	//ResultSet rs=stmt.executeQuery("select * from admin where username='"+name+"' and password='"+pass+"'");
if(done==1)
{
	%>
	<script>
	alert("Service Added");
	location.href="hospital.jsp";
	</script>
	<%
	
}
else{
	%>
	<script>
	alert("Please try again");
	location.href="hospital.jsp";
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