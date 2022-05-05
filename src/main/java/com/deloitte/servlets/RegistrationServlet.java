package com.deloitte.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.deloitte.entities.User;
import com.deloitte.util.HibernateHelper;

public class RegistrationServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession s= req.getSession();
		PrintWriter out = resp.getWriter();
		
		//Retrieving data from registration form
		String userName= req.getParameter("userName");
		String emailId= req.getParameter("emailId");
		String password= req.getParameter("password");
		String phone= req.getParameter("phone");
		String address= req.getParameter("address");
		
		//Server side Validation
		if(userName.isEmpty()) {
			out.println("<h1>Name is Blank</h1>");
		}
		
		User user = new User(userName, emailId, password, 
				phone, "default.jpg",address, "enduser");
		//SessionFactory sf= HibernateHelper.getInstance();		
		//Session hibernateSession = sf.openSession();	
		//saving the user in database
		Session hibernateSession = HibernateHelper.getInstance().openSession();
		//Transaction is a group of statements that must either succeed or fail (automicity)
		//Transaction is always associated with one particular session object
		
		Transaction trans= hibernateSession.beginTransaction();
		int uId= (int)hibernateSession.save(user);
		trans.commit(); // permanently saves all the above performed operations at once.
		hibernateSession.close(); // must.
		s.setAttribute("success", "Sucessfully registered..! Id :"+uId);
		resp.sendRedirect("register.jsp");
	}
}
