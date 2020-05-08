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
<div class="container" style="margin-top:5%; margin-left:25%">
	<h2>ENTER YOUR PHONE NUMBER TO VIEW YOUR TICKET</h2>
	<form action="ticket.htm" method="post">
<div class="form-group">
		<input type="text"  name="ph_number" class="form-control" placeholder="Phone" style="width:200px;"/><br/>
		<input type="submit" class="btn btn-success" value="Show Ticket" />
	</form>
</div>
</body>
</html>