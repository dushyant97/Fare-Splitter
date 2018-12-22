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
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		boolean ty = false;
		
		try{
			Connection conn = getConnection();
			
			ResultSet rs = null;
			
			PreparedStatement posted = conn.prepareStatement(" SELECT username , password FROM sign_up WHERE username=? AND password=? ");
			
			posted.setString(1, username);
			posted.setString(2, password);
			
			rs = posted.executeQuery(); 
		    ty = rs.next();
		    if(ty){
		    	Cookie ck=new Cookie("uname",username);//creating cookie object  
			    ck.setMaxAge(60*10);
				response.addCookie(ck);//adding cookie in the response
		    	HttpSession session = request.getSession(true);
				// session if exist
				// or create one
		    	session.setAttribute("user", username);
		    	session.setMaxInactiveInterval(60*10); 
		    	response.sendRedirect("home.jsp");
		    }
		    else
		    {
		    	RequestDispatcher rrdd = request.getRequestDispatcher("relogin.jsp");
				rrdd.forward(request, response);

		    }
		    
			//response.getWriter().write("Database Fetching Status: "+posted.executeUpdate());
	
		}catch(Exception e){System.out.println(e);}
		
		
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
