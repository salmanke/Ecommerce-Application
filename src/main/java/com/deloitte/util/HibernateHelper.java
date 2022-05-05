package com.deloitte.util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateHelper{
	
	//1.Configuration
	//2.SessionFactory --> one session factory object per application
	//3.(Hibernate) Session (Important as we save delete and perform crud operations)
	//4.Transaction
	
	private static SessionFactory sf;
	//no object is required to call it we can simply call it using the class name.
	
	//Singleton class coz the object once created is used several times and is used wherever we want 
	public static SessionFactory getInstance() {
		 
		if (sf==null) { // to configure for he first time.
			//building SessionFactory Object
			sf = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();// read the xml, goes to the server authorises the details goes inside the db and also checks if the db is present.
		}		
		
		//Marshelling and unmarshelling
		return sf;		
	}
}

