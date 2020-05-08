<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<style>
body
{ 
background-size: cover;
background-position: center;
//background: url(airlinerImg.jfif);
//background: url(https://media.giphy.com/media/IzL667EYx01N8TXN9k/giphy.gif);
background: url("resources/images/airlinerImg.jfif");
}
</style>
</head>
	<body>
		<form action="option.htm" method="post">
			<div class="container" style="margin-top:5%; margin-left:25%; width:722px;">
				<h2>Home Page</h2>
				<a href="search_flight.htm"><input type="button" class="btn btn-success" value="FIND FLIGHTS FOR BEST DEALS"></a>
				<a href="view.htm"><input class="btn btn-success" style="float:right;" type="button" value="View your Ticket"></a>
				<a class="btn btn-success" type="submit" class="btn btn-success"  href="home.htm">LOGOUT</a>&nbsp;
			</div>
		</form>
	</body>
</html>