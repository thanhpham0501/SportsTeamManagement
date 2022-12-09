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
<h2 align="center"><font><strong>Admin Panel</strong></font></h2>
<head>
<meta charset="ISO-8859-1">
<title>Admin Panel</title>
</head>
<body>


<% 
boolean loginStat = (boolean)session.getAttribute("loginStatus"); 
String LoginStatus;
if (loginStat){
	LoginStatus = "Logged In";

%>

<h1><%= LoginStatus %></h1>
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
<h2 align="center"><font><strong>Add a Club Statistic</strong></font></h2>
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
				<td><input type="submit" value="Add/Edit"></td>
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