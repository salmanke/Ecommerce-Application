<%@page import="com.deloitte.entities.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<%
	User u1 = (User) session.getAttribute("current-user");

%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Navbar</title>
</head>
<style>
	a{
	color: white;
	}
	
</style>
<body>
		<nav class="navbar navbar-expand-lg navbar-light custom-bg">
			  <div class="container">
				  <a class="navbar-brand text-white" href="#">De-Kart</a>
				  <button class="navbar-toggler border border-white" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				  	<span class="navbar-toggler-icon"></span>
				  </button>
	
			 	 <div class="collapse navbar-collapse " id="navbarSupportedContent">
				    <ul class="navbar-nav mr-auto">
					 	<li class="nav-item active">
					    	<a class="nav-link text-white" href="homepage.jsp">Home</a>
					    </li>
					   
					      <li class="nav-item dropdown">
					        <a class="nav-link dropdown-toggle text-white" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					          Categories
					        </a>
					        <div class="dropdown-menu" aria-labelledby="navbarDropdown" >
					        	<a class="dropdown-item" href="#">Laptops</a>
					          	<a class="dropdown-item" href="#">Mobiles</a>
					          	<div class="dropdown-divider"></div>
					          	<a class="dropdown-item" href="#">USBs</a>
					        </div>
					      </li>    
				    </ul>
			    
				    <ul class="navbar-nav ml-auto text-white">
				    	<!-- Shopping cart -->
				    	<!-- icon -->
				    	<li class="nav-item active" >
					    	<a href="#!" class="nav-link" data-toggle="modal" data-target="#cart">
					    		<i  class="fas fa-shopping-cart mt-2 text-white"></i>
					    		<span class="text-white cart-item" style="font-size: 16px">(0)</span>
					    	
					    	</a>
				    	<li>
				    	<!--  if user is admin or end user -->
				    	<% if (u1==null){ //Login->regidtration %>
				    		<li class="nav-item active">
				    			<a class="nav-link" href="login.jsp">Login</a>
				    		</li>
				    		<li class="nav-item">
				    			<a class="nav-link" href="registration.jsp">Registration</a>
				    		</li>
				    		
				    	<%	} else { %>
				    		<li class="nav-item active ">
				    			<a class="nav-link text-white" href="<%=u1.getRole().equals("admin") ? "admin.jsp" : "homepage.jsp" %>">Welcome,<%=u1.getName()%> </a>
				    		</li>
				    		<li class="nav-item">
				    			<a class="nav-link text-white" href="LogoutServlet">Logout</a>
				    		</li>
				    	
				    	<% } %>
				    
				    </ul>
			  	</div>
			  </div>
		</nav>
		<%@ include file="common_modals.jsp" %>
</body>
</html>