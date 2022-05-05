<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Register</title>		
		<%@include file="components/common.jsp" %>	
	</head>
	<body>
		<div class="container-fliud">
			<div class="row mt-5">
				<div class="col-md-4 offset-md-4">
					<div class="card">
						<div class="card-header custom-bg">
								<h3> User Registration </h3>
						</div>
						
						<div class="card-body">
							<%@include file="components/response.jsp" %>
							<form action="RegistrationServlet" method="post">
								
								<!-- UserName -->
								<div class="form-group">
									    <label for="userName">User Name</label>
									    <input type="text" name="userName" class="form-control" id="userName" aria-describedby="userNameHelp" placeholder="Enter Username">
									    <small id="userNameHelp" class="form-text text-muted">We'll never share your Username with anyone else.</small>
								</div>
								
								<!-- Email ID -->
								<div class="form-group">
										<label for="emailId">Email Address</label>
									    <input type="email" name="emailId" class="form-control" id="emailId" aria-describedby="emailHelp" placeholder="Enter email">
									    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
								</div>
								
								<!-- Password -->
								<div class="form-group">
										<label for="password">Password</label>
									    <input type="password" name="password" class="form-control" id="password" aria-describedby="passwordHelp" placeholder="Enter password">						
										<small id="passwordHelp" class="form-text text-muted">Please remember your Password</small>
								</div>
								
								<!-- Phone -->
								<div class="form-group">
										<label for="phone">Phone</label>
									    <input type="tel" name="phone" class="form-control" id="phone" aria-describedby="phoneHelp" placeholder="Enter phone">						
										<small id="phoneHelp" class="form-text text-muted">Mobile is Used</small>
								</div>
								
								<!-- Address -->
								<div class="form-group">
										<label for="address">Address</label>
									    <textarea name="address" class="form-control" id="address" aria-describedby="addressHelp" placeholder="Enter your address"></textarea>				
										<small id="addressHelp" class="form-text text-muted">Residence Address</small>
								</div>
								
								<div class="container text-center">
									<button type="submit" class=" btn btn-outline-success font-weight-bold">Submit</button>
									<button type="reset" class=" btn btn-outline-warning font-weight-bold">Reset</button>
								</div>	
													
							</form>
						</div>				
					</div>			
				</div>
			</div>	
		</div>
	</body>
</html>