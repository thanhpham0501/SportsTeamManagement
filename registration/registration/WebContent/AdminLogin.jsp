<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Admin Login</title>
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

<body>
<h2 align="center"><font><strong>Admin Login</strong></font></h2>
	<form action="Login" method="post">
		<table align="center">
			<tr>
				<td>User Name</td>
				<td><input type="text" name="uname"></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td>Submit</td>
				<td><input type="submit" value="login"></td>
			</tr>
		</table>
	</form>	
</body>
</html>