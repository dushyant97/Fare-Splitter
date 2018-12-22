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

/**
 * Servlet implementation class SignUp
 */
@WebServlet("/SignUp")
public class SignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUp() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	/*protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try{
			Connection conn = getConnection();

            PreparedStatement posted = conn.prepareStatement("INSERT INTO sign_up(username,password,G_Id) VALUES ('x','x','x')");
			
			response.getWriter().write("Status: "+posted.executeUpdate());
			
		}catch(Exception e){System.out.println(e);}
	}*/

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
				String fname = request.getParameter("first_name");
				String lname = request.getParameter("last_name");
				String username = request.getParameter("username");
				String password = request.getParameter("password");
				String G_Id = request.getParameter("g_id");
				String title = request.getParameter("title");
				
							
				try{
					Connection conn = getConnection();
										
					PreparedStatement posted = conn.prepareStatement("INSERT INTO sign_up(Title,First_Name,Last_Name,G_Id,username,password) VALUES ('"+title+"' , '"+fname+"' , '"+lname+"' , '"+G_Id+"' , '"+username+"' , '"+password+"')");
					
					response.getWriter().write("Database Updation Status: "+posted.executeUpdate());
									
					RequestDispatcher rs = request.getRequestDispatcher("home.jsp");
			        rs.forward(request, response);
			
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
