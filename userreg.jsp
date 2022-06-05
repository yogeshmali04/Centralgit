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
<title>User Registration</title>
</head>
<body >

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

<form action="userreg.jsp" method="post">
<tr>

<h1>User Registration</h1>
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
<td>Mobile </td><td><input type="text" name="mob"></td>
</tr><tr>
<td>Email </td><td><input type="email" name="email"></td>
</tr><tr>
<td>Age </td><td><input type="text" name="age"></td>
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
	String uname=request.getParameter("uname");
	String pass=request.getParameter("pass");
	String name=request.getParameter("name");
	String mob=request.getParameter("mob");
	
	String email=request.getParameter("email");
	String age=request.getParameter("age");	
	String city=request.getParameter("city");
	

	Class.forName("com.mysql.jdbc.Driver");  
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitaladv","root","root");  
	String q="insert into user(username, password, name, mob,email, age, city) values('"+uname+"','"+pass+"','"+name+"','"+mob+"','"+email+"','"+age+"','"+city+"')";
	//Statement stmt=con.createStatement();
	//stmt.executeUpdate(q);
		PreparedStatement ps=con.prepareStatement(q);
		int done=ps.executeUpdate();
	//ResultSet rs=stmt.executeQuery("select * from admin where username='"+name+"' and password='"+pass+"'");
if(done==1)
{
	%>
	<script>
	alert("Registration Completed");
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
	e.printStackTrace();
	
}
}
%>



<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>