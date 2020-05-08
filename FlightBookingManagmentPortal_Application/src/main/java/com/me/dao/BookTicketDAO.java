package com.me.dao;

import java.util.List;

import org.hibernate.query.Query;

import com.me.pojo.Flight;
import com.me.pojo.Message;
import com.me.pojo.TicketDetails;
import com.me.pojo.User;

public class BookTicketDAO extends DAO{
	
	   private void beginTransaction() {
	        getSession().beginTransaction();
	    }

	    protected void commit() {
	        getSession().getTransaction().commit();;
	    }
	
	public User getUser(long phone_number) {
		Query query = getSession().createQuery("FROM User WHERE id=:phone_number ");
		query.setLong("phone_number", phone_number);
		return (User) query.uniqueResult();
	}
	
	public Flight getFlightDetails(String flight_number) {
		Query query = getSession().createQuery("FROM Flight WHERE flight_number=:flight_number ");
		query.setString("flight_number", flight_number);
		return (Flight) query.uniqueResult();
	}
	
	public  int addTicketDetails(long phone_number, String first_name, String last_name, String flight_number, String source, String destination, int seats, String travel_date) {
		
		int result=0;
		beginTransaction();
		TicketDetails ticketdetails = new TicketDetails();
		ticketdetails.setPhone_number(phone_number);	
		ticketdetails.setFname(first_name);
		ticketdetails.setLname(last_name);
		ticketdetails.setFlight_number(flight_number);
		ticketdetails.setSource(source);
		ticketdetails.setDestination(destination);
		ticketdetails.setSeats(seats);
		ticketdetails.setTravel_date(travel_date);
		getSession().save(ticketdetails);
		commit();
		result=1;
	    return result;
	}
	
	public List<TicketDetails> getTicketDetails(long phone_number) {
		Query query = getSession().createQuery("FROM TicketDetails WHERE phone_number=:phone_number");
		query.setLong("phone_number", phone_number);
		return query.list();
	}

}
