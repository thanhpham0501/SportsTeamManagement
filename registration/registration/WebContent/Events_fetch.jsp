
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
<h2 align="center"><font><strong>Events</strong></font></h2>
<head>
<meta charset="ISO-8859-1">
<title>Events</title>
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">
</head>
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