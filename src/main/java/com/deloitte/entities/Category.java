package com.deloitte.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="CATEGORY_TB")
public class Category {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="categoryId")
	private int categoryId;
	
	@Column(name="title", length=100)
	private String title;
	
	@Column(name="description",length=1500)
	private String description;
	
	@OneToMany(mappedBy="category")
	List<Product> product= new ArrayList<Product>();

	public Category() {
		super();
	}
	
	public Category(int id, String title, String description, List<Product> product) {
		super();
		this.categoryId = id;
		this.title = title;
		this.description = description;
		this.product = product;
	}

	
	public Category(String title, String description, List<Product> product) {
		super();
		this.title = title;
		this.description = description;
		this.product = product;
	}

	public Category(String title, String description) {
		super();
		this.title = title;
		this.description = description;
	}

	public Category(int id, String title, String description) {
		super();
		this.categoryId = id;
		this.title = title;
		this.description = description;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int id) {
		this.categoryId = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public List<Product> getProduct() {
		return product;
	}

	public void setProduct(List<Product> product) {
		this.product = product;
	}
		
}
