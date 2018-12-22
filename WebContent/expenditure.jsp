<!DOCTYPE html>
<html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Expenditure Updation</title>
<link rel = "stylesheet"   type = "text/css"   href = "Assets/CSS/home.css" />
<link rel="stylesheet"     type = "text/css"   href="https://fonts.googleapis.com/css?family=Raleway">
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
 
 
 		String name=null;
       	if (session != null) {
			if (session.getAttribute("user") != null) {
				name = (String) session.getAttribute("user");
			} else {
				RequestDispatcher rrdd = request.getRequestDispatcher("login.jsp");
				rrdd.forward(request, response);
			}
		}
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
  <a class="active" href="expenditure.jsp">Update your Expenditure</a>
  <a href="members.jsp">Members List</a>
  <a href="billcheck.jsp">Check your bill</a>
</div>

<span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; Menu</span>


<div class="container" style="padding-top:40px !important">
    <p style="font-size: 29px;">Please fill out the form below.</p>
    <hr>
	<form method="GET" action="/costestimator/home2" name="home">
    <label for="expenditure"><b>Expenditure</b></label>
    <input type="numeric" placeholder="Enter yout Expenditure" name="cost" required>
    <button type="submit" class="registerbtn">Submit</button>
    </form>
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