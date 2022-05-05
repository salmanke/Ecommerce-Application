package com.deloitte.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="USER_TB")

public class User{
	
	// crtl + shift + o --to include annotation (javax persistence)
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name="name", length=10)
	private String name;
	
	@Column(name="email", length=100)
	private String email;
	
	@Column(name="password", length=100)
	private String password;
	
	@Column(name="phone", length=10)
	private String phone;
	
	@Column(name="pic", length=1500)
	private String pic;
	
	@Column(name="address", length=1500)
	private String address;
	
	@Column(name="role", length=100)
	private String role;
	
	
	// Add a Default Constructor
	public User(){
		
	}
	
	// Parameterized constructors
	public User(int id, String name, String email, String password, String phone, String pic, String address,
			String role) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.phone = phone;
		this.pic = pic;
		this.address = address;
		this.role = role;
	}
	
	//Parameterized Constructor without id
	public User(String name, String email, String password, String phone, String pic, String address, String role) {
		super();
		this.name = name;
		this.email = email;
		this.password = password;
		this.phone = phone;
		this.pic = pic;
		this.address = address;
		this.role = role;
	}
	
	// Setters and Getters
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
	
	
}