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
	String uname=request.getParameter("lic");

	Class.forName("com.mysql.jdbc.Driver");  
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitaladv","root","root");  
	String q="select * from bloodbank where licenseno='"+uname+"'";
	Statement stmt=con.createStatement();
	//stmt.executeUpdate(q);
		//ResultSet rs=con.createStatement(); 
		ResultSet rs=stmt.executeQuery(q);
	//ResultSet rs=stmt.executeQuery("select * from admin where username='"+name+"' and password='"+pass+"'");
	
	%>
	<table border=1 style="margin-left:30%">
		<tr><td>Bank Name</td><td>Owner</td><td>Address</td><td>Lic No</td><td>Mobile</td><td>Email</td><td>City</td></tr>
		
	<%
	while(rs.next())
		
{		String name=rs.getString(4);
String owner=rs.getString(5);
String address=rs.getString(6);
String lic=rs.getString(7);
String mob=rs.getString(8);
String email=rs.getString(9);
String cityd=rs.getString(10);
String photo=rs.getString(11);
%>
<div style="margin-left:30%;">
<img src="<%=photo%>"style="margin-left:2px;height:200px;width:300px;">
<br>  


<span style="color:red;font-size:38px;font-style:italic;margin-top:-20px;font-size:30px"><%=name %></span ><br><span><%=address %>
</span>,<span><%=cityd %>
</span>


<a href="appointmentb.jsp?name=<%=name%>" style="color:white;width:30px;background-color:#e02696;padding:13px 36px;margin-left:30%;margin-top:100px;border-radius:10px;
		;" >Request</a>

<br><br></div>
<%


%>
<tr><td><%=name %></td><td><%=owner %></td><td><%=address %></td><td><%=lic %></td><td><%=mob %></td><td><%=email %></td><td><%=cityd%></td>
</tr>

<%

}
	%>
	</table>
	<%	Statement stmt1=con.createStatement();  
ResultSet rs1=stmt1.executeQuery("select * from bloodbank where licenseno='"+uname+"'");  
if(rs1.next()) { 
	
	String uname1=rs1.getString(2);
	String pass=rs1.getString(3);
	String hname=rs1.getString(4);
	String gender=rs1.getString(5);
	String addresss=rs1.getString(6);
	String yr=rs1.getString(7);
	String year=rs1.getString(8);
	
	ResultSet rs2=stmt.executeQuery("select * from bloodstock where bank='"+hname+"'");  
	if(rs2.next()) { 
		
		String apos=rs2.getString(2);
		String aposp=rs2.getString(3);
		String aposs=rs2.getString(4);
		
		String aneg=rs2.getString(5);
		String anegp=rs2.getString(6);
		String anegs=rs2.getString(7);
		
		String bpos=rs2.getString(8);
		String bposp=rs2.getString(9);
		String bposs=rs2.getString(10);
		
		String bneg=rs2.getString(11);
		String bnegp=rs2.getString(12);
		String bnegs=rs2.getString(13);
		
		String abpos=rs2.getString(14);
		String abposp=rs2.getString(15);
		String abposs=rs2.getString(16);
		
		String abneg=rs2.getString(17);
		String abnegp=rs2.getString(18);
		String abnegs=rs2.getString(19);
		
		String opos=rs2.getString(20);
		String oposp=rs2.getString(21);
		String oposs=rs2.getString(22);
		
		String oneg=rs2.getString(23);
		String onegp=rs2.getString(24);
		String onegs=rs2.getString(25);
		
	
%>
		
		<br>
<div>

<fieldset style="margin-left:30%;margin-right:23%;">
<div style="margin-left:10%; margin-right:24%;">
<table style="align:center;">


<tr>

<h1>Stocks</h1>
</tr>
<tr><td>Group Name</td><td>Price</td><td>Stock</td></tr>

<tr>

<td>a+</td><td><input type="text" name="aposprice" value="<%=aposp%>"required></td>
<td><input type="text"name="aposstock"value="<%=aposs%>"></td>
</tr>


<tr>

<td>a-</td><td><input type="text" name="anegprice" value="<%=anegp%>"></td><td><input type="text"name="anegstock"value="<%=anegs%>"></td>
</tr>
<tr>

<td>b+</td><td><input type="text" name="bposprice" value="<%=bposp%>"></td><td><input type="text"name="bposstock"value="<%=bposs%>"></td>
</tr>
<tr>

<td>b-</td><td><input type="text" name="bnegsprice" value=<%=bnegp%>></td><td><input type="text"name="bnegstock"value="<%=bnegs%>"></td>
</tr>
<tr>

<td>ab+</td><td><input type="text" name="abposprice" value=<%=abposp%>></td><td><input type="text"name="abposstock"value="<%=abposs%>"></td>
</tr>
<tr>

<td>ab-</td><td><input type="text" name="abnegprice" value=<%=abnegp%>></td><td><input type="text"name="abnegstock"value="<%=abnegs%>"></td>
</tr>
<tr>

<td>o+</td><td><input type="text" name="oposprice"value=<%=oposp%> ></td><td><input type="text"name="oposstock"value="<%=oposs%>"></td>
</tr>
<tr>

<td>o-</td><td><input type="text" name="onegprice" value=<%=onegp%>></td><td><input type="text"name="onegstock"value="<%=onegs%>"></td>
</tr>

<tr>

</tr>

</table>
</fieldset>
</div>
		
	<%
	}}}	

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