package com.deloitte.dao;

import org.hibernate.Session;

import com.deloitte.entities.User;
import com.deloitte.util.HibernateHelper;

public class UserDAO {
	
	public UserDAO() {
		
	}

	public User getUserByEmailAndPassword(String email, String password) {
	
		User u = null;
		try(Session s= HibernateHelper.getInstance().openSession();) {
		// HQL query to get a record: with email and password submitted in login form
		// HQL always deals with objects 
		String query = "from User where email =: e and password =: p";
		
		//Using hibernate session api to query DB with dynamic values searching for the unique value.
		u = (User)s.createQuery(query).setParameter("e", email).setParameter("p", password).uniqueResult();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return u;
	}

}
