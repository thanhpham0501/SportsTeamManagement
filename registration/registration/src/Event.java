import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Event")
public class Event extends HttpServlet {
	private String dburl = "jdbc:mysql://localhost:3306/SportsTeam";
	private String dbuname = "root";
	private String dbpassword = "";
	private String dbdriver = "com.mysql.jdbc.Driver";
	
	private static final long serialVersionUID = 1L;
    
	public void loadDriver(String dbDriver)
	{
		try {
			Class.forName(dbDriver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public Connection getConnection() {
		Connection con = null;
		try {
			con = DriverManager.getConnection(dburl, dbuname, dbpassword);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Event() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String eventID=request.getParameter("eventID");
		String eventTitle=request.getParameter("eventTitle");
		String eventType=request.getParameter("eventType");
		String eventDetails=request.getParameter("eventDetails");
		String eventDate=request.getParameter("eventDate");
		String option=request.getParameter("option");
		loadDriver(dbdriver);
		Connection con = getConnection();
		PreparedStatement ps;
		
		try {
			if (option.equals("Add")) { //Insert
				String sql = "insert into Events (EventsTitle, EventsType, EventsDetails, EventsDate) values (?,?,?,?);";
				ps = con.prepareStatement(sql);
				ps.setString(1, eventTitle);
				ps.setString(2, eventType);
				ps.setString(3, eventDetails);
				ps.setString(4, eventDate);
				ps.executeUpdate();
			}
			 if(option.equals("Delete")) { // Delete
				String sql = "delete from Events where EventsID = ?;";
				ps = con.prepareStatement(sql);
				ps.setString(1, eventID);
				ps.executeUpdate();
			}
			 if(option.equals("Edit")){ //Update
				String sql = "update Events set EventsTitle = ?, EventsType = ?, EventsDetails = ?, EventsDate = ? Where EventsID = ?;";
				ps = con.prepareStatement(sql);
				ps.setString(1, eventTitle);
				ps.setString(2, eventType);
				ps.setString(3, eventDetails);
				ps.setString(4, eventDate);
				ps.setString(5, eventID);
				ps.executeUpdate();
			}
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			//result="Data Not Entered Successfully";
			e.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher("LoginSuccess.jsp");
		rd.forward(request,response);
	}
}
