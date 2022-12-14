<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import= "javax.servlet.http.HttpSession" %>
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
   
<!DOCTYPE html>
<html>
<head>
<title>Admin Panel</title>
<meta charset="ISO-8859-1">
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
<h2 align="center"><font><strong>Admin Panel</strong></font></h2>

<link rel="stylesheet" href="css/style.css">
</head>
<body>


<% 
boolean loginStat = (boolean)session.getAttribute("loginStatus"); 
String LoginStatus;
if (loginStat){
	LoginStatus = "Logged In";

%>

<h1><%= LoginStatus %></h1>
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
		//int colCounter = 0;	
		while(resultSet.next()){
		//colCounter++;	
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
<h2 align="center"><font><strong>Add, Edit or Delete a Club Statistic</strong></font></h2>
<form action="Stat" method="post">
		<table align="center">
			<tr>
				<td>Stat ID</td>
				<td><input type="text" name="statID"></td>
			</tr>
			<tr>
				<td>Statistic</td>
				<td><input type="text" name="statistic"></td>
			</tr>
			<tr>
				<td>StatType</td>
				<td><input type="text" name="statType"></td>
			</tr>
			<tr>
				<td>Player</td>
				<td><input type="text" name="player"></td>
			</tr>
			<tr>
				<td>Season</td>
				<td><input type="text" name="season"></td>
			</tr>
			<tr>
				<td>
				<select name="option" id="option">
				  <option value="Add">Add</option>
				  <option value="Edit">Edit</option>
				  <option value="Delete">Delete</option>
				</select>
				</td>
			</tr>
			<tr>
				<td>Submit</td>
				<td><input type="submit" value="Add/Edit/Delete"></td>
			</tr>
		</table>
	</form>	
	
	<!-- Event ----------------------- -->
	<h2 align="center"><font><strong>Events</strong></font></h2>
	<table align="center" cellpadding="10" cellspacing="10" border=".2">
<tr>

</tr>
	<tr>
		<td><b>ID</b></td>
		<td><b>Title</b></td>
		<td><b>Type</b></td>
		<td><b>Details</b></td>
		<td><b>Date</b></td>
	</tr>
   <%
	try{	
		connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
		statement=connection.createStatement();
		String sql ="SELECT * FROM Events";

		resultSet = statement.executeQuery(sql);
		while(resultSet.next()){
	%>
		<tr >
			
			<td><%=resultSet.getString("EventsID") %></td>
			<td><%=resultSet.getString("EventsTitle") %></td>
			<td><%=resultSet.getString("EventsType") %></td>
			<td><%=resultSet.getString("EventsDetails") %></td>
			<td><%=resultSet.getString("EventsDate") %></td>
			
		</tr>
		            
	<%		
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
</table>
<h2 align="center"><font><strong>Add, Edit or Delete an Event</strong></font></h2>
<form action="Event" method="post">
		<table align="center">
			<tr>
				<td>Event ID</td>
				<td><input type="text" name="eventID"></td>
			</tr>
			<tr>
				<td>Title</td>
				<td><input type="text" name="eventTitle"></td>
			</tr>
			<tr>
				<td>EventType</td>
				<td><input type="text" name="eventType"></td>
			</tr>
			<tr>
				<td>Event Details</td>
				<td><input type="text" name="eventDetails"></td>
			</tr>
			<tr>
				<td>Event Date</td>
				<td><input type="text" name="eventDate"></td>
			</tr>
			<tr>
				<td>
				<select name="option" id="option">
				  <option value="Add">Add</option>
				  <option value="Edit">Edit</option>
				  <option value="Delete">Delete</option>
				</select>
				</td>
			</tr>
			<tr>
				<td>Submit</td>
				<td><input type="submit" value="Add/Edit/Delete"></td>
			</tr>
		</table>
	</form>	

<!-- Players ----------------------- -->
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
<h2 align="center"><font><strong>Add, Edit or Delete a Player</strong></font></h2>
<form action="Player" method="post">
		<table align="center">
			<tr>
				<td>Player ID</td>
				<td><input type="text" name="playerID"></td>
			</tr>
			<tr>
				<td>First Name</td>
				<td><input type="text" name="firstName"></td>
			</tr>
			<tr>
				<td>Last Name</td>
				<td><input type="text" name="lastName"></td>
			</tr>
			<tr>
				<td>Player Position</td>
				<td><input type="text" name="playerPos"></td>
			</tr>
			<tr>
				<td>Dominant Hand</td>
				<td><input type="text" name="playerHand"></td>
			</tr>
			<tr>
				<td>Health Status</td>
				<td><input type="text" name="playerHealth"></td>
			</tr>
			<tr>
				<td>Date Of Birth</td>
				<td><input type="text" name="playerDOB"></td>
			</tr>
			<tr>
				<td>ContactInfo</td>
				<td><input type="text" name="playerContact"></td>
			</tr>
			<tr>
				<td>Sponsor Name</td>
				<td><input type="text" name="playerSponsor"></td>
			</tr>
			<tr>
				<td>PlayerStats</td>
				<td><input type="text" name="playerStats"></td>
			</tr>
			<tr>
				<td>
				<select name="option" id="option">
				  <option value="Add">Add</option>
				  <option value="Edit">Edit</option>
				  <option value="Delete">Delete</option>
				</select>
				</td>
			</tr>
			<tr>
				<td>Submit</td>
				<td><input type="submit" value="Add/Edit/Delete"></td>
			</tr>
		</table>
	</form>	



<%}
else{
	LoginStatus = "Not Logged In";
	%>
	<h1><%= LoginStatus %></h1>
	<%
}
%>


</body>
</html>