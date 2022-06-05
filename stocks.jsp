<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*" %>
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
<title></title>
</head>
<body onload="doctors()">
<%
String ss=(String)session.getAttribute("bloodbank");
System.out.print("user="+ss);

%>

<jsp:include page="header.jsp"></jsp:include>
<br>
<%

	
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitaladv","root","root");  
//here sonoo is database name, root is username and password  
Statement stmt=con.createStatement();  
ResultSet rs1=stmt.executeQuery("select * from bloodbank where username='"+ss+"'");  
if(rs1.next()) { 
	
	String uname=rs1.getString(2);
	String pass=rs1.getString(3);
	String hname=rs1.getString(4);
	
	String gender=rs1.getString(5);
	String addresss=rs1.getString(6);
	String yr=rs1.getString(7);
	String year=rs1.getString(8);
	ResultSet rs=stmt.executeQuery("select * from bloodstock where bank='"+hname+"'");  
	if(rs.next()) { 
		
		String apos=rs.getString(2);
		String aposp=rs.getString(3);
		String aposs=rs.getString(4);
		String aneg=rs.getString(5);
		String anegp=rs.getString(6);
		String anegs=rs.getString(7);
		String bpos=rs.getString(8);
		String bposp=rs.getString(9);
		String bposs=rs.getString(10);
		String bneg=rs.getString(11);
		String bnegp=rs.getString(12);
		String bnegs=rs.getString(13);
		String abpos=rs.getString(14);
		String abposp=rs.getString(15);
		String abposs=rs.getString(16);
		String abneg=rs.getString(17);
		String abnegp=rs.getString(18);
		String abnegs=rs.getString(19);
		String opos=rs.getString(20);
		String oposp=rs.getString(21);
		String oposs=rs.getString(22);
		String oneg=rs.getString(23);
		String onegp=rs.getString(24);
		String onegs=rs.getString(25);
		
	
%><br><div style="margin-left:0%;background-color:lightgreen;height:50px;border-radius:10px;border:1px solid red;"><br>
<a href="bprofile.jsp" style="style:none;margin-left:3%;margin-top:2px;padding:5px;background-color:gray;color:Black;border-radius:10px;border:1px solid yellow;">Profile</a>
<a href="bloodbankappointment.jsp" style="style:none;margin-left:3%;margin-top:2px;padding:5px;background-color:gray;color:Black;border-radius:10px;border:1px solid yellow;">Requests</a>

<a href="stocks.jsp" style="style:none;margin-left:3%;margin-top:2px;padding:5px;background-color:gray;color:Black;border-radius:10px;border:1px solid yellow;">Stocks</a>

<a href="logout.jsp"style="style:none;margin-left:3%;margin-top:2px;padding:5px;background-color:gray;color:Black;border-radius:10px;border:1px solid yellow;"><span style="color:white"><%=hname%></span>(Logout)</a>
</div><br><div>

<fieldset style="margin-left:20%;margin-right:20%;">
<div style="margin-left:35%;">
<table style="align:center;">

<form action="stocks.jsp" method="post">
<tr>

<h1>Stocks</h1>
</tr>
<tr><td>Group Name</td><td>Price</td><td>Stock</td></tr>

<tr>

<td>a+</td><td><input type="text" name="aposprice" value="<%=aposp%>"required></td>
<td><input type="text"name="aposstock"value="<%=aposs%>"></td>
</tr>


<tr>

<td>a-</td><td><input type="text" name="anegprice" value="<%=anegp%>"></td>
<td><input type="text"name="anegstock"value="<%=anegs%>"></td>
</tr>
<tr>

<td>b+</td><td><input type="text" name="bposprice" value="<%=bposp%>"></td>
<td><input type="text"name="bposstock"value="<%=bposs%>"></td>
</tr>
<tr>

<td>b-</td><td><input type="text" name="bnegsprice" value=<%=bnegp%>></td>
<td><input type="text"name="bnegstock"value="<%=bnegs%>"></td>
</tr>
<tr>

<td>ab+</td><td><input type="text" name="abposprice" value=<%=abposp%>></td>
<td><input type="text"name="abposstock"value="<%=abposs%>"></td>
</tr>
<tr>

<td>ab-</td><td><input type="text" name="abnegprice" value=<%=abnegp%>></td>
<td><input type="text"name="abnegstock"value="<%=abnegs%>"></td>
</tr>
<tr>

<td>o+</td><td><input type="text" name="oposprice"value=<%=oposp%> ></td>

<td><input type="text"name="oposstock"value="<%=oposs%>"></td>
</tr>
<tr>

<td>o-</td><td><input type="text" name="onegprice" value=<%=onegp%>></td>
<td><input type="text"name="onegstock"value="<%=onegs%>"></td>
</tr>






<tr>
<td><input type="submit" value="update" name="submit"></td><td><input type="reset" value="Clear"></td>
</tr>
</form>
</table>
</fieldset>
</div>

<%}}
if(request.getParameter("submit")!=null)
{
try
{
	
	//String apos=request.getParameter("aposprice");
	String aposp=request.getParameter("aposprice");
	String aposs=request.getParameter("aposstock");
	
	//String aneg=request.getParameter("aneg");
	String anegp=request.getParameter("anegprice");
	String anegs=request.getParameter("anegstock");
	
	//String bpos=request.getParameter("bpos");
	String bposp=request.getParameter("bposprice");
	String bposs=request.getParameter("bposstock");
	
	//String bneg=request.getParameter("bneg");
	String bnegp=request.getParameter("bnegsprice");
	String bnegs=request.getParameter("bnegstock");
	
	//String abpos=request.getParameter("abpos");
	String abposp=request.getParameter("abposprice");
	String abposs=request.getParameter("abposstock");
	
	//String abneg=request.getParameter("abneg");
	String abnegp=request.getParameter("abnegprice");
	String abnegs=request.getParameter("abnegstock");
	
	//String opos=request.getParameter("opos");
	String oposp=request.getParameter("oposprice");
	String oposs=request.getParameter("oposstock");
	
	//String oneg=request.getParameter("oneg");
	String onegp=request.getParameter("oposprice");
	String onegs=request.getParameter("onegstock");

	String q="update bloodstock set aposprice='"+aposp+"',aposstock='"+aposs+"',anegprice='"+anegp+"',anegstock='"+anegs+"'	,bposprice='"+bposp+"',bposstock='"+bposs+"',bnegprice='"+bnegp+"',bnegstock='"+bnegs+"',abposprice='"+abposp+"',abposstock='"+abposs+"',abnegprice='"+abnegp+"',abnegstock='"+abnegs+"',oposprice='"+oposp+"',oposstock='"+oposs+"',onegprice='"+onegp+"',onegposstock='"+onegs+"'";
			//Statement stmt=con.createStatement();
	//stmt.executeUpdate(q);
		PreparedStatement ps=con.prepareStatement(q);
		int done=ps.executeUpdate();
	//ResultSet rs=stmt.executeQuery("select * from admin where username='"+name+"' and password='"+pass+"'");
if(done==1)
{
	%>
	<script>
	alert(" Stock Updated");
	location.href="stocks.jsp";
	</script>
	<%
	
}

	%>
	<script>
	alert("Updated");
	location.href="stocks.jsp";
	</script>
	<%


	
	
}catch(Exception e){
	System.out.print(e);
	out.print(e);
	e.printStackTrace();
	

}}
%>



<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>