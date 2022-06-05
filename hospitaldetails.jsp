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
<h1>Hospital Search</h1>
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
	String uname=request.getParameter("name");
	String q="select * from hospital where name='"+uname+"'";
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
		session.setAttribute("hospial",name);
		String owner=rs.getString(5);
		String lic=rs.getString(6);
		String est=rs.getString(7);
		String mob=rs.getString(8);
		String email=rs.getString(9);
		String city=rs.getString(10);
		String web=rs.getString(12);
		String photo=rs.getString(13);
		
		
		
		  %>
		<tr><td><img src="<%=photo%>"style="height:200px;width:300px;"></td><td><span style="color:red;font-size:38px;font-style:italic;margin-top:-20px;font-size:30px"><%=name %></span><tr><td>
<tr><td><a href="appointmenth.jsp?name=<%=name%>" style="color:white;width:30px;background-color:#e02696;padding:13px 36px;margin-left:209%;margin-top:100px;border-radius:10px;" >Appointment</a></td></tr><br>
		<table><tr><td>Dean</td><td>License No</td><td>Establishment Year</td><td>Email</td><td>Address</td><td>Web site</td></tr>
		
		
		<td><%=owner %></td><td><%=lic %></td><td><%=est %></td><td><%=email %></td><td><%=city %></td><td><a href="http://<%=web %>"><%=web %></a></td></tr>
		
		</table>	
		<%


	%>
	
	</table>
	<h3 style="margin-left:80%;margin-top:-100px;">Available Services</h3>
<table border=1 style="margin-left:80%;padding-left:10px;padding-right:10px;">
<tr ><th style="padding-left:10px;padding-right:10px;">Service Name</th></tr>
<%
Statement stmt1=con.createStatement();  

ResultSet rs2=stmt1.executeQuery("select * from hospitalseriveces where username='"+uname1+"'");  
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

<div>
<table border=1>
	 <tr><td>Photo</td><td>Name</td><td>Address</td><td>Doctor Type</td><td>Education</td><td>Lic No</td><td>Date of Birth</td><td>Mobile</td><td>Email</td><td>Hospital Name</td>
	 <td>Hospital Address</td><td>City</td></tr>

<%
Statement stmt1=con.createStatement();  

ResultSet rs1=stmt1.executeQuery("select * from doctor where hospitalname='"+(String)session.getAttribute("hospial")+"'");  
while(rs1.next()) { 
	
	String uname=rs1.getString(2);
	String pass=rs1.getString(3);
	String name=rs1.getString(4);
	String address=rs1.getString(5);
	String dtype=rs1.getString(6);
	String edu=rs1.getString(7);
	String lic=rs1.getString(8);
	String dob=rs1.getString(9);
	String mob=rs1.getString(10);
	String email=rs1.getString(11);
	String hname=rs1.getString(12);
//	String lic=//rs.getString(13);
	String haddress=rs1.getString(14);
	String city=rs1.getString(15);
	String photo=rs1.getString(16);
	 //String city=rs1.getString(12);
	//out.print(name);
	 //out.print(dept);
	 %>
	 <tr><td><img src="<%= photo%>" style="height:160px;widht:100px;"></td><td><%=name %></td><td><%=address %></td><td><%=dtype %></td><td><%=edu %></td><td><%=lic %></td><td><%=dob %></td><td><%=mob %></td><td><%=email %></td><td><%=hname %></td>
	 <td><%=haddress %></td><td><%=city %></td></tr>
	 
	 <%
}%><br>

</table>

</div>

<br><br><br><br><br><br><br>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>