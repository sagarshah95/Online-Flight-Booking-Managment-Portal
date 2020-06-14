# Online-Flight-Booking-Managment-Portal

Background:
Airline Travel Agency Application is a computerized system used to store & retrieve information and conduct transactions related to
air travel. It is projected towards enhancing customers and airline agency relations in order to make it convenient for customers in
order to book flights according to their requirements such that they can utilize this software for making reservations. It facilitates
airline schedules, fare tariffs, passenger reservations, ticket records. This system manages millions of reservation requests and
cancellations, ticket fares, reservation pricing requests initiated by travel agencies using this system.


Mission Statements / Objectives:

➢ Airline Reservation System is an implementation of a general Airline Ticketing website that helps customers to search the
availability and prices of various airline tickets, along with different packages available with reservations.

➢ The project has been planned to be having a view of distributed database architecture, with centralized storage of the database.

➢ It deals with monitoring information and transactions of the booking counter.

➢ The system allows airline passengers to search for flights that are available between two travel cities, namely "Departure city"
and "Arrival city" for a departure and arrival dates. The system displays flight details such as flight no & price.

➢ After a search, the system displays a list of available flights and allows the customer to book a flight. Then system checks for
availability of seats on the flight. If seats are available, then the system allows the passenger to book a seat.


Tools and Technologies used:

Java EE, Spring MVC, Maven, Hibernate, SQL, MySQL Workbench, HTML, CSS, Bootstrap, STS, XML, POJO, DAO, Controllers, REST API


Process high-level overview:

➢ Developed an annotation-based, multi-user Spring MVC app in Hibernate and implemented Spring security for authentication.

➢ Built an interactive UI using Bootstrap, jQuery, CSS to built Spring WebFlow, for continuous flow throughout the application.

➢ Persisted data in MySQL, built REST APIs for request/response between client and server, implemented apache-commons email


Process Flow:

➢ Created SQL tables such as 'usertable', 'admintable', 'flightstable', 'ticketstable' inside 'flightbookingportal' db in MySQL
Workbench.

➢ Crafted POJO classes such as ‘User.java’ to store user information for registration and login purpose, ‘Admin.java’ for adding
flights in flight table, ‘FlightDetails.java’ for storing flight details attributes, ‘TicketDetails.java’ for storing ticket details.

➢ Generated ‘user.hbm.xml’, ‘admin.hbm.xml’, ‘flight.hbm.xml’, ‘ticketdetails.hbm.xml’ files to map POJOs to respective SQL
tables.
➢ Connected above .hbm files to 'flightbookingportal' database via mySQL jdbc driver using ‘hibernate.cfg.xml file’.

➢ Extended ‘DAO.java’ which is an abstract class used to create Session factory object to implement various sub-DAO classes and
defined methods inside each DAO classes such as 'UserDAO.java' for adding and retrieving user records from 'usertable',
'AdminDAO.java' to add and delete flights from 'flightstable', ‘FlightDAO.java’ to retrieve flights from 'flightstable',
‘BookTicketDAO.java’ to insert ticket details inside 'ticketstable'

➢ Implemented various Controller classes along with JSPs for creating web-flow such as Home Controller along with 'home.jsp' to
create Home page, ‘UserController.java’ along with 'login.jsp' and 'register.jsp' for signing in and registering users,
'SearchFlightController.java' along with ‘user-view.jsp' in order to search flights based on various parameters such as source,
destination and date, 'SearchResultsController.java' along with 'search-results.jsp' to display flights table based on search
criteria, 'ShowTicketController.java' along with 'enter-number.jsp' and 'show-ticket.jsp' to display User's ticket based on the
authentication of the phone number
