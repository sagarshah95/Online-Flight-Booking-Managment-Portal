<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>
<head>
	<title>Home</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<link href= "<c:url value="C:\Users\shahs\Desktop\mycss.css"/>" rel="stylesheet">
<style>
body
{ 
background-size: cover;
background-position: center;
background: url("resources/images/airlinerImg.jfif");
}
</style>
</head>
<body>
	<form action="home.htm" method="post">
		<div class="container" style="margin-left:25%; margin-right:25%; margin-top:10%; width:540px;">
			<h2>Flight Booking Management Portal</h2>
			<a class="btn btn-success" type="submit" href="user.htm">LOGIN</a>&nbsp;
			<a class="btn btn-success" type="submit" style="float:right;" href="register.htm">REGISTER</a>
		</div>
	</form>
	
</body>
</html>




<!-- <html>
<head>
	<title>Home</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>
	<h2>Welcome to Flight Booking Management Portal</h2>
	<a href="user.htm">LOGIN</a></br>
	<a href="register.htm">REGISTER</a>
</body>
</html>-->

<!-- <html>

<head>
  <link href = "main.css" rel = "stylesheet" type = "text/css">
  <link href = "https://fonts.googleapis.com/css?family=Play" rel = "stylesheet">

</head>

<body>
  <h1 class="Heading"> Airline Reservation System </h1>
  <div class="signin">
    <form>
    <h2 style="color : white"> Log In</h2>
    <input type="text" name="username" placeholder="username">
    <input type="Password" name="password" placeholder="password"> <br><br>
    <a href="bookChkStatus.html"><input type="button" value="Log In"></a><br> <br>
    <div id = "container">

      <a href="reset.html" style="margin-right: 0px; font-size: 13px; font-family: Tahoma, Geneva, sans-serif;"> Reset password | </a>
      <a href="forget.html" style="margin-right: 0px; font-size: 13px; font-family: Tahoma, Geneva, sans-serif;"> Forgot password </a>

    </div> 
    <br><br><br><br><br><br>

     Don't have account?<a href="signup.html">&nbsp;Sign Up</a>
  
    </form>
  </div>
</body>
</html>-->