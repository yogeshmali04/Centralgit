<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css">
<script>
function doctors(){
	 
	
	var request=new XMLHttpRequest();
	
   
   var url = "takedoctortype.jsp";
   try{
	request.onreadystatechange=function(){
   if(request.readyState==4)
	   {
	   var val=request.responseText;
	   
	   document.getElementById('dtype').innerHTML=val;
	   
	   }
   }
	request.open("GET",url,true);
	request.send();
   }
  catch(e)
  {
	  alert("unable to connect Server");
	  
  }
  } 


</script>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Doctor Registration</title>
</head>
<body onload="doctors()">

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
<fieldset style="margin-left:20%;margin-right:20%;">
<div style="margin-left:35%;">
<table style="align:center;">

<form action="doctorreg1.jsp" method="post" enctype="multipart/form-data">
<tr>

<h1>Doctor Registration</h1>
</tr>
<tr>
<td>UserName</td><td><input type="text" name="uname" required></td>
</tr>
<tr>
<td>Password</td><td><input type="password" name="pass" required></td>
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
<td>Doctor Type</td><td><select name="dtype" id="dtype">
                         
                         </select>
                         </td>
</tr>
<tr>
<td>Education </td><td><input type="text" name="education"></td>
</tr>
<tr>
<td>License No </td><td><input type="text" name="licno"></td>
</tr>
<tr>
<td>Date of Birth </td><td><input type="text" name="dob"></td>
</tr>
<tr>
<td>Mobile </td><td><input type="text" name="mob"></td>
</tr><tr>
<td>Email </td><td><input type="email" name="email"></td>
</tr><tr>
<td>Hospital Name </td><td><input type="text" name="hospname"></td>
</tr>
<tr>
<td>Home Address </td><td><input type="text" name="homeadress"></td>
</tr><tr>
<td>Hospital Address </td><td><input type="text" name="hospaddress"></td>
</tr>
<tr>
<td>City</td><td><input type="text" name="city"></td>
</tr>
<tr>
<td>Doctor's Photo</td><td><input type="file" name="dphoto"></td>
</tr>

<tr>
<td><input type="submit" value="submit" name="submit"></td><td><input type="reset" value="Clear"></td>
</tr>
</form>
</table>
</fieldset>
</div>



<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>