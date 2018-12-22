<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>About</title>
<link rel = "stylesheet" href = "Assets/CSS/home.css">
<link rel = "stylesheet" href = "Assets/CSS/about.css">
<link rel = "stylesheet" href = "Assets/CSS/msgdevp.css"/>
<link rel = "stylesheet" href = "https://fonts.googleapis.com/css?family=Raleway">
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
    <a class="active" href="about.jsp">About</a>
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


<h2 style="text-align:center">Profile Card</h2>

<div class="card">
  <img src="Assets/Images/profile.png" alt="Dushyant" style="width:70%">
  <h1>Dushyant Sharma</h1>
  <p class="title">Student</p>
  <p>Amity University</p>
  <p><button class="contactbtn" onclick="on()">Contact Us</button>
</p>
</div>

<div id="overlay" onclick="off()">
  <div id="text">
 							
  
  <div class="padding-64 center" style="height:600px;">
  	<div class="padding-64">
      <h1 style=color:white>Contact Details</h1>
	</div>     
      <p style="color:white; padding-top:64px;"><strong>Email:</strong> dushyant.sharma321@gmail.com</p>
      <p style="color:white; padding:bottom:128px;"><strong>Contact:</strong> +91-9999-8866-55</p>
         
    <div class="padding-64">
      <p style=color:white;><strong>Feel free to contact for any query</strong></p>
      <button class="messagebtn" onclick="change();">SEND A MESSAGE</button>
    </div>
    
  </div>
  
  
  </div>
</div>
  
  <script>
  
function change(){
      window.location='msgdevlp.jsp';
}

function openNav() {
    document.getElementById("mySidenav").style.width = "300px";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
}

function on() {
    document.getElementById("overlay").style.display = "block";
}

function off() {
    document.getElementById("overlay").style.display = "none";
}
</script>
  
</body>
</html>