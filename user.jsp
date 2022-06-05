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
String ss=(String)session.getAttribute("user");
System.out.print("user="+ss);

%>

<jsp:include page="header.jsp"></jsp:include>
<br>
<%

	
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitaladv","root","root");  
//here sonoo is database name, root is username and password  
Statement stmt=con.createStatement();  
ResultSet rs=stmt.executeQuery("select * from user where username='"+ss+"'");  
if(rs.next()) { 
	
	String uname=rs.getString(1);
	String pass=rs.getString(2);
	String hname=rs.getString(3);
	String gender=rs.getString(5);
	String addresss=rs.getString(6);
	String yr=rs.getString(7);
//	String year=rs.getString(8);
	 //out.print(name);
	 //out.print(dept);
%><br>
<div style="margin-left:0%;background-color:lightgreen;height:50px;border-radius:10px;border:1px solid red;"><br>
<a href="uprofile.jsp" style="style:none;margin-left:3%;margin-top:2px;padding:5px;background-color:gray;color:Black;border-radius:10px;border:1px solid yellow;">Profile</a>

<a href="happointment.jsp" style="style:none;margin-left:3%;margin-top:2px;padding:5px;background-color:gray;color:Black;border-radius:10px;border:1px solid yellow;">Hospital</a>
<a href="dappointment.jsp" style="style:none;margin-left:3%;margin-top:2px;padding:5px;background-color:gray;color:Black;border-radius:10px;border:1px solid yellow;">Doctor</a>
<a href="logout.jsp"style="style:none;margin-left:3%;margin-top:2px;padding:5px;background-color:gray;color:Black;border-radius:10px;border:1px solid yellow;"><span style="color:white"><%=hname%></span>(Logout)</a>
</div><br>
<div>

<fieldset style="margin-left:20%;margin-right:20%;">
<div style="margin-left:35%;">
<table style="align:center;">

<form action="tests.jsp" method="post">
<tr>

<h1>Add Tests</h1>
</tr>

<tr>

<td>Name</td><td><input type="text" name="name" required><input type="hidden"name="hname"value="<%=hname%>"></td>
</tr>

<tr>

<td>Price</td><td><input type="text" name="price" required></td>
</tr>

<tr>
<td><input type="submit" value="submit" name="submit"></td><td><input type="reset" value="Clear"></td>
</tr>
</form>
</table>
</fieldset>
</div>

<%}
if(request.getParameter("submit")!=null)
{
try
{
	
	String name=request.getParameter("name");
	String price=request.getParameter("price");
	
	String hname=request.getParameter("hname");
	
	String q="insert into tests(test, price,lab) values('"+name+"','"+hname+"')";
	//Statement stmt=con.createStatement();
	//stmt.executeUpdate(q);
		PreparedStatement ps=con.prepareStatement(q);
		int done=ps.executeUpdate();
	//ResultSet rs=stmt.executeQuery("select * from admin where username='"+name+"' and password='"+pass+"'");
if(done==1)
{
	%>
	<script>
	alert("Service Added");
	location.href="hospital.jsp";
	</script>
	<%
	
}
else{
	%>
	<script>
	alert("Please try again");
	location.href="hospital.jsp";
	</script>
	<%
}

	
	
}catch(Exception e){
	System.out.print(e);
	out.print(e);
	e.printStackTrace();
	

}}
%>



<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>