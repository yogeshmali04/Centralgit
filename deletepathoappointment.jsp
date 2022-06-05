<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.oreilly.servlet.MultipartRequest" %>  
      <%@page import="java.sql.*"%>
      <%@page import=" java.io.IOException" %>
      <%@page import=" java.io.File" %>
      
      <%@page import=" java.nio.file.Files" %>
       <%@page import=" java.nio.file.Paths" %>
         
            
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>
<%






try{  
	Class.forName("com.mysql.jdbc.Driver");  
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitaladv","root","root");  
	
	
	  
	String mob=request.getParameter("mob");
	
				String q="delete from pathologyappointment where mob='"+mob+"'";
			
		PreparedStatement ps=con.prepareStatement(q);
			
		
		int done=ps.executeUpdate();
	
if(done==1)
{

		%>
	<script>
	alert("Appointment Deleted");
	location.href="pathologyappointmentshow.jsp";
	</script>
	<%
	
}
else{
	%>
	<script>
	alert("Please try again");
	location.href="pathologyappointmentshow.jsp";
	</script>
	<%
}

}catch(Exception e)
{
System.out.print(e);
out.print(e);
}



%>

</body>
</html>