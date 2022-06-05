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
<title>Insert title here</title>
</head>
<body>
<div style="background-color:gray;border-radius:10px;">


<%
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitaladv","root","root");  


%>
<table align="center"  style="margin-top:70px;margin-left:5%;">


<th>Name</th>
<th>Email</th>
 <th>Feedback</th>
<%    Statement st1=con.createStatement();
    ResultSet rs1=st1.executeQuery("select * from feedback limit 5");
while (rs1.next())
{
	
    String customer=rs1.getString(2);
    String email=rs1.getString(3);
    String feedback=rs1.getString(4);
   
%>

                             <tr>
                 <td><%=customer %></td>
                  <td><%=email %></td>
                   <td><%=feedback%></td>
                   </tr>








              <% }
 
%>
</table>


<div style="margin-top:-70px;">


<h3 align="center">Feedback Form</h3>
<form action="savefeedback.jsp" method="post">
<table align="center">
<tr>
<td>Enter Your Name</td><td><input type="text" name="cname">
</td>
</tr>
<tr>
<td>Enter Your Email</td><td><input type="email" name="email">
</td>
</tr>
<tr>
<td>Feedback</td><td><textarea  name="feedback" cols="20" rows="3">
</textarea></td>

</tr>
<tr>
<td><input type="submit"value="submit" name="submit"></td><td><input type="reset" name="Clear"></td>

</tr>
</tr>

</table>
</form>


</div></div>
<div style="margin-left:0%;background-color:#c3e4cc;height:50px;border-radius:10px;border:1px solid red;box-shadow:3px 3px gray;">
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Developed by - <span style="color:#e11fdf;">Pratiksha,Sangita and Aarti </span>
</div>
</body>
</html>