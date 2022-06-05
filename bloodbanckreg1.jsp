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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try
{

int DEFAULT_MAX_POST_SIZE = 1024 * 1024*1024;
MultipartRequest m = new MultipartRequest(request, "D:/bhim/workbench/HA/WebContent/uploadphoto",DEFAULT_MAX_POST_SIZE);

	String uname=m.getParameter("uname");
	String pass=m.getParameter("pass");
	String pname=m.getParameter("name");
	String oname=m.getParameter("ownername");
	String address=m.getParameter("address");
	String licno=m.getParameter("licno");
	String mob=m.getParameter("mob");
	String email=m.getParameter("email");
	String city=m.getParameter("city");
	String photo=m.getFilesystemName("photo");
	
	String path="uploadphoto";
	Class.forName("com.mysql.jdbc.Driver");  
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitaladv","root","root");  
	String q="insert into bloodbank(username,password,name,owner,address,licenseno,mobile,email,city,photo) values('"+uname+"','"+pass+"','"+pname+"','"+oname+"','"+address+"','"+licno+"','"+mob+"','"+email+"','"+city+"','"+path+"/"+photo+"')";
	//Statement stmt=con.createStatement();
	//stmt.executeUpdate(q);
		PreparedStatement ps=con.prepareStatement(q);
		int done=ps.executeUpdate();
		String q1="insert into bloodstock(bank) values('"+pname+"')";
		PreparedStatement ps1=con.prepareStatement(q1);
		ps1.executeUpdate();
		
	
		
	//ResultSet rs=stmt.executeQuery("select * from admin where username='"+name+"' and password='"+pass+"'");
if(done==1)
{
	%>
	<script>
	alert("Registration Completed");
	location.href="index.jsp";
	</script>
	<%
	
}
else{
	%>
	<script>
	alert("Please try again");
	location.href="index.jsp";
	</script>
	<%
}

	
	
}catch(Exception e){
	System.out.print(e);
	out.print(e);
	
}
%>
</body>
</html>