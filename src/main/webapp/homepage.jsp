<%@page import="com.deloitte.entities.User"%>
<%@page import="com.deloitte.dao.CategoryDAO"%>
<%@page import="com.deloitte.dao.ProductDAO"%>
<%@page import="com.deloitte.entities.Product"%>
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
	}
%>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Products Home Page</title>
<%@include file="components/common.jsp" %>
</head>
<body>
	<%@include file="components/navbar.jsp" %>
	<%@include file="components/response.jsp" %>
	
	<%
		
		String catId=request.getParameter("category");
		
		ProductDAO pDao= new ProductDAO();
		List<Product> plist=null;
		
		
		if(null== catId || "".equals(catId) || catId.equals("All")){
		 	plist=pDao.fetchProducts();//onLoad : when the page opens for the first time
		}else{
			plist= pDao.fetchProductsByCatId(Integer.parseInt(catId));//when a specific category is selected.
		}
		//Fetch Catogaries from server using fetchCategory method
		CategoryDAO catDao= new CategoryDAO();
		List <Category> catList= catDao.fetchCategories();
		Iterator<Category> i= catList.iterator();
	%>
	
	<div class="container-fluid">
		<div class="row mt-3">
			<!-- Display Categories -->
			<div class="col-md-2">
			
				<div class="list-group">
					
					<%
						String isAllProductsActive="";
					
						if(null== catId || "".equals(catId) || catId.equals("All")){
							isAllProductsActive="active";
						}
					
					%>
				
					<a href="homepage.jsp?category=All" class="list-group-item list-group-item-action <%= isAllProductsActive %>" >
						All Products
					</a>
					
					<%
						String categoryActive;
						
						//Dynamically Fetch categories to display
						for(Category c: catList){
					
							if(!isAllProductsActive.equals("active") && c.getCategoryId()== Integer.parseInt(catId)){
								categoryActive="active";
							}
							else{
								categoryActive="";		
							}
					%>
					<a href="homepage.jsp?category=<%=c.getCategoryId() %>" class="list-group-item list-group-item-action <%= categoryActive %>" >
						<%= c.getTitle()%>
					</a>
					<%} %>
				</div>	
			</div>
			
			<div class="col-md-10 mt-3">
				<div class="row">
					<div class="col-md-12 mr-2">
						<div class="card-columns">
							<!-- displays the products stored in plist -->
							<%
								if(plist != null){
									for(Product p : plist){%>
										<!-- Preparing a card for each an every product -->
										
										<div class="card">
											<div class="text-center">
												<img style="max-height:200px; "  src="images/products/<%=p.getProductImage()%>">
											</div>
											<div class="card-body text-center">
												<h5 class="card-title">
													<%=p.getProductName() %>
												</h5>
												
												<p class="text-center">
													<%=p.getProductDesc() %>
												</p>
											</div>
											
											<div class="class-footer text-center">
												<button class="btn custom-bg text-white" onclick="add_to_cart(<%= p.getProductId()%>,`<%= p.getProductName()%>`,<%p.getProductPrice();%>)">Add To Cart</button>
												<button class="brn btn-outline-success">
													<%=p.getDiscountedPrice() %> /-
													<span class="text-secondary original-price"><del><%=p.getProductPrice() %></del></span>
													<span class="text-secondary discount-label" style="font-style: italic" ><%=p.getProductDiscount() %>% off</span>
													
												</button>
											</div>
										</div>
								<% }
								}
							%>
						</div>
					</div>
				</div>
			</div>
		</div>	
	</div>
	
</body>
</html>

							