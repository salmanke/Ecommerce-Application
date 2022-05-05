package com.deloitte.servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.deloitte.dao.CategoryDAO;
import com.deloitte.dao.ProductDAO;
import com.deloitte.entities.Category;
import com.deloitte.entities.Product;


@MultipartConfig

public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession httpSession= request.getSession();
		
		String operation = request.getParameter("operation");
		if(operation.equals("addCategory")) {
			
			String catTitle = request.getParameter("catTitle");
			String catDescription = request.getParameter("catDescription");
			
			//Create Category class and generate POJOs
			Category c = new Category();
			c.setTitle(catTitle);
			c.setDescription(catDescription);
			
			CategoryDAO cDao= new CategoryDAO();
			int catId=cDao.saveCategory(c);
			
			if(catId>0) {
				httpSession.setAttribute("success","Category saved successfully: "+ catId);
				
			}else if (catId==0) {
				httpSession.setAttribute("warning","Category save failed");
			}
			response.sendRedirect("admin.jsp");
		}
		
		else if (operation.equals("addProduct")) {
			
			String pn = request.getParameter("productName");
			String pd = request.getParameter("productDescription");
			Integer pp = Integer.parseInt(request.getParameter("productPrice"));
			Integer pq = Integer.parseInt(request.getParameter("productQuantity"));
			Integer pdi= Integer.parseInt(request.getParameter("productDiscount"));
			
			Integer selectedCatId= Integer.parseInt(request.getParameter("catId"));
			
			CategoryDAO cDao= new CategoryDAO();
			Category c= (cDao.fetchCategoryById(selectedCatId));
			
			//file upload
			Part part= request.getPart("productImage");
			
			String fileName= part.getSubmittedFileName();
			
			if (!fileName.isEmpty()) {
				String imgPath= request.getServletContext().getRealPath("images")+File.separator+"products"+File.separator+fileName;
				
				
				try(InputStream is= part.getInputStream(); 
						FileOutputStream fos = new FileOutputStream(imgPath)){
					//byte array
					byte[] data=new byte[is.available()];//to take the part of the pimage
					is.read(data);
					fos.write(data);
					//file
				}catch(Exception e){
					e.printStackTrace();
				}
			}
			Product p= new Product(pn, pd, pp, pq, pdi, fileName, c);
			
			ProductDAO pDao= new ProductDAO();
			
			int productId = pDao.saveProduct(p);
			
			if(productId>0) {
				httpSession.setAttribute("success","Product saved successfully :"+ productId);
				response.sendRedirect("admin.jsp");
			}else if (productId==0) {
				httpSession.setAttribute("warning","Product save failed");
				response.sendRedirect("admin.jsp");	
			}						
		}
	}
}
