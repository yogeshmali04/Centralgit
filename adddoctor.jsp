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
<%
String ss=(String)session.getAttribute("hospitalname");
System.out.print("user="+ss);

%>

<jsp:include page="header.jsp"></jsp:include>
<br>
<%

	
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitaladv","root","root");  
//here sonoo is database name, root is username and password  
Statement stmt=con.createStatement();  
ResultSet rs=stmt.executeQuery("select * from hospital where username='"+ss+"'");  
if(rs.next()) { 
	
	String uname=rs.getString(2);
	String pass=rs.getString(3);
	String hname=rs.getString(4);
	session.setAttribute("hospial",hname);

	String gender=rs.getString(5);
	String addresss=rs.getString(6);
	String yr=rs.getString(7);
	//String year=rs.getString(8);
	String photo=rs.getString(10);
	 String city=rs.getString(11);
	//out.print(name);
	 //out.print(dept);
%><br>
<div style="margin-left:0%;background-color:lightgreen;height:50px;border-radius:10px;border:1px solid red;"><br>
<a href="hprofile.jsp" style="style:none;margin-left:3%;margin-top:2px;padding:5px;background-color:gray;color:Black;border-radius:10px;border:1px solid yellow;">Profile</a>

<a href="adddoctor.jsp" style="style:none;margin-left:3%;margin-top:2px;padding:5px;background-color:gray;color:Black;border-radius:10px;border:1px solid yellow;">Doctor</a>
<a href="hospitalappointment.jsp" style="style:none;margin-left:3%;margin-top:2px;padding:5px;background-color:gray;color:Black;border-radius:10px;border:1px solid yellow;">Appointment</a>

<a href="hservices.jsp"style="style:none;margin-left:3%;margin-top:2px;padding:5px;background-color:gray;color:Black;border-radius:10px;border:1px solid yellow;">Services</a>
<!--  <a href="bloodbankorder.jsp"style="style:none;margin-left:3%;margin-top:2px;padding:5px;background-color:gray;color:Black;border-radius:10px;border:1px solid yellow;">Pathology Lab</a>
<a href="pathalogylab.jsp"style="style:none;margin-left:3%;margin-top:2px;padding:5px;background-color:gray;color:Black;border-radius:10px;border:1px solid yellow;">Blood Bank</a>
--><a href="logout.jsp"style="style:none;margin-left:3%;margin-top:2px;padding:5px;background-color:gray;color:Black;border-radius:10px;border:1px solid yellow;"><span style="color:white"><%=hname%></span>(Logout)</a>
</div><br>
<div>

<fieldset style="margin-left:20%;margin-right:20%;">
<div style="margin-left:35%;">
<table style="align:center;">

<form action="adddoctor1.jsp" method="post" enctype="multipart/form-data">
<tr>

<h1>Doctor Registration</h1>
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
<td>Hospital Name </td><td><input type="text" name="hospname" value="<%=hname%>"></td>
</tr>
<tr>
<td>Home Address </td><td><input type="text" name="homeadress"></td>
</tr><tr>
<td>Hospital Address </td><td><input type="text" name="hospaddress" value="<%=photo%>"></td>
</tr>
<tr>
<td>City</td><td><input type="text" name="city" value="<%=city%>"></td>
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
<%} %>

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
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>