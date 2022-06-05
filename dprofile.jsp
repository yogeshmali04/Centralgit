<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
    <%@page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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


<link rel="stylesheet" type="text/css" href="style.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Doctor Update</title>
</head>
<body onload="doctors();">
<%
String ss=(String)session.getAttribute("doctor");
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
ResultSet rs=stmt.executeQuery("select * from doctor where username='"+ss+"'");  
if(rs.next()) { 
	
	String v1=rs.getString(2);
	String v2=rs.getString(3);
	String v3=rs.getString(4);
	String v4=rs.getString(5);
	String v5=rs.getString(6);
	String v6=rs.getString(7);
	String v7=rs.getString(8);
	String v8=rs.getString(9);
	String v9=rs.getString(10);
	String v10=rs.getString(11);
	String v11=rs.getString(12);
	String v12=rs.getString(13);
	String v13=rs.getString(14);
	String v14=rs.getString(15);
	String v15=rs.getString(16);
	//out.print(v11+v12+v13+v14+v15);
%><br>
<div style="margin-left:0%;background-color:lightgreen;height:50px;border-radius:10px;border:1px solid red;"><br>
<a href="dprofile.jsp" style="style:none;margin-left:3%;margin-top:2px;padding:5px;background-color:gray;color:Black;border-radius:10px;border:1px solid yellow;">Profile</a>

<a href="doctorappointment.jsp" style="style:none;margin-left:3%;margin-top:2px;padding:5px;background-color:gray;color:Black;border-radius:10px;border:1px solid yellow;">Appointment</a>
<a href="logout.jsp"style="style:none;margin-left:3%;margin-top:2px;padding:5px;background-color:gray;color:Black;border-radius:10px;border:1px solid yellow;"><span style="color:white"><%=v3%></span>(Logout)</a>
</div><br><div>

<div style="margin-left:35%;">
<table style="align:center;">


<form action="updatedoctorprofile.jsp" method="post" enctype="multipart/form-data">
<tr>

<h1>Doctor Profile Update</h1>
</tr>
<tr>
<td>UserName</td><td><input type="text" name="v1"  value="<%=v1 %>"readonly required></td>
</tr>
<tr>
<td>Password</td><td><input type="text" name="v2" value="<%=v2 %>"required></td>
</tr>	

<tr>
<td>Name</td><td><input type="text" name="v3" value="<%=v3 %>"required></td>
</tr>

<tr>
<td>Address</td><td><input type="text" name="v4" value="<%=v4%>"required></td>
</tr>
<tr>
<td>Specelity</td><td><select name="v5" id="dtype">
                         
                         </select>
                         </td>
</tr>
<tr>
<td>Education</td><td><input type="text" name="v6" value="<%=v6 %>" required></td>
</tr><tr>
<td>Lic No</td><td><input type="text" name="v7" value="<%=v7 %>" required></td>
</tr><tr>
<td>Date of Birth</td><td><input type="text" name="v8" value="<%=v8 %>" required></td>
</tr><tr>
<td>Mobile</td><td><input type="text" name="v9" value="<%=v9 %>" required></td>
</tr><tr>
<td>Email</td><td><input type="text" name="v10" value="<%=v10 %>" required></td>
</tr><tr>
<td>Hospital Name</td><td><input type="text" name="v11" value="<%=v11 %>" required></td>
</tr>
<tr>
<td>Hospital Address</td><td><input type="text" name="v12" value="<%=v13 %>" required></td>
</tr>
<tr>
<td>City</td><td><input type="text" name="v14" value="<%=v14 %>" required></td>
</tr>
<tr>
<td>Photo</td><td><input type="file" name="v15" value="<%=v15 %>" required></td>
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