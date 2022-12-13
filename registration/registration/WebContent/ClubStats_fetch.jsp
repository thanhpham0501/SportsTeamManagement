
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
<title>Club Statistics</title>
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
<h2 align="center"><font><strong>Club Statistics</strong></font></h2>
<table align="center" cellpadding="5" cellspacing="1" border="">
<tr>

</tr>
	<tr>
		<td><b>StatID</b></td>
		<td><b>Statistic</b></td>
		<td><b>StatType</b></td>
		<td><b>Player</b></td>
		<td><b>Season</b></td>
	
	</tr>
   <%
	try{	
		connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
		statement=connection.createStatement();
		String sql ="SELECT * FROM ClubStats";

		resultSet = statement.executeQuery(sql);
		while(resultSet.next()){
	%>
		<tr >
			
			<td><%=resultSet.getString("StatID") %></td>
			<td><%=resultSet.getString("Statistic") %></td>
			<td><%=resultSet.getString("StatType") %></td>
			<td><%=resultSet.getString("Player") %></td>
			<td><%=resultSet.getString("Season") %></td>
			
	
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