<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <%@page import="com.oreilly.servlet.MultipartRequest" %>  
    
      <%@page import=" java.io.IOException" %>
      <%@page import=" java.nio.file.Files" %>
       <%@page import=" java.nio.file.Paths" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Doctor Registration</title>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>
<br>

<div style="margin-left:0%;background-color:lightgreen;height:50px;border-radius:10px;border:1px solid red;"><br>
<a href="index.jsp" style="style:none;margin-left:3%;margin-top:2px;padding:5px;background-color:gray;color:Black;border-radius:10px;border:1px solid yellow;">Home</a>

<a href="hospital.jsp" style="style:none;margin-left:3%;margin-top:2px;padding:5px;background-color:gray;color:Black;border-radius:10px;border:1px solid yellow;">Hospital</a>
<a href="doctor.jsp"style="style:none;margin-left:3%;margin-top:2px;padding:5px;background-color:gray;color:Black;border-radius:10px;border:1px solid yellow;">Doctor</a>
<a href="pathalogy.jsp"style="style:none;margin-left:3%;margin-top:2px;padding:5px;background-color:gray;color:Black;border-radius:10px;border:1px solid yellow;">Pathology Lab</a>
<a href="bloodbank.jsp"style="style:none;margin-left:3%;margin-top:2px;padding:5px;background-color:gray;color:Black;border-radius:10px;border:1px solid yellow;">Blood Bank</a>

<a href="aboutus.jsp" style="style:none;margin-left:3%;margin-top:2px;padding:5px;background-color:gray;color:Black;border-radius:10px;border:1px solid yellow;">About Us</a>
<a href="contactus.jsp"style="style:none;margin-left:3%;margin-top:2px;padding:5px;background-color:gray;color:Black;border-radius:10px;border:1px solid yellow;">Contact Us</a>
</div><br>
<fieldset style="margin-left:20%;margin-right:20%;border-radius:10px;">
<div style="margin-left:35%;">
<table style="align:center;">
<form action="hospitalreg1.jsp" method="post" enctype="multipart/form-data">
<tr>

<h1>Hospital Registration</h1>
</tr>
<tr>
<td>UserName</td><td><input type="text" name="uname" required></td>
</tr>
<tr>
<td>Password</td><td><input type="password" name="pass" required></td>
</tr>

<tr>
<td>Hospital Name</td><td><input type="text" name="name" required></td>
</tr>
<tr>
<td>Dean Name </td><td><input type="text" name="deanname"></td>
</tr>
<tr>
<td>Address</td><td><textarea name="hospaddress" cols="16" required></textarea></td>
</tr>
<tr>
<td>License No </td><td><input type="text" name="licno"></td>
</tr>
<tr>
<td>Establishment Year</td><td><input type="text" name="est"></td>
</tr>
<tr>
<td>Mobile/Contact </td><td><input type="text" name="mob"></td>
</tr><tr>
<td>Email </td><td><input type="email" name="email"></td>
</tr>
<tr>
<td>City</td><td><input type="text" name="city"></td>
</tr>
<tr>
<td>Web site</td><td><input type="text" name="web"></td>
</tr>

<tr><td>Photo of Hospital</td><td><input type="file" name="photo"></td></tr>
<tr>
<td><input type="submit" value="Submit" name="submit"></td><td><input type="reset" value="Clear"></td>
</tr>

</form>
</table>
</div>
</fieldset>




<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>