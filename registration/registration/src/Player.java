

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
@WebServlet("/Player")
public class Player extends HttpServlet {
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
    public Player() {
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
		String playerID=request.getParameter("playerID");
		String firstName=request.getParameter("firstName");
		String lastName=request.getParameter("lastName");
		String playerPos=request.getParameter("playerPos");
		String playerHand=request.getParameter("playerHand");
		String playerHealth=request.getParameter("playerHealth");
		String playerDOB=request.getParameter("playerDOB");
		String playerContact=request.getParameter("playerContact");
		String playerSponsor=request.getParameter("playerSponsor");
		String playerStats=request.getParameter("playerStats");
		String option=request.getParameter("option");
		loadDriver(dbdriver);
		Connection con = getConnection();
		PreparedStatement ps;	
		
		try {
			if (option.equals("Add")) { //Insert
				String sql = "insert into Players (FirstName, LastName, PlayerPosition, DominantHand, PlayerHealth, "
						+ "DOB, ContactInfo, SponsorName, PlayerStats) values (?,?,?,?,?,?,?,?,?);";
				ps = con.prepareStatement(sql);
				ps.setString(1, firstName);
				ps.setString(2, lastName);
				ps.setString(3, playerPos);
				ps.setString(4, playerHand);
				ps.setString(5, playerHealth);
				ps.setString(6, playerDOB);
				ps.setString(7, playerContact);
				ps.setString(8, playerSponsor);
				ps.setString(9, playerStats);
				ps.executeUpdate();
			}
			 if(option.equals("Delete")) { // Delete
				String sql = "delete from Players where PlayerID = ?;";
				ps = con.prepareStatement(sql);
				ps.setString(1, playerID);
				ps.executeUpdate();
			}
			 if(option.equals("Edit")){ //Update
				String sql = "update Players set FirstName = ?, LastName = ?, PlayerPosition = ?, DominantHand = ?,"
						+ " PlayerHealth = ?, DOB = ?, ContactInfo = ?, SponsorName = ?, PlayerStats = ? Where PlayerID = ?;";
				ps = con.prepareStatement(sql);
				ps.setString(1, firstName);
				ps.setString(2, lastName);
				ps.setString(3, playerPos);
				ps.setString(4, playerHand);
				ps.setString(5, playerHealth);
				ps.setString(6, playerDOB);
				ps.setString(7, playerContact);
				ps.setString(8, playerSponsor);
				ps.setString(9, playerStats);
				ps.setString(10, playerID);
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
