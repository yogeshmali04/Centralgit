<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
    <%@page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hospital  Update</title>
</head>
<body>
<%
String ss=(String)session.getAttribute("hospitalname");
System.out.print("user="+ss);

%>
<jsp:include page="header.jsp"></jsp:include>
<%
try{
	
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitaladv","root","root");  
//here sonoo is database name, root is username and password  
Statement stmt=con.createStatement();  
String dept,name;
ResultSet rs=stmt.executeQuery("select * from hospital where username='"+ss+"'");  
if(rs.next()) { 
	
	String v1=rs.getString(1);
	String v2=rs.getString(2);
	String v3=rs.getString(3);
	String v4=rs.getString(4);
	String v5=rs.getString(5);
	String v6=rs.getString(6);
	String v7=rs.getString(7);
	String v8=rs.getString(8);
	String v9=rs.getString(9);
	String v10=rs.getString(10);
	String v11=rs.getString(11);
	String v12=rs.getString(12);
	 //out.print(name);
	 //out.print(//dept);
%><br>
<div style="margin-left:0%;background-color:lightgreen;height:50px;border-radius:10px;border:1px solid red;"><br>
<a href="hprofile.jsp" style="style:none;margin-left:3%;margin-top:2px;padding:5px;background-color:gray;color:Black;border-radius:10px;border:1px solid yellow;">Profile</a>

<a href="adddoctor.jsp" style="style:none;margin-left:3%;margin-top:2px;padding:5px;background-color:gray;color:Black;border-radius:10px;border:1px solid yellow;">Doctor</a>
<a href="hospitalappointment.jsp" style="style:none;margin-left:3%;margin-top:2px;padding:5px;background-color:gray;color:Black;border-radius:10px;border:1px solid yellow;">Appointment</a>

<a href="hservices.jsp"style="style:none;margin-left:3%;margin-top:2px;padding:5px;background-color:gray;color:Black;border-radius:10px;border:1px solid yellow;">Services</a>
<!--  <a href="bloodbankorder.jsp"style="style:none;margin-left:3%;margin-top:2px;padding:5px;background-color:gray;color:Black;border-radius:10px;border:1px solid yellow;">Pathology Lab</a>
<a href="pathalogylab.jsp"style="style:none;margin-left:3%;margin-top:2px;padding:5px;background-color:gray;color:Black;border-radius:10px;border:1px solid yellow;">Blood Bank</a>
--><a href="logout.jsp" style="margin-left:3%;margin-top:2px;padding:5px;background-color:gray;color:Black;border-radius:10px;border:1px solid yellow;"><span style="color:white"><%=v4%></span>(Logout)</a>
</div><br>
<div>

<div style="margin-left:35%;">
<table style="align:center;">


<form action="updatehospitalprofile.jsp" method="post" enctype="multipart/form-data">
<tr>

<h1>Hospital Profile Update</h1>
</tr>
<tr>
<td>UserName</td><td><input type="text" name="uname"  value="<%=v2 %>"readonly required></td>
</tr>
<tr>
<td>Password</td><td><input type="text" name="pass" value="<%=v3 %>"required></td>
</tr>

<tr>
<td>Name</td><td><input type="text" name="name" value="<%=v4 %>"required></td>
</tr>

<tr>
<td>Dean Name</td><td><input type="text" name="dean" value="<%=v5 %>" required></td>
</tr>

<tr>
<td>Lic No</td><td><input type="text" name="lic" value="<%=v6 %>" required></td>
</tr>


<tr>
<td>Establish Year</td><td><input type="text" name="eyr" value="<%=v7 %>" required></td>
</tr>

<tr>
<td>Mobile</td><td><input type="text" name="mob" value="<%=v8 %>" required></td>
</tr>

<tr>
<td>Email</td><td><input type="text" name="email" value="<%=v9 %>" required></td>
</tr>

<tr>
<td>Address</td><td><input type="text" name="address" value="<%=v10 %>" required></td>
</tr>

<tr>
<td>City</td><td><input type="text" name="city" value="<%=v11 %>" required></td>
</tr>

<tr>
<td>Website</td><td><input type="text" name="website" value="<%=v12 %>" required></td>
</tr>

<tr>
<td>Photo</td><td><input type="file" name="photo"  required></td>
</tr>

<tr>
<td><input type="submit" value="Update"></td><td><input type="reset" value="Clear"></td>
</tr>
</form>
</table>
</div>

<%
}}
catch(Exception e)
{
	System.out.print(e);
}
%>	
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>