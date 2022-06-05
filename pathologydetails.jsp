<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css">
<script type="text/javascript">

function user(event) {
//	alert(event.target.value);
	  location.href=event.target.value;
	}
</script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Index</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<br>

<div style="margin-left:0%;background-color:lightgreen;height:50px;border-radius:10px;border:1px solid red;"><br>
<a href="index.jsp" class="nav">Home</a>

<a href="hospitalsearch.jsp" class="nav">Hospital</a>
<a href="doctorsearch.jsp"class="nav">Doctor</a>
<a href="pathalogysearch.jsp"class="nav">Pathology Lab</a>
<a href="bloodbanksearch.jsp"class="nav">Blood Bank</a>

<a href="aboutus.jsp"class="nav" >About Us</a>
<a href="contactus.jsp"class="nav">Contact Us</a>
</div><br>

<div style="margin-left:30%">

<form action="hospitalsearch.jsp">
<h1>Pathology Search</h1>
<input type="text" name="search" placeholder="City/Name" class="searchtext">
<input type="submit" name="submit" value="Search" class="searchbutton">
</form>
</div>
<br>

<%

Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitaladv","root","root");  

try
{
	String lic1=request.getParameter("lic");
	String q="select * from pathology where licenseno='"+lic1+"'";
	Statement stmt=con.createStatement();
	//stmt.executeUpdate(q);
		//ResultSet rs=con.createStatement(); 
		ResultSet rs=stmt.executeQuery(q);
	//ResultSet rs=stmt.executeQuery("select * from admin where username='"+name+"' and password='"+pass+"'");
	
	%><div>
	<table style="margin-left:11%" >
	<%
	if(rs.next()){
		String uname1=rs.getString(2);
		String name=rs.getString(4);
		session.setAttribute("pathology",name);
		String owner=rs.getString(5);
		String lic=rs.getString(6);
		String est=rs.getString(7);
		String mob=rs.getString(8);
		String email=rs.getString(9);
		String city=rs.getString(10);
		//String web=rs.getString(11);
		String photo=rs.getString(11);
		
		
		
		  %>
		<tr><td><img src="<%=photo%>"style="height:200px;width:300px;"></td><td><span style="color:red;font-size:38px;font-style:italic;margin-top:-20px;font-size:30px"><%=name %></span ></td><td>
	<a href="appointmentp.jsp?name=<%=name%>" style="color:white;width:30px;background-color:#e02696;padding:13px 36px;margin-left:20%;margin-top:100px;border-radius:10px;
		;" >Appointment</a></td></tr>
		  
<table border=1 style="margin-left:12%">
		<tr style="border:1px solid red">
		<tr><td>Owner</td><td>Address</td><td>Lic No</td><td>Mobile</td><td>Email</td><td>City</td></tr>
		
		
		<td><%=owner %></td><td><%=lic %></td><td><%=est %></td><td><%=mob %></td><td><%=email %></td><td><%=city %></td></tr>
		
		</table>	
		<%


	%>
	
	</table>
	
	
	<h3 style="margin-left:50%;margin-top:-100px;">Available Instruments</h3>
<table border=1 style="margin-left:50%;padding-left:10px;padding-right:10px;">
<tr ><th style="padding-left:10px;padding-right:10px;">Machine Name</th><th style="padding-left:10px;padding-right:10px;">Work</th></tr>
<%
Statement stmt2=con.createStatement();  

ResultSet rs3=stmt2.executeQuery("select * from instruments where lab='"+(String)session.getAttribute("pathology")+"'");  
while(rs3.next()) { 
	String service=rs3.getString(1);
	String price=rs3.getString(2);
%>
 
<tr><td style="padding-left:10px;padding-right:10px;"><%=service %></td><td style="padding-left:10px;padding-right:10px;"><%=price %></td></tr>
<%	
}
%></table>

	
	<h3 style="margin-left:80%;margin-top:-100px;">Available Tests</h3>
<table border=1 style="margin-left:80%;padding-left:10px;padding-right:10px;">
<tr ><th style="padding-left:10px;padding-right:10px;">Test Name</th></tr>
<%
Statement stmt1=con.createStatement();  

ResultSet rs2=stmt1.executeQuery("select * from tests where lab='"+name+"'");  
while(rs2.next()) { 
	String service=rs2.getString(1);
%>
 
<tr><td style="padding-left:10px;padding-right:10px;"><%=service %></td></tr>
<%	
}
%></table>
	
		</div>
	<%
}	}
catch(Exception e){
	System.out.print(e);
	out.print(e);
	e.printStackTrace();
	
}
%>


<br><br><br><br><br><br><br>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>