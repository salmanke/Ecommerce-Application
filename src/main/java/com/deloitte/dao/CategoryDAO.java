package com.deloitte.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.deloitte.entities.Category;
import com.deloitte.util.HibernateHelper;

public class CategoryDAO {
	
	private Session s;
	
	public CategoryDAO() {
		s=HibernateHelper.getInstance().openSession();
	}
	public int saveCategory(Category c){
		
		int catId =0;
		
		try{
			
			Transaction tx= s.beginTransaction();
			catId=(int)s.save(c);
			tx.commit();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			s.close();
		}
		return catId;
	}
	
	public List<Category> fetchCategories(){
		List<Category> catList = new ArrayList<Category>();
		try {
			Query<Category> q=s.createQuery("from Category",Category.class);
			catList=q.getResultList();		
		
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			s.close();
		}
		return catList;
	}
	public Category fetchCategoryById(Integer selectedCatId) {
		Category c=null;
		try {
		c=s.get(Category.class, selectedCatId);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return c;
	}
	
	
	
}
