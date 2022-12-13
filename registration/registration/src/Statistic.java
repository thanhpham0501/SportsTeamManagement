

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
@WebServlet("/Stat")
public class Statistic extends HttpServlet {
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
    public Statistic() {
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
		String Statid=request.getParameter("statID");
		String statistic=request.getParameter("statistic");
		String statType=request.getParameter("statType");
		String player=request.getParameter("player");
		String season=request.getParameter("season");
		String option=request.getParameter("option");
		loadDriver(dbdriver);
		Connection con = getConnection();
		PreparedStatement ps;
		
		
		try {
			if (option.equals("Add")) { //Insert
				String sql = "insert into ClubStats (Statistic, StatType, Player, Season) values (?,?,?,?);";
				ps = con.prepareStatement(sql);
				ps.setString(1, statistic);
				ps.setString(2, statType);
				ps.setString(3, player);
				ps.setString(4, season);
				ps.executeUpdate();
			}
			 if(option.equals("Delete")) { // Delete
				String sql = "delete from ClubStats where StatID = ?;";
				ps = con.prepareStatement(sql);
				ps.setString(1, Statid);
				ps.executeUpdate();
			}
			 if(option.equals("Edit")){ //Update
				String sql = "update ClubStats set Statistic = ?, StatType = ?, Player = ?, Season = ? Where StatID = ?;";
				ps = con.prepareStatement(sql);
				ps.setString(1, statistic);
				ps.setString(2, statType);
				ps.setString(3, player);
				ps.setString(4, season);
				ps.setString(5, Statid);
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
