import java.net.ResponseCache;
import java.sql.*;
import java.io.*;
import java.util.*;

import javax.servlet.*;

import java.io.IOException;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class message
 */
@WebServlet("/message")
public class message extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public message() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String s1 = request.getParameter("msg");
		String s3=null;
		
		try{
		Connection conn = getConnection();
		
		HttpSession session = request.getSession();
		if (session != null) {
			if (session.getAttribute("user") != null) {
				s3 = (String) session.getAttribute("user");
			} else {
				RequestDispatcher rrdd = request.getRequestDispatcher("login.jsp");
				rrdd.forward(request, response);
			}
		}
	    
       	//Database Value Updation                         
		 PreparedStatement posted = conn.prepareStatement("UPDATE sign_up SET message =('"+s1+"') WHERE username=('"+s3+"')");
		 response.getWriter().write("Database Updation Status: "+posted.executeUpdate());
	  	RequestDispatcher rrdd = request.getRequestDispatcher("updtexp.jsp");
        rrdd.forward(request, response);		
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
