package com.deloitte.servlets;

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;

import com.deloitte.dao.UserDAO;
import com.deloitte.entities.User;
import com.deloitte.util.HibernateHelper;

// import automatically: ctrl+shift+o
public class LoginServlet extends HttpServlet  {

	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
		HttpSession s= req.getSession();
		PrintWriter out = resp.getWriter();
		
		try {
		//step-1
		String email= req.getParameter("email");
		String password= req.getParameter("password");
		
		System.out.println("Email : " + req.getParameter("email"));
		System.out.println("Password : " + req.getParameter("password"));
		if (email.isEmpty() || password.isEmpty()) {
			System.out.println("Invalid Credentials");
			return;
		}
		
		//step-2 : hitting the database to check the user
		UserDAO userDao = new UserDAO();
		User u = userDao.getUserByEmailAndPassword(email, password);
		
		if (u==null) {
			//send notification, to achieve this using http session objects
			s.setAttribute("warning", "Invalid Credentials!! Check Again");
			resp.sendRedirect("login.jsp");
		}
		else {
			
			//step-3 : if the user exists  create POJO
			//create session
			s.setAttribute("current-user", u);
			
			//checking db
			if ("admin".equals(u.getRole())) {
				//goto admin page
				resp.sendRedirect("admin.jsp");
			}
			else if ("enduser".equals(u.getRole())){
				//goto homepage
				resp.sendRedirect("homepage.jsp");
			}
			else {
				//Invalid case
				out.println("<h1> Your role is not defined. Contact Admin</h1>");
			}
		}
		}catch(Exception e) {
			e.printStackTrace();
			s.setAttribute("warning", "Error Occured due to Tech error");
			resp.sendRedirect("login.jsp");
		}finally {
			out.close();
		}
	}
}
