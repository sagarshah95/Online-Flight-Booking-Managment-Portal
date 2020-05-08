package com.me.demo;


import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;
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
import com.me.dao.MessageDAO;
import com.me.dao.UserDAO;
import com.me.pojo.Message;

/**
 * Handles Login and Registration of Users on the portal.Also maps various JSPs used accross various Controllers
 */

@Controller
public class UserController {
	@RequestMapping(value = "/option.htm", method = RequestMethod.GET)
	public String showOptionPage() {
		return "view-option";
	}
	
	@RequestMapping(value = "/home.htm", method = RequestMethod.GET)
	public String showHomePage() {
		return "home";
	}
	
	@RequestMapping(value = "/user.htm", method = RequestMethod.GET)
	public String showLogin() {
		return "user-login";
	}
	
	@RequestMapping(value = "/search_flight.htm", method = RequestMethod.GET)
	public String showFlightPage() {
		return "user-view";
	}
	
	
	@RequestMapping(value = "/view.htm", method = RequestMethod.GET)
	public String enterNumberToshowTicket() {
		return "enter-number";
	}
	
	@RequestMapping(value = "/register.htm", method = RequestMethod.GET)
	public String showRegister() {
		return "user-register";
	}
	
	@RequestMapping(value = "/user.htm", method = RequestMethod.POST)
	public String handleRequest(HttpServletRequest request, UserDAO userdao, MessageDAO msgdao) {
		String username = request.getParameter("un");
		String userpswd = request.getParameter("up");	
		User user = userdao.getUser(username, userpswd);
		if(user == null) {
			request.setAttribute("errormsg", "User/Password combination error");
			return "login-error";
		}		
		List<Message> msglist = msgdao.getMessageList(user.getUname());		
		request.setAttribute("messagelist", msglist);
		request.setAttribute("user", user);
		return "view-option";
	}
	
	@RequestMapping(value = "/register.htm", method = RequestMethod.POST)
	public String handleRequest(HttpServletRequest request, UserDAO userdao) {
		long phone_number = Long.parseLong(request.getParameter("ph"));
		String username = request.getParameter("un");
		String lastname = request.getParameter("ln");
		String userpswd = request.getParameter("up");
		String email = request.getParameter("em");
		int user = userdao.addUser(phone_number, username, lastname, userpswd, email);
		if(user == 1) {			
			return "registration-successfull";
		}else {
			request.setAttribute("errormsg", "Enter username already exists");
			return "error-page";	
		}
	}	
}
