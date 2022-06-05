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
String uname=(String)session.getAttribute("doctor");
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
String v10=m.getParameter("v10");
String v11=m.getParameter("v11");
String v12=m.getParameter("v12");

String v14=m.getParameter("v14");
String v15=m.getFilesystemName("v15");
	
	try{  
		Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitaladv","root","root");  
		String q="update doctor set username='"+v1+"',password='"+v2+"',name='"+v3+"',address='"+v4+"',doctortype='"+v5+"',education='"+v6+"',licenseno='"+v7+"',dob='"+v8+"',mobile='"+v9+"',email='"+v10+"',hospitalname='"+v11+"',hospitaladdress='"+v12+"',city='"+v14+"',photo='"+v15+"' where username='"+uname+"'";
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
		location.href="dprofile.jsp";
		</script>
		<%		
	}
	else{%>
	<script>
	alert("Plese try again.");
	location.href="dprofile.jsp";
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