<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.oreilly.servlet.MultipartRequest" %>  
      <%@page import="java.sql.*"%>
      <%@page import=" java.io.IOException" %>
      <%@page import=" java.nio.file.Files" %>
       <%@page import=" java.nio.file.Paths" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>
<%
String uname=(String)session.getAttribute("bloodbank");
%>

<%

int DEFAULT_MAX_POST_SIZE = 1024 * 1024*1024;
MultipartRequest m = new MultipartRequest(request, "D:/bhim/workbench/HA/WebContent/uploadphoto",DEFAULT_MAX_POST_SIZE);

String v1=m.getParameter("v1");
String v2=m.getParameter("v2");
String v3=m.getParameter("v3");
String v4=m.getParameter("v4");
String v5=m.getParameter("v5");
String v6=m.getParameter("v6");
String v7=m.getParameter("v7");
String v8=m.getParameter("v8");
String v9=m.getParameter("v9");
String v10=m.getFilesystemName("v10");
	
	try{  
		Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitaladv","root","root");  
		String q="update bloodbank set username='"+v1+"',password='"+v2+"',name='"+v3+"',owner='"+v4+"',address='"+v5+"',licenseno='"+v6+"',mobile='"+v7+"',email='"+v8+"',city='"+v9+"',photo='"+v10+"' where username='"+uname+"'";
		PreparedStatement ps=con.prepareStatement(q);
  		int done=ps.executeUpdate();
		//ResultSet rs=stmt.executeQuery("select * from admin where username='"+name+"' and password='"+pass+"'");
	if(done==1)
	{
		%> 
		<script>
		alert("Profile Updated");
		location.href="bprofile.jsp";
		</script>
		<%		
	}
	else{%>
	<script>
	alert("Plese try again.");
	location.href="bprofile.jsp";
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