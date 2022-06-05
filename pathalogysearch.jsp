<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Start WOWSlider.com HEAD section -->
<link rel="stylesheet" type="text/css" href="engine1/style.css" />
<script type="text/javascript" src="engine1/jquery.js"></script>
<!-- End WOWSlider.com HEAD section -->
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

<div style="margin-left:0%">
<form action="pathalogysearch.jsp">
<h1>Pathalogy Lab Search</h1>
<input type="text" name="search" placeholder="city/name" class="searchtext">
<input type="submit" name="submit" value="Search" class="searchbutton">

</form>
</div>
<br>



<%
if(request.getParameter("submit")!=null)
{
try
{
	String uname=request.getParameter("search");

	Class.forName("com.mysql.jdbc.Driver");  
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitaladv","root","root");  
	String q="select * from pathology where city='"+uname+"' or name='"+uname+"'";
	Statement stmt=con.createStatement();
	//stmt.executeUpdate(q);
		//ResultSet rs=con.createStatement(); 
		ResultSet rs=stmt.executeQuery(q);
	//ResultSet rs=stmt.executeQuery("select * from admin where username='"+name+"' and password='"+pass+"'");
	
	%><div style="">
	<table>	
	<%
	while(rs.next()){
		
		String name=rs.getString(4);
		String owner=rs.getString(5);
		String address=rs.getString(6);
		String lic=rs.getString(7);
		String mob=rs.getString(8);
		String email=rs.getString(9);
		String city=rs.getString(10);
	
		String photo=rs.getString(11);
		
		
		
		  %>
		  <div style="margin-left:30%;">
		<img src="<%=photo%>"style="margin-left:2px;height:200px;width:300px;">
		<br>  
		
		
		<span style="color:red;font-size:38px;font-style:italic;margin-top:-20px;font-size:30px"><%=name %></span ><br><span><%=city %>
		</span><br>
		<br><a href="pathologydetails.jsp?lic=<%=lic%>" style="color:white;background-color:#267de0;padding:10px 120px;margin-left:0s%;border-radius:10px;
		;" >View Details</a>
		
		<br><br></div>
		<%}


	%>
</div>	
	</table>
		
	<%
}	
catch(Exception e){
	System.out.print(e);
	out.print(e);
	e.printStackTrace();
	
}
}
%>


<br><br><br><br><br><br><br>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>