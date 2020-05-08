package com.me.dao;

import java.util.List;

import org.hibernate.query.Query;

import com.me.pojo.Flight;

public class FlightDAO extends DAO{
	public List<Flight> searchFlights(String source, String destination, String date){
		//Query query = getSession().createQuery("FROM Flight");
		Query query = getSession().createQuery("FROM Flight WHERE source=:source AND destination=:destination AND flight_date=:flightdate");
		query.setString("source", source);
		query.setString("destination", destination);
		query.setString("flightdate", date);
		return query.list();
		
	}
}
