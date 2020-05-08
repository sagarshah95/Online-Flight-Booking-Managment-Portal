package com.me.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import com.me.pojo.Message;

public class MessageDAO extends DAO{
	
	public List<Message> getMessageList(String toUser){
	//Query query = session.createQuery("FROM Message WHERE toUser='Sagar'");
	//List<Message> msglist = query.list();
	Criteria crit = getSession().createCriteria(Message.class);
	crit.add(Restrictions.eq("toUser",toUser));
	return crit.list();
	}

}
