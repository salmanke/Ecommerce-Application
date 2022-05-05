package com.deloitte.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.deloitte.entities.Product;
import com.deloitte.util.HibernateHelper;

public class ProductDAO {
	private Session s;
	public ProductDAO() {
		s=HibernateHelper.getInstance().openSession();
		
	}
	public int saveProduct(Product p) {
		int productId =0;
		try{
			
			Transaction tx= s.beginTransaction();
			productId=(int)s.save(p);
			tx.commit();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			s.close();
		}
		return productId;	
	}
	
	public List<Product> fetchProducts(){
		List<Product> productList = new ArrayList<Product>();
		try {
			Query<Product> q=s.createQuery("from Product",Product.class);
			productList=q.getResultList();		
		
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			s.close();
		}
		return productList;
	}
	
	// Fetch Products by CategoryId
	public List<Product> fetchProductsByCatId(Integer catId) {
		
		List<Product> productList = new ArrayList<Product>();
		try {
			Query<Product> q=s.createQuery("from Product as p where p.category.categoryId"
					+ " =:cId",Product.class);
			q.setParameter("cId", catId);
			productList=q.getResultList();		
		
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			s.close();
		}
		return productList;
	}
	
	
}
