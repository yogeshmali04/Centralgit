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
<title></title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<br>
<%String hname=request.getParameter("name"); %>
<div style="margin-left:0%;background-color:lightgreen;height:50px;border-radius:10px;border:1px solid red;"><br>
<a href="index.jsp" class="nav">Home</a>

<a href="hospitalsearch.jsp" class="nav">Hospital</a>
<a href="doctorsearch.jsp"class="nav">Doctor</a>
<a href="pathalogysearch.jsp"class="nav">Pathology Lab</a>
<a href="bloodbanksearch.jsp"class="nav">Blood Bank</a>

<a href="aboutus.jsp"class="nav" >About Us</a>
<a href="contactus.jsp"class="nav">Contact Us</a>
</div><br>
<fieldset style="margin-left:20%;margin-right:20%;">
<div style="margin-left:35%;">
<table style="align:center;">

<form action="appointmentb.jsp" method="post">
<tr>

<h1>Blood Demand Form</h1>
</tr>

<tr>
<td>Name</td><td><input type="text" name="name" required></td>
</tr>
<!-- <tr>
<td>Staff ID</td><td><input type="text" name="sid"></td>
</tr> -->
<tr>
<td>Address</td><td><textarea name="address" cols="16" required></textarea></td>
</tr>
<tr>
<td>Age </td><td><input type="text" name="age"></td>
</tr>
<tr>
<td>Gender </td><td><select name="gender">
<option>Male</option>
<option>Female</option>
</select></td>
</tr>

<tr>
<td>Group Name </td><td>
<select name="group">
<option>A+</option>
<option>A-</option>
<option>B+</option>
<option>B-</option>
<option>AB+</option>
<option>AB-</option>

<option>O+</option>
<option>O-</option>
</select>
</td></tr>
<tr>
<td>Quantity </td><td><input type="number" min="1" max="10" name="qty"></td>
</tr>
<tr>
<td>Mobile </td><td><input type="text" name="mob"></td>
</tr>
<tr>
<td>Email </td><td><input type="email" name="email"></td>
</tr><tr>
<td>Blood Bank Name </td><td><input type="text" name="hospname" value="<%=hname %>"></td>
</tr>
<tr>
<td>City</td><td><input type="text" name="city"></td>
</tr>

<tr>
<td><input type="submit" value="submit" name="submit"></td><td><input type="reset" value="Clear"></td>
</tr>
</form>
</table>
</fieldset>
</div>
<%
if(request.getParameter("submit")!=null)
{
try
{
	
	String name=request.getParameter("name");	
	String address=request.getParameter("address");
	String age=request.getParameter("age");
	String gender=request.getParameter("gender");
	String group=request.getParameter("group");
	String qty=request.getParameter("qty");
	String mob=request.getParameter("mob");
	String email=request.getParameter("email");
	String hospname=request.getParameter("hospname");
	String city=request.getParameter("city");
	

	Class.forName("com.mysql.jdbc.Driver");  
	String status="Pending";
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitaladv","root","root");  
	String q="insert into bappointment(name,address,age,gender,grouph,qty,mob,email,bloodbank,city,status) values('"+name+"','"+address+"',"+age+",'"+gender+"','"+group+"',"+qty+",'"+mob+"','"+email+"','"+hospname+"','"+city+"','"+status+"')";
	//Statement stmt=con.createStatement();
	//stmt.executeUpdate(q);
		PreparedStatement ps=con.prepareStatement(q);
		int done=ps.executeUpdate();
	//ResultSet rs=stmt.executeQuery("select * from admin where username='"+name+"' and password='"+pass+"'");
if(done==1)
{
	%>
	<script>
	alert("Appointment Request Sent");
	location.href="index.jsp";
	</script>
	<%
	
}
else{
	%>
	<script>
	alert("Please try again");
	location.href="index.jsp";
	</script>
	<%
}

	
	
}catch(Exception e){
	System.out.print(e);
	out.print(e);
	
}
}
%>


<br><br><br><br><br><br><br>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>