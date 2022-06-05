<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
    <%@page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>
<%
try{
	String uname=request.getParameter("mob");
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitaladv","root","root");  
//here sonoo is database name, root is username and password  
Statement stmt=con.createStatement();  
String dept,name,status="Confirmed";;
ResultSet rs=stmt.executeQuery("select * from bappointment where mob='"+uname+"'");  
if(rs.next()) { 
	String stat=rs.getString(11);
	 
	 
	 
	 if(stat.equals("Pending"))
	 {
		
		 String update="update bappointment set status='Confirmed' where mob='"+uname+"'";
		 
		 PreparedStatement ps=con.prepareStatement(update);
		 int done=ps.executeUpdate();
		 if(done==1)
		 {
		 %>
		<script type="text/javascript">
		alert("Status Changed Successfuly");
		location.href="bloodbankappointment.jsp";
		</script>
		<%}
		 	 
	 }
	 
	 else
	 {
		 String update="update bappointment set status='Pending' where mob='"+uname+"'";
		 PreparedStatement ps=con.prepareStatement(update);
		 int done=ps.executeUpdate();
		 if(done==1)
		 {
		 %>
		<script type="text/javascript">
		alert("Status Changed Successfuly");
		location.href="bloodbankappointment.jsp";
		</script>
		<%}
		 
	 }
	
	 
		 }
		 

}
catch(Exception e)
{
out.print(e);	
}


%>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>