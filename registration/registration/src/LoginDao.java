

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;

public class LoginDao {
	private String dburl = "jdbc:mysql://localhost:3306/SportsTeam";
	private String dbuname = "root";
	private String dbpassword = "";
	private String dbdriver = "com.mysql.jdbc.Driver";

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
	
	public boolean validate(Auth login) {
		boolean status = false;
		
		loadDriver(dbdriver);
		Connection con = getConnection();
		String sql = "select * from Admins where Username = ? and Pass = ?;";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, login.getUserName());
			ps.setString(2, login.getPassword());
			
			ResultSet rs = ps.executeQuery();
			status = rs.next();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return status;
	}	
}
