package com.me.demo;

import java.util.List;
import javax.persistence.criteria.CriteriaBuilder;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.swing.JOptionPane;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;
import org.hibernate.hql.internal.ast.tree.RestrictableStatement;
import org.hibernate.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.me.pojo.User;
import com.me.dao.BookTicketDAO;
import com.me.dao.FlightDAO;
import com.me.dao.MessageDAO;
import com.me.dao.UserDAO;
import com.me.pojo.Flight;
import com.me.pojo.Message;
import com.me.pojo.TicketDetails;
import com.me.demo.UserController;

/**
* Displays Flight ticket of the user based on the phone number 
*/
@Controller
public class SearchResultsController {
	@RequestMapping(value = "/results.htm", method = RequestMethod.POST)
	public String handleRequest(HttpServletRequest request, UserDAO userdao, FlightDAO flightdao, BookTicketDAO bookticketdao) {
		String flight_number = request.getParameter("flight_number");
		int number_of_seats = Integer.parseInt(request.getParameter("seats"));
		long phone_number = Long.parseLong(request.getParameter("ph_number"));
		User user = bookticketdao.getUser(phone_number);
		System.out.println("user: "+user);
		if(user == null) {
			request.setAttribute("errormsg", "Error occured return to home page and try again");
			return "error-page";
		}
		String username = user.getUname();
		String lastname = user.getLname();
		System.out.println("username: "+username+" "+lastname);		
		Flight flight = bookticketdao.getFlightDetails(flight_number);
		System.out.println("flight: "+flight);
		if(flight == null) {
			request.setAttribute("errormsg", "Error occured return to home page and try again");
			return "error-page";
		}
		String source = flight.getSource();
		String destination = flight.getDestination();
		String travel_date = flight.getFlight_date();
		System.out.println("flight_number: "+flight_number+" source: "+source);
		System.out.println("phone_number: "+phone_number+" username: "+username+" lastname: "+lastname+" flight_number: "+flight_number+" source: "+source+" destination: "+destination+" number_of_seats: "+number_of_seats+" travel_date: "+travel_date );
		
		int ticket_details = bookticketdao.addTicketDetails(phone_number, username, lastname, flight_number, source, destination, number_of_seats, travel_date);
		System.out.println("ticketdetails: "+ticket_details);
		if(ticket_details == 1) {
			List<TicketDetails> ticketdetails = bookticketdao.getTicketDetails(phone_number);
			request.setAttribute("ticketdetails", ticketdetails);
			return "view-ticket";		
		}else {			
			request.setAttribute("errormsg", "not able to book ticket return to home page");
			return "error-page";
		}
				 
	}
	
}

