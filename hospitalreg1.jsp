<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <%@page import="com.oreilly.servlet.MultipartRequest" %>  
    
      <%@page import=" java.io.IOException" %>
      <%@page import=" java.nio.file.Files" %>
       <%@page import=" java.nio.file.Paths" %>
<%
int DEFAULT_MAX_POST_SIZE = 1024 * 1024*1024;
MultipartRequest m = new MultipartRequest(request, "D:/bhim/workbench/Hospital Advertiseme 1.0/WebContent/uploadphoto",DEFAULT_MAX_POST_SIZE);

		String uname=m.getParameter("uname");
		String pass=m.getParameter("pass");
		String hname=m.getParameter("name");
		String dname=m.getParameter("deanname");
		String hospaddress=m.getParameter("hospaddress");
		String licno=m.getParameter("licno");
		String est=m.getParameter("est");
		String mob=m.getParameter("mob");
		String email=m.getParameter("email");
		String city=m.getParameter("city");
		String web=m.getParameter("web");
		String file=m.getFilesystemName("photo");
		
System.out.print(file);
if(m.getParameter("submit")!=null)
{

	
try
{


	Class.forName("com.mysql.jdbc.Driver");  
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitaladv","root","root");  
	String p="uploadphoto";
	String q="insert into hospital(username,password,name,dean,licenseno,est,mobile,email,hospitaladdress,city,web,path) values('"+uname+"','"+pass+"','"+hname+"','"+dname+"','"+licno+"','"+est+"','"+mob+"','"+email+"','"+hospaddress+"','"+city+"','"+web+"','"+p+"/"+file+"')";
	//Statement stmt=con.createStatement();
	//stmt.executeUpdate(q);
		PreparedStatement ps=con.prepareStatement(q);
		int done=ps.executeUpdate();
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
}
%>
