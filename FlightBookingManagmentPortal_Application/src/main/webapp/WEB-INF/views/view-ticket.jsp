<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "com.me.pojo.TicketDetails" %>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<title>VIEW YOUR TICKET</title>
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
<h1>View your Ticket</h1>
	<body>
	<form action="ticket.htm">
    <div class="container-wrapper">
    <div class = "container">
    <div class = "page-header">
    <h1 class="Heading"></h1>
    <div class="list">
       
          <table border="1" cell-padding="15">
			   <!-- List <Melightssage> flightList = (List <Flight>) request.getAttribute("searchflightList");-->
	              <tr> 
	                <th>Phone Number</th>
	                <th>First Name</th>
	                <th>Last Name</th>
	                <th>Flight Number</th>
					<th>Departure from</th>
					<th>Arrival at</th>
					<th>Number of seats</th>
					<th>Departure Date</th>
	              </tr>
              		
              	   <c:forEach var="ticket" items="${ticketdetails}">
                        <tr>
                        <td><c:out value=" ${ticket.getPhone_number()} " /></td>
                        <td><c:out value=" ${ticket.getFname()} " /></td>
                        <td><c:out value=" ${ticket.getLname()} " /></td>
                        <td><c:out value=" ${ticket.getFlight_number()} " /></td>
                        <td><c:out value=" ${ticket.getSource()}" /> </td>
                        <td><c:out value=" ${ticket.getDestination()}" /> </td>
                        <td><c:out value=" ${ticket.getSeats()}" /> </td>
                        <td><c:out value=" ${ticket.getTravel_date()}" /> </td>
                        </tr>
                  </c:forEach>
			   
          </table>
          <br><br><br>
          <a class="btn btn-success" type="submit" href="option.htm">HOME</a>&nbsp;
          <!-- <a class="btn btn-success" type="submit" href="option.htm">HOME</a>&nbsp;-->
          <!-- <a href="view-option.jsp"><input type="button" value="Back">Go back to Home page</a>-->
    </div>
    </form>
  </body>
</html>