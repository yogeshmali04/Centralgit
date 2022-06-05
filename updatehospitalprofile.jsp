<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.oreilly.servlet.MultipartRequest" %>  
      <%@page import="java.sql.*"%>
      <%@page import=" java.io.IOException" %>
      <%@page import=" java.nio.file.Files" %>
       <%@page import=" java.nio.file.Paths" %><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>
<%
String uname=(String)session.getAttribute("hospitalname");
%>

<%

String path="uploadphoto";
int DEFAULT_MAX_POST_SIZE = 1024 * 1024*1024;
MultipartRequest m = new MultipartRequest(request, "D:/bhim/workbench/HA/WebContent/uploadphoto",DEFAULT_MAX_POST_SIZE);

String v1=m.getParameter("uname");
String v2=m.getParameter("pass");
String v3=m.getParameter("name");
String v4=m.getParameter("dean");
String v5=m.getParameter("lic");
String v6=m.getParameter("eyr");
String v7=m.getParameter("mob");
String v8=m.getParameter("email");
String v9=m.getParameter("address");
String v10=m.getParameter("city");
String v11=m.getParameter("website");
String v12=m.getFilesystemName("photo");
	
	try{  
		Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitaladv","root","root");  
		String q="update hospital set username='"+v1+"',password='"+v2+"',name='"+v3+"',dean='"+v4+"',licenseno='"+v5+"',est='"+v6+"',mobile='"+v7+"',email='"+v8+"',hospitaladdress='"+v9+"',city='"+v10+"',web='"+v11+"',path='"+path+"/"+v12+"' where username='"+uname+"'";
		//Statement stmt=con.createStatement();
		//stmt.executeUpdate(q);
  		PreparedStatement ps=con.prepareStatement(q);
  		int done=ps.executeUpdate();
		//ResultSet rs=stmt.executeQuery("select * from admin where username='"+name+"' and password='"+pass+"'");
	if(done==1)
	{
		%>
		<script>
		alert("Profile Updated");
		location.href="hprofile.jsp";
		</script>
		<%		
	}
	else{%>
	<script>
	alert("Plese try again.");
	location.href="hprofile.jsp";
	</script>
	<%
	}
	
}catch(Exception e)
{
	System.out.print(e);
}



%>

</body>
</html>