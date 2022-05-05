<%@page import="com.deloitte.entities.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%
	User user = (User) session.getAttribute("current-user");
 	if (user != null && user.getRole().equals("enduser")){
 		response.sendRedirect("homepage.jsp");
 	}else if (user != null && user.getRole().equals("admin")){
 		response.sendRedirect("admin.jsp");
 	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>DE-Kart Login</title>
<%@include file="components/common.jsp" %>
</head>

<body>
	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card mt-3">
				
					<div class="card-header custom-bg">
						<h3> Login Here..! </h3>
					</div>
				
					<div class="card-body">
					
						<%@include file="components/response.jsp" %>
						<form action="LoginServlet" method="post">
							<div class="form-group">
							   <label for="exampleInputEmail1">Email address</label>
							   <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required>
							   <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label>
								<input type="password" name="password" class="form-control" id="exampleInputPassword1">
							</div>
							<div class="text-center">
							  <a href="register.jsp">If  not registered click here</a>
							</div>
							<br>
							<div class="text-center">
								<button type="submit" class=" btn btn-danger">Submit</button>
								<button type="reset" class=" btn btn-danger">Reset</button>
							</div>
						</form>
					</div>
				</div>			
			</div>			
		</div>
	</div>
</body>
</html>
