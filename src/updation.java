import java.net.ResponseCache;
import java.sql.*;
import java.io.*;
import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.*;

import java.io.IOException;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class home
 */
@WebServlet("/home")
public class home extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public home() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub	    
		String s2 = request.getParameter("cost");
		String s3=null;
		int price= Integer.parseInt(s2);
		int count=0,sum=0;
	    Cookie cookie = null;
        Cookie[] cookies = null;
	
		try{

		Connection conn = getConnection();
		
		cookies = request.getCookies();
	    for( int i=0; i<cookies.length; i++)
	      {	
	     	cookie=cookies[i];
	     	if(cookie.getName().equals("uname"))
	     	 {
	      			s3=cookie.getValue();
	     	 }
	      } 		 
		
	    ResultSet rs = null;
	    ResultSet rs3 = null;
	   //Database Value Updation                         
		 PreparedStatement posted = conn.prepareStatement("UPDATE sign_up SET expenses =('"+s2+"') WHERE username=('"+s3+"')");
		response.getWriter().write("Database Updation Status: "+posted.executeUpdate());
		//Group ID retrieval
		PreparedStatement posted2 = conn.prepareStatement("SELECT G_Id FROM sign_up WHERE username=('"+s3+"')");
        ResultSet rs1 = posted2.executeQuery();
        String s6 = null;
         while(rs1.next())
       {
        	  s6 = rs1.getString(1);
       }
         
        PreparedStatement posted5 = conn.prepareStatement("SELECT COUNT(username) FROM sign_up WHERE G_Id=('"+s6+"')");
     
		rs = posted5.executeQuery(); 
		while(rs.next())
		{
			count=rs.getInt(1);  
		}

		PreparedStatement posted3 = conn.prepareStatement("SELECT SUM(expenses) FROM sign_up WHERE G_Id=('"+s6+"')");
		rs3 = posted3.executeQuery();
		while(rs3.next())
		{
			sum=rs3.getInt(1);
		}
		response.getWriter().println("Database fetched Group ID is  "+s6);
		response.getWriter().write("sum is "+sum);
		response.getWriter().println("Total number of members are "+count);
		float answer =sum/count;
		response.getWriter().println("Cost per person is "+answer);
		
		
		}catch(Exception e){System.out.println(e);}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}
	
	public static Connection getConnection() throws Exception {
	      try {
	    	  String driver="com.mysql.jdbc.Driver";
	    	  String url="jdbc:mysql://localhost:3306/cost_estimator";
	    	  String username="root";
	    	  String password="1960";
	    	  Class.forName(driver);
	    	  
	    	  Connection conn = DriverManager.getConnection(url,username,password);
	    	  System.out.println("connected");
	    	  return conn;
	      } catch(Exception e){System.out.println(e);}
	      
	      return null;
	}

}