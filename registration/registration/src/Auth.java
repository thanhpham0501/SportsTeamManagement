public class Auth {
	
	private String username,password;
	private static final long serialVersionUID = 1L;
	
	public Auth() {
		super();
	}
	
	public Auth(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}
	
	public String getUserName() {
		return username;
	}
	
	void setUserName(String UserName) {
		this.username = UserName;
	}
	
	public String getPassword() {
		return password;
	}
	
	void setPassword(String Password) {
		this.password = Password;
	}
}

