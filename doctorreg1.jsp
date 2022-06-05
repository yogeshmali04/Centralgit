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

int DEFAULT_MAX_POST_SIZE = 1024 * 1024*1024;
MultipartRequest m = new MultipartRequest(request, "D:/bhim/workbench/HA/WebContent/uploadphoto",DEFAULT_MAX_POST_SIZE);

String ss=(String)session.getAttribute("hospitalname");
System.out.print("user="+ss);
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitaladv","root","root");  
//here sonoo is database name, root is username and password  
Statement stmt=con.createStatement();  
try{
	
		String uname=m.getParameter("uname");
		String pass=m.getParameter("pass");
	String name=m.getParameter("name");
	
	String address=m.getParameter("address");
	String dtype=m.getParameter("dtype");
	String edu=m.getParameter("education");
	
	String licno=m.getParameter("licno");
	String dob=m.getParameter("dob");	
	String mob=m.getParameter("mob");
	
	String email=m.getParameter("email");
	String hospitalname=m.getParameter("hospname");	
	String homeaddress=m.getParameter("homeaddress");
	
	String hospitaladdress=m.getParameter("hospaddress");	
	String city=m.getParameter("city");
	String photo=m.getFilesystemName("dphoto");
	String path="uploadphoto";
	String q="insert into doctor(username,password,name, address, doctortype, education, licenseno, dob, mobile, email, hospitalname, homeaddress, hospitaladdress, city,photo) values('"+uname+"','"+pass+"','"+name+"','"+address+"','"+dtype+"','"+edu+"','"+licno+"','"+dob+"','"+mob+"','"+email+"','"+hospitalname+"','"+homeaddress+"','"+hospitaladdress+"','"+city+"','"+path+"/"+photo+"')";
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
	location.href="doctorreg.jsp";
	</script>
	<%
	
}
else{
	%>
	<script>
	alert("Please try again");
	location.href="doctorreg.jsp";
	</script>
	<%
}

	
	
}catch(Exception e){
	System.out.print(e);
	out.print(e);
	e.printStackTrace();
	

}
%>



</body>
</html>