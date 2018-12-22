<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reminder</title>
<link rel = "stylesheet"  type = "text/css"   href = "Assets/CSS/home.css" />
<link rel = "stylesheet"  type = "text/css"   href = "Assets/CSS/customselect.css" />
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
  <a class="active" href="reminder.jsp">Send Reminder</a>
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
 
 <div class="center">
<h1><p style>Please select the member.</p></h1> 
</div>
<!--surround the select box with a "custom-select" DIV element. Remember to set the width:-->

 <form method="POST" action="/costestimator/reminder" name="reminder">
 <div class="custom-select" style="width:600px;">
 <select name="memberselect">
<option style="text-align:center;">Select Member:</option>
 
 
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager"%> 
<%
try
{
    Cookie cookie = null;
    Cookie[] cookies = null;
    String s3=null;
    
    // Get an array of Cookies associated with the this domain
    cookies = request.getCookies();
    
  	for( int i=0; i<cookies.length; i++)
  	 {	
  		cookie=cookies[i];
  		if(cookie.getName().equals("uname"))
  		 {
  	 			s3=cookie.getValue();
  		 }
  	 } 	
  	
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost:3306/cost_estimator";
String username="root";
String password="1960";
String q1="SELECT G_Id FROM sign_up WHERE username=('"+s3+"')";
Connection conn=DriverManager.getConnection(url,username,password);
Statement stmt=conn.createStatement();
ResultSet rs1 = stmt.executeQuery(q1);
String s6 = null;
 while(rs1.next())
{
	  s6 = rs1.getString(1);
}
 String query="SELECT username FROM sign_up WHERE G_Id=('"+s6+"')";
ResultSet rs9=stmt.executeQuery(query);
while(rs9.next())
{

%>
	<option value=""><%=rs9.getString("username")%></option>
        <%

}
%>

  </select>
</div>
  </br> 
  </br>    
<button class="selectedbutton">Submit</button>
 </form>
</div>
<%
    rs9.close();
    stmt.close();
    conn.close();
    }
catch(Exception e)
{
    e.printStackTrace();
    }

%>
<script type="text/javascript" src="Assets/JS/customselect.js"></script>
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