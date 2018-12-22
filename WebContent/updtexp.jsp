<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<link rel = "stylesheet"   type = "text/css"   href = "Assets/CSS/home.css" />

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<style>
body,h1 {font-family: "Raleway", sans-serif}
body, html {height: 100%}
</style>
</head>
<body>

 <%	 	
		HttpServletResponse httpResponse = (HttpServletResponse)response;
 		httpResponse.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
 		httpResponse.setHeader("Pragma", "no-cache"); // HTTP 1.0.
 
 %>

<div class="header">
  <a href="home.jsp" class="logo">Cost Estimator</a>

  <div class="header-right">
    <a href="home.jsp">Home</a>
    <a href="about.jsp">About</a>
    <form method="POST" action="/costestimator/logout" name="logout_form">
	<button>Logout</button>
	</form>
  </div>

</div>


<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="expenditure.jsp">Update your Expenditure</a>
  <a href="members.jsp">Members List</a>
  <a href="billcheck.jsp">Check your bill</a>
 
</div>


<span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; Menu</span>


<div class="container " style="padding-left:480px;">
 	<h1 class="animate-top">Database Updated successfully</h1>    
</div>


<script>

function openNav() {
    document.getElementById("mySidenav").style.width = "300px";

}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";

}
</script>
</body>
</html>