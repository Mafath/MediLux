package com.medilux.model;

public class UserModel {
	private int id;
	private String name;
	private String gmail;
	private String password;
	private String phone;
	private String address;
	private String age;
	private String gender;
	private String profile_picture_url;
	private String role;
	
	
	public UserModel(int id, String name, String gmail, String password, String phone, String address, String age,
			String gender, String profile_picture_url, String role) {
		super();
		this.id = id;
		this.name = name;
		this.gmail = gmail;
		this.password = password;
		this.phone = phone;
		this.address = address;
		this.age = age;
		this.gender = gender;
		this.profile_picture_url = profile_picture_url;
		this.role = role;
		
		
	}


	public int getId() {
		return id;
	}


	public String getName() {
		return name;
	}


	public String getGmail() {
		return gmail;
	}


	public String getPassword() {
		return password;
	}


	public String getPhone() {
		return phone;
	}


	public String getAddress() {
		return address;
	}


	public String getAge() {
		return age;
	}


	public String getGender() {
		return gender;
	}


	public String getProfile_picture_url() {
		return profile_picture_url;
	}


	public String getRole() {
		return role;
	}


	public void setId(int id) {
		this.id = id;
	}


	public void setName(String name) {
		this.name = name;
	}


	public void setGmail(String gmail) {
		this.gmail = gmail;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public void setAge(String age) {
		this.age = age;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public void setProfile_picture_url(String profile_picture_url) {
		this.profile_picture_url = profile_picture_url;
	}


	public void setRole(String role) {
		this.role = role;
	}
	
	
	

	
}
