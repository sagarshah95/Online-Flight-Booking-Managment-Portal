<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.util.List" %>
<%@ page import = "com.me.pojo.Message" %>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Flights</title>
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

<!-- Welcome ${requestScope.user.uname}
-->
<!-- Custom styles for this template -->
   
<h1 class="Heading"> Search Flights by filling up the following parameters </h1>
    <form action="search_flight.htm" method="post">
       <div class="booking-form-box">

          <div class="booking-form">

            <label> Flying From </label>
            <input type="text" class="form-control" placeholder="City or Airport" name="source"></br>
            <br>
            <label> Flying To </label>
            <input type="text" class="form-control" placeholder="City or Airport" name="destination"></br>
            
            <div class="input-grp">
               
              <label> Travel Date</label>
              <input type ="date" class="form-control select-date" placeholder="Enter date in MM/DD/YYYY" name="travel_date">

            </div>

            <div class="input-grp">
        
              <label> Number of tickets </label>
              <input type ="number" class="form-control" value="1" name="ticket_count">
           
            </div>

            <div class="input-grp">
        
              <!-- <label> Travel Class </label>
              <select class="custom-select">
                <option value="1">Economy Class</option>
                <option value="2">Business Class</option>
                 
            </select>-->
            </div>

            <div class="input-grp">
              
              <input type="submit" class="btn btn-success" value="Serach Flights" />
              <!-- <a href="searchResults.htm" type="submit" class="search" style = "text-decoration: none; font-family: 'Play', sans-serif;
                   color : White;">&nbsp; Show Flights</a> -->
              <a class="btn btn-success" type="submit" href="home.htm">LOGOUT</a>&nbsp;
             </div>
            
             <div class="home">


              <!-- <a href="index.html" style="text-decoration: none"> Go back to home page </a> -->

            </div>


          </div>

       </div>
 </form>
</body>
</html>