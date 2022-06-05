<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css">
<script type="text/javascript">

function user(event) {
//	alert(event.target.value);
	  location.href=event.target.value;
	}
</script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Index</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<br>

<div style="margin-left:0%;background-color:lightgreen;height:50px;border-radius:10px;border:1px solid red;"><br>
<a href="index.jsp" style="style:none;margin-left:3%;margin-top:2px;padding:5px;background-color:gray;color:Black;border-radius:10px;border:1px solid yellow;">Home</a>

<a href="hospitalsearch.jsp" style="style:none;margin-left:3%;margin-top:2px;padding:5px;background-color:gray;color:Black;border-radius:10px;border:1px solid yellow;">Hospital</a>
<a href="doctorsearch.jsp"style="style:none;margin-left:3%;margin-top:2px;padding:5px;background-color:gray;color:Black;border-radius:10px;border:1px solid yellow;">Doctor</a>
<a href="pathalogysearch.jsp"style="style:none;margin-left:3%;margin-top:2px;padding:5px;background-color:gray;color:Black;border-radius:10px;border:1px solid yellow;">Pathology Lab</a>
<a href="bloodbanksearch.jsp"style="style:none;margin-left:3%;margin-top:2px;padding:5px;background-color:gray;color:Black;border-radius:10px;border:1px solid yellow;">Blood Bank</a>

<a href="aboutus.jsp" style="style:none;margin-left:3%;margin-top:2px;padding:5px;background-color:gray;color:Black;border-radius:10px;border:1px solid yellow;">About Us</a>
<a href="contactus.jsp"style="style:none;margin-left:3%;margin-top:2px;padding:5px;background-color:gray;color:Black;border-radius:10px;border:1px solid yellow;">Contact Us</a>
</div><br>
<%
	
try
{
	String uname=request.getParameter("name");

	Class.forName("com.mysql.jdbc.Driver");  
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitaladv","root","root");  
	String q="select * from doctor where name='"+uname+"'";
	Statement stmt=con.createStatement();
	//stmt.executeUpdate(q);
		//ResultSet rs=con.createStatement(); 
		ResultSet rs=stmt.executeQuery(q);
	//ResultSet rs=stmt.executeQuery("select * from admin where username='"+name+"' and password='"+pass+"'");
	
	%>
	<table border=1 style="margin-left:12%">
		<tr><td>Name</td><td>Address</td><td>Doctor Type</td><td>Education</td><td>License No</td><td>Mobile</td><td>Email</td><td>Hospital</td><td>Hospital Address</td><td>Appointment</td></tr>
		
	<%
	while(rs.next())
		
{		String name=rs.getString(4);
String owner=rs.getString(5);
String address=rs.getString(6);
String lic=rs.getString(7);
String mob=rs.getString(8);
String email=rs.getString(9);
String city=rs.getString(10);
String ci=rs.getString(11);
String ci1=rs.getString(12);
String ci2=rs.getString(14);
String cityd=rs.getString(15);
String photo=rs.getString(16);
%>
<div style="margin-left:30%;">
<img src="<%=photo%>"style="margin-left:2px;height:200px;width:300px;">
<br>  


<span style="color:red;font-size:38px;font-style:italic;margin-top:-20px;font-size:30px"><%=name %></span ><br><span><%=ci1 %>
</span>,<span><%=ci2 %>
</span>,<span><%=cityd %>
</span><br>
<br>

<br><br></div>
<%


%>
<tr><td><%=name %></td><td><%=owner %></td><td><%=address %></td><td><%=lic %></td><td><%=mob %></td><td><%=city %></td><td><%=ci %></td><td><%=ci1 %></td><td><%=ci2 %><%=cityd%></td><td><a href="appointmenth.jsp?name=<%=ci1%>">Appointment</a></td></tr>

<%

}
	%>
	</table>
		
	<%
	
}
catch(Exception e){
	System.out.print(e);
	out.print(e);
	e.printStackTrace();
	
}

%>

<br><br><br><br><br><br><br>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>