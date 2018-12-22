<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<link rel = "stylesheet"  type = "text/css"   href = "Assets/CSS/home.css" />
<link rel = "stylesheet"  type = "text/css"   href = "https://fonts.googleapis.com/css?family=Raleway">
<style>
body,h1 {font-family: "Raleway", sans-serif}
body, html {height: 100%}
</style>
</head>
<body>

<div class="header">
  <a href="home.jsp" class="logo">Cost Estimator</a>

  <div class="header-right">
    
	<a class="active" href="home.jsp">Home</a>
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


<div class="disp-middle">
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
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%
try
{
      	
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost:3306/cost_estimator";
String username="root";
String password="1960";
String q1="SELECT First_Name FROM sign_up WHERE username=('"+name+"')";
Connection conn=DriverManager.getConnection(url,username,password);
Statement stmt=conn.createStatement();
ResultSet rs1 = stmt.executeQuery(q1);
String s6 = null;
 while(rs1.next())
{
	  s6 = rs1.getString(1);
}
 
%> 


 	<h1 class="huge animate-top">Welcome <%= s6 %></h1>
    <hr class="welcome-grey-line disp-middle" style="margin:auto;width:120%;top:70% !important">
    <p class="less-huge center ">Splitting made easy</p>
    
</div>
<%
stmt.close();
  conn.close();
  }
catch(Exception e)
{
  e.printStackTrace();
  }

%>


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