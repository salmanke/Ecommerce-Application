<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HomePage</title>
</head>
<!-- External Bootstrap, FontAwesome -->
<%@include file="components/common.jsp" %>

<!-- Internal Styling -->
<style>
	 .jumbotron{
	 	background-color: #f4511e;
	 	color: #ffffff;	
	 }
	 .carousel-control-prev{
	 	background : linear-gradient(to right, rgba(244, 81, 30, 0.2), rgba(244, 81, 30, 100));
	 	
	 }
	 .carousel-control-next{
	 	background-image : linear-gradient(to right, rgba(244, 81, 30, 0.2), rgba(244, 81, 30, 100))
	 }
	 .carousel-item {
	 	font-size : 20px;
	 	line-height : 1.375em;
	 	font-weight : 400;
	 	font-style : italic;
	 	margin : 70px  0;
	 	text-align : center;
	 }
	 footer a{
	 	color : #ffffff;
	 }
	 footer a:hover, a:focus{
	 	color: #aaa;
	 	text-decoration: none;
	 	border-bottom: 1px dotted #999;
	 }
	 footer{
	 	padding : 10px;
	 	color : #ffffff;
	 	background-color : #f4511e;
	 }
	 

</style>
<body>
	<!-- Jumbotron -->
	
	<!--1. Integrated Bootstrap (4.6)
		2. Section-1 : Jumbotron 
		-->
		<div class="jumbotron text-center">
			<h1>De-Kart</h1>
			<p>Online-Merchandise</p>
			<div class="container" style="width : 40%; text-align : center;">
				<input type="email" class="form-control" 
				placeholder="Enter Email Address" required> 
		
				<button type="button" class="btn btn-danger">Subscribe</button>
	
			</div>	
		</div>
	
	<!-- Online Merchandise -->
	<div class="container-fluid text-center">
		<h1>SERVICES</h1>
		<h4>What we Offer</h4>
		<br>
		<div class="row">
			<div class="col-sm-4">
				<span><i class="fa fa-laptop" aria-hidden="true"></i></span> <!-- Icon -->
				<h5>LAPTOPS</h5> <!-- Name Of Product -->
				<p>Premium Laptops</p> <!-- Description -->
			</div>
			<div class="col-sm-4">
				<span><i class="fa fa-mobile" aria-hidden="true"></i></span> <!-- Icon -->
				<h5>MOBILES</h5> <!-- Name Of Product -->
				<p>Premium Mobile</p> <!-- Description -->
			</div>
			<div class="col-sm-4">
				<span><i class="fas fa-headphones"></i></span> <!-- Icon -->
				<h5>HEADPHONES</h5> <!-- Name Of Product -->
				<p>Premium Headphones</p> <!-- Description -->
			</div>
			
		</div>
		<div class="row">
			<div class="col-sm-4">
				<span>
				<i class="fas fa-gift"></i></span> <!-- Icon -->
				<h5>GIFTS</h5> <!-- Name Of Product -->
				<p>Premium Gifts</p> <!-- Description -->
			</div>
			<div class="col-sm-4">
				<span><i class="fas fa-clock"></i> <!-- Icon --></span>
				<h5>WATCHES</h5> <!-- Name Of Product -->
				<p>Premium Watches</p> <!-- Description -->
				
			</div>
			<div class="col-sm-4">
				<span></span> <!-- Icon -->
				<h5>LAPTOPS</h5> <!-- Name Of Product -->
				<p>Premium Laptops</p> <!-- Description -->
			</div>
			
		</div>
	
	</div>

	<!-- Carousel -->
	<div class= "container mt-5 mb-5">
	
		<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
		  <ol class="carousel-indicators">
		    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
		    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
		    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		  </ol>
		  <div class="carousel-inner">
		  	<div class="carousel-item active">
		    	<h4>"Review 1"</h4>
		    </div>
		    <div class="carousel-item">
		    	<h4>"Review 2"</h4>
		    </div>
		    <div class="carousel-item">
		     	<h4>"Review 3"</h4>
		     </div>
		  </div>
		  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="sr-only">Previous</span>
		  </a>
		  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="sr-only">Next</span>
		  </a>
		</div>
		
	</div>
	
	
	<!-- Footer -->
	<footer>
		<div class="container mt-5">
			<div class="row">
				<div class="col-md-5">
					<h6><i class="fas fa-blog"></i><i> De-Kart</i></h6>
					<div class="row">
						<div class="col-md-6">
							<ul class="list-unstyled">
								<li><a href="product">Product</a></li>
								<li><a href="product">Benefits</a></li>
								<li><a href="product">Partners</a></li>
								<li><a href="product">Team</a></li>
							</ul>
						</div>
						<div class="col-md-6">
							<ul class="list-unstyled">
								<li><a href="product">Documentation</a></li>
								<li><a href="product">Support</a></li>
								<li><a href="product">Legal Teams</a></li>
								<li><a href="product">Policies</a></li>
							</ul>
						</div>
						
					</div>
					
				</div>
				<div class="col-md-2">
					<h5>Contact Us</h5>
				</div>
				
				<div class="col-md-5">
				
					<div class="form-group">
						<input type="email" id="email" placeholder="enter email">
					</div>
					
					<div class="form-group">
						<textarea placeholder="Please Enter Message"></textarea>
					</div>
					
					<div class="form-group">
						<button class="btn btn-secondary-outline bt-tg">Submit</button>
					</div>
					
				</div>
				
			</div>
			
		</div>
	</footer>

</body>
</html>