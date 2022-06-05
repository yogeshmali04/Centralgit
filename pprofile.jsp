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
String ss=(String)session.getAttribute("pathology");
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
ResultSet rs=stmt.executeQuery("select * from pathology where username='"+ss+"'");  
if(rs.next()) { 
	
	String uname=rs.getString(2);
	String pass=rs.getString(3);
	String hname=rs.getString(4);
	String owner=rs.getString(5);
	String address=rs.getString(6);
	String lic=rs.getString(7);
	String mob=rs.getString(8);
	String email=rs.getString(9);
	String city=rs.getString(10);
	String photo=rs.getString(11);
	 //out.print(name);
	 //out.print(dept);
%><br>
<div style="margin-left:0%;background-color:lightgreen;height:50px;border-radius:10px;border:1px solid red;"><br>
<a href="pprofile.jsp" style="style:none;margin-left:3%;margin-top:2px;padding:5px;background-color:gray;color:Black;border-radius:10px;border:1px solid yellow;">Profile</a>
<a href="pathologyappointmentshow.jsp" style="style:none;margin-left:3%;margin-top:2px;padding:5px;background-color:gray;color:Black;border-radius:10px;border:1px solid yellow;">Appointment</a>

<a href="tests.jsp" style="style:none;margin-left:3%;margin-top:2px;padding:5px;background-color:gray;color:Black;border-radius:10px;border:1px solid yellow;">Tests</a>
<a href="instruments.jsp" style="style:none;margin-left:3%;margin-top:2px;padding:5px;background-color:gray;color:Black;border-radius:10px;border:1px solid yellow;">Instruments</a>
<a href="logout.jsp"style="style:none;margin-left:3%;margin-top:2px;padding:5px;background-color:gray;color:Black;border-radius:10px;border:1px solid yellow;"><span style="color:white"><%=hname%></span>(Logout)</a>
</div><br>
<div style="margin-left:35%;">
<table style="align:center;">


<form action="updatepathologyprofile.jsp" method="post" enctype="multipart/form-data">
<tr>

<h1>Pathaolgy Profile Update</h1>
</tr>
<tr>
<td>UserName</td><td><input type="text" name="uname"  value="<%=uname %>"readonly required></td>
</tr>
<tr>
<td>Password</td><td><input type="text" name="pass" value="<%=pass %>"required></td>
</tr>

<tr>
<td>Name</td><td><input type="text" name="name" value="<%=hname %>"required></td>
</tr>

<tr>
<td>Owner</td><td><input type="text" name="owner" value="<%=owner %>" required></td>
</tr>

<tr>
<td>Address</td><td><input type="text" name="address" value="<%=address %>" required></td>
</tr>

<tr>
<td>Lic No</td><td><input type="text" name="lic"value="<%=lic %>">
                    
                         </td>
</tr>
<tr>
<td>mobile</td><td><input type="text" name="mob" value="<%=mob %>" required></td>
</tr>
<tr>
<td>Email</td><td><input type="email" name="email" value="<%=email %>" required></td>
</tr>
<tr>
<td>City</td><td><input type="city" name="city" value="<%=city %>" required></td>
</tr>
<tr>
<td>Lab Photo </td><td><input type="file" name="photo" value="<%=photo %>" required></td>
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