package com.medilux.model;

public class ProductModel {
	private int product_id;
	private String product_title;
	private String product_price;
	private String product_img;
	private String category;
	private String product_quantity;
	
	public ProductModel(int product_id, String product_title, String product_price, String product_img, String category, String product_quantity) {
		super();
		this.product_id = product_id;
		this.product_title = product_title;
		this.product_price = product_price;
		this.product_img = product_img;
		this.category = category;
		this.product_quantity = product_quantity;
	}

	public int getProduct_id() {
		return product_id;
	}

	public String getProduct_title() {
		return product_title;
	}

	public String getProduct_price() {
		return product_price;
	}

	public String getProduct_img() {
		return product_img;
	}

	public String getCategory() {
		return category;
	}

	public String getProduct_quantity() {
		return product_quantity;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public void setProduct_title(String product_title) {
		this.product_title = product_title;
	}

	public void setProduct_price(String product_price) {
		this.product_price = product_price;
	}

	public void setProduct_img(String product_img) {
		this.product_img = product_img;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public void setProduct_quantity(String product_quantity) {
		this.product_quantity = product_quantity;
	}
	
	
	
	
	
	
	

}
