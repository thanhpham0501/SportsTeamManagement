
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
   
	String driverName = "com.mysql.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:3306/";
	String dbName = "SportsTeam";
	String userId = "root";
	String password = "";
	
	try {
		Class.forName(driverName);
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}
	
	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
%>

<head>
<meta charset="ISO-8859-1">
<title>Players</title>
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">
	
<!-- navigation buttons-->
    <div class="signin-content" >
        <div class="form-group form-button" style="margin:3px" >
            <form action="home">
                <input type="submit" name="signin" id="signin"
		class="form-submit" value="Home" />
            </form>
        </div>
        <div class="form-group form-button" style="margin:3px">
            <form action="events">
                <input type="submit" name="signin" id="signin"
		class="form-submit" value="Events" />
            </form>
        </div>
        <div class="form-group form-button" style="margin:3px">
            <form action="stat">
                <input type="submit" name="signin" id="signin"
		class="form-submit" value="Stats" />
            </form>
        </div>
        <div class="form-group form-button" style="margin:3px">
            <form action="players">
                <input type="submit" name="signin" id="signin"
		class="form-submit" value="Players" />
            </form>
        </div>
        <div class="form-group form-button" style="margin:3px" >
            <form action="login">
                <input type="submit" name="signin" id="signin"
		class="form-submit" value="Login" />
            </form>
            
        </div>
        <div class="form-group form-button" style="margin:3px">
            <form action="register">
                <input type="submit" name="signin" id="signin"
		class="form-submit" value="Register" />
            </form>
        </div>
    </div>
         <!-- /navigation buttons-->


<!-- Main css -->
<link rel="stylesheet" href="css/style.css">
</head>
<div class="sign-in">
   <div class="container">
<h2 align="center"><font><strong>Players</strong></font></h2>
<table align="center" cellpadding="5" cellspacing="1" border="">
<tr>

</tr>
	<tr>
		<td><b>ID</b></td>
		<td><b>FirstName</b></td>
		<td><b>LastName</b></td>
		<td><b>Player Position</b></td>
		<td><b>Dominant Hand</b></td>
		<td><b>Health Status</b></td>
		<td><b>Date Of Birth</b></td>
		<td><b>ContactInfo</b></td>
		<td><b>Sponsor Name</b></td>
		<td><b>PlayerStats</b></td>
	</tr>
   <%
	try{	
		connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
		statement=connection.createStatement();
		String sql ="SELECT * FROM Players";

		resultSet = statement.executeQuery(sql);
		while(resultSet.next()){
	%>
		<tr >
			
			<td><%=resultSet.getString("PlayerID") %></td>
			<td><%=resultSet.getString("FirstName") %></td>
			<td><%=resultSet.getString("LastName") %></td>
			<td><%=resultSet.getString("PlayerPosition") %></td>
			<td><%=resultSet.getString("DominantHand") %></td>
			<td><%=resultSet.getString("PlayerHealth") %></td>
			<td><%=resultSet.getString("DOB") %></td>
			<td><%=resultSet.getString("ContactInfo") %></td>
			<td><%=resultSet.getString("SponsorName") %></td>
			<td><%=resultSet.getString("PlayerStats") %></td>
	
		</tr>
		            
	<%		
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
</table>
</div>
</div>