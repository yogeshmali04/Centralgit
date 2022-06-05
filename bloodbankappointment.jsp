<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
    <%@page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Appointment Form</title>
</head>
<body>
<%
String ss=(String)session.getAttribute("bloodbank");
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
ResultSet rs=stmt.executeQuery("select * from bloodbank where username='"+ss+"'");  
if(rs.next()) { 
	
	String uname=rs.getString("username");
	String name1=rs.getString("name");
	//String bname=rs.getString("bloodbank");
	System.out.print(name1);
%><br>
<div style="margin-left:0%;background-color:lightgreen;height:50px;border-radius:10px;border:1px solid red;"><br>
<a href="bprofile.jsp" style="style:none;margin-left:3%;margin-top:2px;padding:5px;background-color:gray;color:Black;border-radius:10px;border:1px solid yellow;">Profile</a>
<a href="bloodbankappointment.jsp" style="style:none;margin-left:3%;margin-top:2px;padding:5px;background-color:gray;color:Black;border-radius:10px;border:1px solid yellow;">Requests</a>

<a href="stocks.jsp" style="style:none;margin-left:3%;margin-top:2px;padding:5px;background-color:gray;color:Black;border-radius:10px;border:1px solid yellow;">Stocks</a>

<a href="logout.jsp"style="style:none;margin-left:3%;margin-top:2px;padding:5px;background-color:gray;color:Black;border-radius:10px;border:1px solid yellow;"><span style="color:white"><%=name1%></span>(Logout)</a>
</div><br>
<div>
<%	

	String q="select * from bappointment where bloodbank='"+name1+"'";
	Statement stmt1=con.createStatement();
	//stmt.executeUpdate(q);
		//ResultSet rs=con.createStatement(); 
		ResultSet rs1=stmt1.executeQuery(q);
	//ResultSet rs=stmt.executeQuery("select * from admin where username='"+name+"' and password='"+pass+"'");
	
	%>
	<h1 style="margin-left:30%;">Blood Request List</h1>
	<table border=1 style="margin-left:15%">
		<tr><td>Patient Name</td><td>Address</td><td>Age</td><td>Gender</td><td>Blood Group</td><td>Quantity</td><td>Mobile</td><td>Email</td><td>Blood Bank</td><td>City</td><td>Status</td><td>Action</td></tr>
		
	<%
	while(rs1.next())
		
{
		String name2=rs1.getString(1);
		String add=rs1.getString(2);
		String age=rs1.getString(3);
		String gen=rs1.getString(4);
		String prob=rs1.getString(5);
		String mobile=rs1.getString(6);		
		String email=rs1.getString(7);
		String hospital=rs1.getString(8);
		String city=rs1.getString(9);
		String stat=rs1.getString(10);
		String stat1=rs1.getString(11);
		
		%>	
		<tr><td><%=name2 %></td><td><%=add %></td><td><%=age %></td><td><%=gen %></td><td><%=prob %></td><td><%=mobile %></td><td><%=email %></td><td><%=hospital %></td><td><%=city %></td><td><%=stat %></td><td><a href="processbloodbankrequest.jsp?mob=<%=email %>"><%=stat1 %></a></td><td><a href="deletebloodbankappointment.jsp?mob=<%=email %>" style="color:red;">X</a></td></tr>
		
		<%

}
	%>
	</table>
		
	<%




}}
catch(Exception e)
{
	System.out.print(e);
}
%><br><br></div>	
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>