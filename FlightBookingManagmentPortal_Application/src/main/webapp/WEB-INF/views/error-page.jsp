<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Error Page</title>
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
	${requestScope.errormsg}
	<a class="btn btn-success" type="submit" href="option.htm">HOME</a>&nbsp;
</body>
</html>