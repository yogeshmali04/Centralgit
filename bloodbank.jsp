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
String ss=(String)session.getAttribute("bloodbank");
System.out.print("user="+ss);

%>

<jsp:include page="header.jsp"></jsp:include>
<br>
<%

	
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitaladv","root","root");  
//here sonoo is database name, root is username and password  
Statement stmt=con.createStatement();  
ResultSet rs=stmt.executeQuery("select * from bloodbank where username='"+ss+"'");  
if(rs.next()) { 
	
	String uname=rs.getString(2);
	String pass=rs.getString(3);
	String name=rs.getString(4);
	String owner=rs.getString(5);
	String addresss=rs.getString(6);
	String licenseno=rs.getString(7);
	String mobile=rs.getString(8);
	String email=rs.getString(9);
	String city=rs.getString(10);
	String photo=rs.getString(11);

	//out.print(name);
	 //out.print(dept);
%><br>
<div style="margin-left:0%;background-color:lightgreen;height:50px;border-radius:10px;border:1px solid red;"><br>
<a href="bprofile.jsp" style="style:none;margin-left:3%;margin-top:2px;padding:5px;background-color:gray;color:Black;border-radius:10px;border:1px solid yellow;">Profile</a>
<a href="bloodbankappointment.jsp" style="style:none;margin-left:3%;margin-top:2px;padding:5px;background-color:gray;color:Black;border-radius:10px;border:1px solid yellow;">Requests</a>
<a href="binstruments.jsp" style="style:none;margin-left:3%;margin-top:2px;padding:5px;background-color:gray;color:Black;border-radius:10px;border:1px solid yellow;">Instruments</a>

<a href="stocks.jsp" style="style:none;margin-left:3%;margin-top:2px;padding:5px;background-color:gray;color:Black;border-radius:10px;border:1px solid yellow;">Stocks</a>

<a href="logout.jsp"style="style:none;margin-left:3%;margin-top:2px;padding:5px;background-color:gray;color:Black;border-radius:10px;border:1px solid yellow;"><span style="color:white"><%=name%></span>(Logout)</a>
</div><br>
<div style="margin-left:35%;">


<img src="<%=photo %>" style="height:300px;widht:200px;">
<h1 style="color:red;"><%=name %></h1>
<h5><%=addresss %>,<%=city %></h5>
</div>

</div>

<%} %>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>