package com.me.demo;


import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.annotation.SessionAttributes;

import com.me.pojo.User;
import com.me.dao.BookTicketDAO;
import com.me.dao.MessageDAO;
import com.me.dao.UserDAO;
import com.me.pojo.Flight;
import com.me.pojo.Message;
import com.me.pojo.TicketDetails;



@Controller
public class ShowTicketController {

	@RequestMapping(value = "/ticket.htm", method = RequestMethod.POST)
	public String handleRequest(HttpServletRequest request, BookTicketDAO bookticketdao) {
		long phone_number = Long.parseLong(request.getParameter("ph_number"));
		System.out.println("ph: "+phone_number);	
		List<TicketDetails> ticketdetails = bookticketdao.getTicketDetails(phone_number);
		if(ticketdetails == null) {
			request.setAttribute("errormsg", "Phone number incorrect");
			return "error-page";	
		}else {
			for(TicketDetails t : ticketdetails) {
				System.out.println(t.getFlight_number()+" ");
			 }
			request.setAttribute("ticketdetails", ticketdetails);
			return "view-ticket";
		}
				
	}
	
	
}
