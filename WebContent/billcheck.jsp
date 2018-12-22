<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Check your Bill</title>
<link rel = "stylesheet"   type = "text/css"   href = "Assets/CSS/home.css" />
<link rel = "stylesheet"   type = "text/css"   href = "Assets/CSS/msgdevp.css" />
<link rel = "stylesheet"   type = "text/css"   href = "https://www.w3schools.com/w3css/4/w3.css">
<link rel = "stylesheet"   type = "text/css"   href="https://fonts.googleapis.com/css?family=Raleway">

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
  <a href="expenditure.jsp">Update your Expenditure</a>
  <a href="members.jsp">Members List</a>
  <a class="active" href="billcheck.jsp">Check your bill</a>
  
</div>

<span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; Menu</span>

</br>
</br>
</br>

<div class="container">
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<div class="w3-responsive">
<form method="post">
<table class="w3-table-all w3-card-4 centered large" border="2px">
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
int count=0;
while(rs1.next())
{
	  s6 = rs1.getString(1);
}
 String q3="SELECT COUNT(username) FROM sign_up WHERE G_Id=('"+s6+"')";

 ResultSet rs = stmt.executeQuery(q3); 
 while(rs.next())
 {
 	count=rs.getInt(1);  
 }
 %>
<tr>
<th class="hover-green">Total Number of People in Group</th>
<td class="hover-blue"><%=count%></td>
</tr>

<% 
String q4="SELECT SUM(expenses) FROM sign_up WHERE G_Id=('"+s6+"')";
ResultSet rs3 = stmt.executeQuery(q4);
int sum=0;
while(rs3.next())
{
	sum=rs3.getInt(1);
}
float answer =sum/count;
%>
<tr>
<th class="hover-green">Total Expenditure</th>
<td class="hover-blue"><%=sum%></td>
</tr>
<tr>
<th class="hover-green">Cost per person</th>
<td class="hover-blue"><%=answer%></td>
</tr>
</table>
    <%
    rs.close();
    stmt.close();
    conn.close();
    }
catch(Exception e)
{
    e.printStackTrace();
    }

%>
</form>
</div>
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