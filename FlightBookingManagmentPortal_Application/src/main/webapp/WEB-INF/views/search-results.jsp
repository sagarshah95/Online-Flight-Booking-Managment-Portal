<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import = "java.util.List" %>
<%@ page import = "com.me.pojo.Flight" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
   
<!DOCTYPE html>
<html>

  <head>

    <link href = "searchResults.css" rel = "stylesheet" type = "text/css">
    <link href = "https://fonts.googleapis.com/css?family=Play" rel = "stylesheet">
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
    <div class="container-wrapper">
    <div class="container" style="margin-top:5%; margin-left:25%; width:722px;">

    <div class = "page-header">
    <h1 class="Heading"> Get flights with best deals </h1>
    <div class="list">
        <h3>Search Results based on the filters</h3>
<div class="table-responsive">
          <table border="1" cell-padding="15" class="table">
			  <!-- List <Melightssage> flightList = (List <Flight>) request.getAttribute("searchflightList");-->
	              <tr class="success"> 
	                <th>Flight Number</th>
	                <th>Source</th>
	                <th>Destination</th>
	                <th>Price</th>					
	              </tr>
              		 
			      <c:forEach var="flg" items="${searchflightList}">
                        <tr>
                        <td><c:out value=" ${flg.getFlight_number()} " /></td>
                        <td><c:out value=" ${flg.getSource()} " /></td>
                        <td><c:out value=" ${flg.getDestination()} " /></td>
                        <td><c:out value=" ${flg.getNumber_of_seats()} " /></td>                 
                        </tr>
                  </c:forEach>
          </table>
</div>
          <br><br><br>
          <form action="results.htm" method="post">
<div class="form-group">
				Enter Flight number  :<br/>
				<input type="text" name="flight_number" class="form-control" placeholder="Flight No." style="width:200px;"/><br/>
				Enter number of seats:<br/>
				<input type="text" name="seats" class="form-control" placeholder="Seats" style="width:200px;"/><br/>
				Enter phone number   :<br/>
				<input type="text" name="ph_number" class="form-control" placeholder="Phone No." style="width:200px;"/><br/>
				
				<a class="btn btn-success" type="submit" href="option.htm">HOME</a>&nbsp;
				<input type="submit" class="btn btn-success" value="Book Flight" style="margin-left: 28px;"/>
				<a class="btn btn-success" type="submit" href="home.htm">LOGOUT</a>&nbsp;
</div>
		  </form>
          <!--<a href="index.html" style="text-decoration: none"> Go back to home page </a> -->
         
    </div>
  </body>
</html>




    
 