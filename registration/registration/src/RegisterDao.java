import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class RegisterDao {
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

	public String insert(Admin admin) {
		loadDriver(dbdriver);
		Connection con = getConnection();
		String sql = "insert into Admins (Username, Pass, Email, AdminContactInfo, "
				+ "AdminFirstName, AdminLastName, AdminDetails) values(?,?,?,?,?,?,?)";
		String result="Data Entered Successfully";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, admin.getUname());
			ps.setString(2, admin.getPassword());
			ps.setString(3, admin.getEmail());
			ps.setString(4, admin.getPhone());
			ps.setString(5, admin.getFirstName());
			ps.setString(6, admin.getLastName());
			ps.setString(7, admin.getDetails());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			result="Data Not Entered Successfully";
			e.printStackTrace();
		}
		return result;

	}
}
