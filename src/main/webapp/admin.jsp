<%@page import="com.deloitte.entities.User"%>
<%@page import="com.deloitte.dao.CategoryDAO"%>
<%@page import="com.deloitte.entities.Category"%>
<%@page import="java.util.*"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%

	User u = (User) session.getAttribute("current-user");
	if(u==null){
		// redirect to login page
		session.setAttribute("warning", "You are not logged in");
		response.sendRedirect("login.jsp");
		
	}else if("enduser".equals(u.getRole())){
		// redirect to homepage
		session.setAttribute("warning", "You are not an admin. No access to this page.");
		response.sendRedirect("homepage.jsp");		
	}
%>

<html>
<head>
<meta charset="ISO-8859-1">
<title>ADMIN PAGE</title>
<%@include file="components/common.jsp" %>		
<style type="text/css">
	.imgStyle{
		max-width: 100px;
	}
</style>
						
</head>
<body>
	<div class="text-center"> 
	<%@include file="components/navbar.jsp" %>
	</div>
	
	
	<div class="container">
		<div class="text-center"> 
			<%@include file="components/response.jsp" %>
		</div>
	
		<!-- ROW-1 -->
		<div class="row mt-3">
			<div class="col-md-4">
				<div class="card ">
					<div class="casrd-body text-center">
						<div class="container">
							<img class="imgStyle rounded-circle img-fluid." src="images/group.png"/>
							<h2>USER</h2>
							<h2>12345</h2>
						</div>					
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="casrd-body text-center">
						<div class="container">
							<img class="imgStyle rounded-circle img-fluid." src="images/group.png"/>
							<h2>Description : </h2>
							<h2>12345</h2>
						</div>					
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="casrd-body text-center">
						<div class="container">
							<img class="imgStyle rounded-circle img-fluid." src="images/group.png"/>
							<h2>Description : </h2>
							<h2>12345</h2>
						</div>					
					</div>
				</div>
			</div>
		
		</div>
		
		<!-- ROW 2 -->
		<div class="row mt-3 offset-md-2">
			<div class="col-md-4">
				<div class="card">
					<div class="casrd-body text-center">
						<div class="container">
							<img class="imgStyle rounded-circle img-fluid." src="images/add.png" data-toggle="modal" data-target="#add-category-model" >
							<h2>ADD CATEGORY</h2>
							<h6>Click here to add category</h6>
						</div>					
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="casrd-body text-center">
						<div class="container">
							<img class="imgStyle rounded-circle img-fluid." src="images/add.png"  data-toggle="modal" data-target="#add-product-model"/>
							<h2>ADD PRODUCT</h2>
							<h6>Click here to add products</h6>
						</div>					
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- MODALS -->
	
	<!-- modal for add category -->
	<!-- Button trigger modal -->
		<!--  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
		  Launch demo modal
		</button>-->
		
		<!-- Modal -->
		<div class="modal fade" id="add-category-model" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header custom-bg">
		        <h5 class="modal-title text-width " id="exampleModalLabel">Fill Category Details</h5>
		        <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <form action="AdminServlet" method="post">
			      <div class="modal-body">
			      
			      		<input type="hidden" name="operation" value="addCategory"/>
			      	
			      	<div class="form-group">
			      		<input type="text" class="form-control" 
			      		name="catTitle" placeholder="Enter Category Title" required/>
			      	</div>
			      
			      	<div class="form-group">
			      		<textarea rows="8" cols="" name="catDescription" class="form-control" 
			      		placeholder="Enter Category Description" required></textarea>
			      	</div>
			      </div>
		      
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			        <button type="submit" class="btn btn-outline-success">Add Category</button>
			      </div>
			     </form>
		    </div>
		  </div>
		</div>
	
	<!-- modal for add product -->
			<!-- Button trigger modal -->
				<!--  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
				  Launch demo modal
				</button>-->
		
		<!-- Modal -->
		<div class="modal fade" id="add-product-model" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header custom-bg">
		        <h5 class="modal-title text-white" id="exampleModalLabel">Product Details</h5>
		        <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <form action="AdminServlet" method="post" enctype="multipart/form-data">
			      <div class="modal-body">
			      	
			      	<input type="hidden" name="operation" value="addProduct"/>
			      	
			       	<div class="form-group">
			      		<input type="text" class="form-control" 
			      		name="productName" placeholder="Enter Product Name" required/>
			      	</div>
			      	
			      	<div class="form-group">
			      		<textarea rows="6" cols="" name="productDescription" class="form-control" 
			      		placeholder="Enter Product Description" required></textarea>
			      	</div>
			      	
			      	<div class="form-group">
			      		<input type="text" class="form-control" 
			      		name="productPrice" placeholder="Enter Product Price" required/>
			      	</div>
			      	
			      	<div class="form-group">
			      		<input type="text" class="form-control" 
			      		name="productDiscount" placeholder="Enter Product Discount" required/>
			      	</div>
			      	
			      	<div class="form-group">
			      		<input type="text" class="form-control" 
			      		name="productQuantity" placeholder="Enter Product Quantity" required/>
			      	</div>
			      	<%
			      		//Fetch Catogaries from server using fetchCategory method
			      		CategoryDAO catDao= new CategoryDAO();
						List <Category> catList= catDao.fetchCategories();
						
						Iterator<Category> i= catList.iterator();
						
			      	%>
			      	<div class="form-group">
			      		<select name="catId" class="foem-control">
			      			<%
			      				for(Category c: catList){
			      			%>
								<option value=<%= c.getCategoryId() %>><%=c.getTitle() %></option>
							
							<%
			      				}
			      			
			      			%>
			      			
			      		</select>
			      	</div>
			      	
			      	<div class="form-group">
			      		<input type="file" class="forn-control"
			      		 name="productImage" id="productImage" placeholder="Browse Product Image"/>
			      	
			      	</div>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			        <button type="submit" class="btn btn-outline-success">Add Product</button>
			      </div>
		      </form>
		    </div>
		  </div>
		</div>	
</body>
</html>