package com.deloitte.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="PRODUCT_TB")
public class Product {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="product_id", length=1000)
	private int productId;
	
	@Column(name="product_name", length=1000)
	private String productName;
	
	@Column(name="description", length=1500)
	private String productDesc;
	
	@Column(name="price")
	private Integer productPrice;
	
	@Column(name="quantity")
	private Integer productqty;
	
	@Column(name="discount")
	private Integer productDiscount;
	
	@Column(name="name", length=1500)
	private String productImage;
	
	@ManyToOne
	private Category category;

	
	
	public Product() {
		super();
	}


	public Product(String productName, String productDesc, Integer productPrice, Integer productqty,
			Integer productDiscount, String productImage, Category category) {
		super();
		this.productName = productName;
		this.productDesc = productDesc;
		this.productPrice = productPrice;
		this.productqty = productqty;
		this.productDiscount = productDiscount;
		this.productImage = productImage;
		this.category = category;
	}

	
	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductDesc() {
		return productDesc;
	}

	public void setProductDesc(String productDesc) {
		this.productDesc = productDesc;
	}

	public Integer getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(Integer productPrice) {
		this.productPrice = productPrice;
	}

	public Integer getProductqty() {
		return productqty;
	}

	public void setProductqty(Integer productqty) {
		this.productqty = productqty;
	}

	public Integer getProductDiscount() {
		return productDiscount;
	}

	public void setProductDiscount(Integer productDiscount) {
		this.productDiscount = productDiscount;
	}

	public String getProductImage() {
		return productImage;
	}

	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}
	
	public int getDiscountedPrice(){
		int netPrice=0;
		
		int discPrice= (int)(this.productPrice * (this.productDiscount/100.0));
		netPrice=this.productPrice-discPrice;
		
		System.out.println(netPrice);
		return netPrice;
	}
}
