<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>WELCOME TO YOUR ACCOUNT</title>
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
<form action="user.htm" method="post">
<div class="form-group">
	    <label class="control-label col-sm-2" for="email">Username: </label>
<input type="text" name="un" class="form-control" placeholder="Username" style="width:200px;"/><br/>
	
	<label class="control-label col-sm-2" for="email">Password: </label>
<input type="password" name="up" class="form-control" placeholder="Password" style="width:200px;"/><br/>
	
	<input class="btn btn-success" type="submit" value="LOGIN"/>
</div>
</form>
</div>
</body>
</html>
