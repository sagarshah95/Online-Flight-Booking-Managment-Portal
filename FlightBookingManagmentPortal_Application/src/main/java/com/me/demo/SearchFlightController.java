package com.me.demo;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.me.pojo.User;
import com.me.dao.FlightDAO;
import com.me.dao.MessageDAO;
import com.me.dao.UserDAO;
import com.me.pojo.Flight;
import com.me.pojo.Message;

/**
 * Searches various Flights based on various parameters 
 */


@Controller
public class SearchFlightController {

	@RequestMapping(value = "/search_flight.htm", method = RequestMethod.POST)
	public String handleRequest(HttpServletRequest request, FlightDAO flightdao) {
		String source = request.getParameter("source");
		System.out.println(source);
		String destination = request.getParameter("destination");
		String flight_date = request.getParameter("travel_date");
		int seat_count = Integer.parseInt(request.getParameter("ticket_count"));
		System.out.println("source: "+source+" destination: "+destination+" flight_date: "+flight_date+" seat_count: "+seat_count);
		List<Flight> flightList = flightdao.searchFlights(source, destination, flight_date);
		System.out.println(flightList);
		if(flightList == null) {
			request.setAttribute("errormsg", "No flight found for search criteria");
			return "error-page";
		}else {	
		for(Flight flg : flightList) {
			System.out.println(flg.getFlight_number()+" ");
		}		 
		request.setAttribute("searchflightList", flightList);		 	 
		return "search-results";
		}
	}
	
}
