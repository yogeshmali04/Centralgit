<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Start WOWSlider.com HEAD section -->
<link rel="stylesheet" type="text/css" href="engine1/style.css" />
<script type="text/javascript" src="engine1/jquery.js"></script>
<!-- End WOWSlider.com HEAD section -->
<link rel="stylesheet" type="text/css" href="style.css">
<script type="text/javascript">

function user(event) {

	  location.href=event.target.value;
	}
</script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Index</title>
</head>
<body style="background-color:lightgray;">
<jsp:include page="header.jsp"></jsp:include>
<br>

<div style="margin-left:0%;height:50px;border-radius:10px;border:1px solid red;"><br>
<a href="index.jsp" class="nav">Home</a>
<a href="hospitalsearch.jsp" class="nav">Hospital</a>
<a href="doctorsearch.jsp"class="nav">Doctor</a>
<a href="pathalogysearch.jsp"class="nav">Pathology Lab</a>
<a href="bloodbanksearch.jsp"class="nav">Blood Bank</a>
<a href="aboutus.jsp"class="nav" >About Us</a>
<a href="contactus.jsp"class="nav">Contact Us</a>
</div><br>
<div style="margin-left:3%;">
<form action="logincheck.jsp" method="get" name="login">

<h1><i>Login Form</i></h1><br>
<label>User Type</label>
<select name="types" class="text">
<option style="border-radius:10px;">Admin</option>
<option style="border-radius:10px;">Hospital</option>
<option style="border-radius:10px;">Doctor</option>
<option style="border-radius:10px;">Pathology</option>
<option style="border-radius:10px;">Blood Bank</option>
</select>
<br><br>
<label>UserName</label>
<input type="text" name="username" class="text" ><br><br>
<label>Password &nbsp;</label>
<input type="password" name="password" class="text"><br>
<br>
<input type="submit" value="Login">
<input type="reset" value="Reset">
</form>
<br>
Register for-<select size="1" class="text"onchange="user(event);">
<option selected>Select Here</option>
<option value="hospitalreg.jsp">Hospital</option>
<option value="doctorreg.jsp">Doctor</option>
<option value="pathologyreg.jsp">Pathology</option>
<option value="bloodbanckreg.jsp">Blood Bank</option>

</select>
</div>
<div style="margin-left: 279px; margin-top: -292px;border-radius:10px;">
<!-- Start WOWSlider.com BODY section -->
<div id="wowslider-container1">
<div class="ws_images"><ul>
		<li><img src="data1/images/hospital1.jpg" alt="Hospital Advertisement" title="Hospital Advertisement" id="wows1_0"/></li>
		<li><img src="data1/images/shutterstock_127010054.jpg" alt="Doctors Advertisement" title="Doctors Advertisement" id="wows1_1"/></li>
		<li><a href="http://wowslider.net"><img src="data1/images/blood_bank_header_image.png" alt="jquery carousel" title="BloodBank Advertisement" id="wows1_2"/></a></li>
		<li><img src="data1/images/pathology.png" alt="Pathology Advertisement" title="Pathology Advertisement" id="wows1_3"/></li>
	</ul></div>
	<div class="ws_bullets"><div>
		<a href="#" title="Hospital Advertisement"><span><img src="data1/tooltips/hospital1.jpg" alt="Hospital Advertisement"/>1</span></a>
		<a href="#" title="Doctors Advertisement"><span><img src="data1/tooltips/shutterstock_127010054.jpg" alt="Doctors Advertisement"/>2</span></a>
		<a href="#" title="BloodBank Advertisement"><span><img src="data1/tooltips/blood_bank_header_image.png" alt="BloodBank Advertisement"/>3</span></a>
		<a href="#" title="Pathology Advertisement"><span><img src="data1/tooltips/pathology.png" alt="Pathology Advertisement"/>4</span></a>
	</div></div><div class="ws_script" style="position:absolute;left:-99%"><a href="http://wowslider.com">wow slider</a> by WOWSlider.com v8.7</div>
<div class="ws_shadow"></div>
</div>	
<script type="text/javascript" src="engine1/wowslider.js"></script>
<script type="text/javascript" src="engine1/script.js"></script>
<!-- End WOWSlider.com BODY section -->
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>