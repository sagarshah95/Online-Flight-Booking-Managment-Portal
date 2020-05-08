package com.me.dao;

import org.hibernate.query.Query;

import com.me.pojo.User;

public class UserDAO extends DAO {
	/*public User getUser(long uid) {
		return (User) getSession().get("com.me.pojo.User", 1L);
	}*/
	   private void beginTransaction() {
	        getSession().beginTransaction();
	    }

	    protected void commit() {
	        getSession().getTransaction().commit();;
	    }
	
	
	
	public User getUser(String username, String password) {
		Query query = getSession().createQuery("FROM User WHERE uname=:uname AND upassword=:upassword");
		query.setString("uname", username);
		query.setString("upassword", password);
		return (User) query.uniqueResult();
	}
	
	public  int addUser(long phone_number, String username, String lastname, String password, String email) {
		
		int result=0;
		beginTransaction();
		/*Query query = getSession().createQuery("INSERT INTO User (id, uname, upassword) VALUES (id,uname,password)")		
		query.setLong("id", phone_number);
		query.setString("uname", username);
		query.setString("upassword", password);
		result = query.executeUpdate();*/
		User user = new User();
		user.setId(phone_number);
		user.setUname(username);
		user.setLname(lastname);
		user.setUpassword(password);
		user.setEmail(email);
		getSession().save(user);
		commit();
		result=1;
	    return result;
	}

}
