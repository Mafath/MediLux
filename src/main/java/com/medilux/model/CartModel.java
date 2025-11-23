package com.medilux.model;

public class CartModel {
	private int cartId;
    private int userId;
    private int productId;
    private int quantity;
    private String addedDate;
    
    private String productTitle;
    private double productPrice;
    private String productImg;

    
	public CartModel(int cartId, int userId, int productId, int quantity, String addedDate) {
		super();
		this.cartId = cartId;
		this.userId = userId;
		this.productId = productId;
		this.quantity = quantity;
		this.addedDate = addedDate;
	}

	public int getCartId() {
		return cartId;
	}

	public int getUserId() {
		return userId;
	}

	public int getProductId() {
		return productId;
	}

	public int getQuantity() {
		return quantity;
	}

	public String getAddedDate() {
		return addedDate;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public void setAddedDate(String addedDate) {
		this.addedDate = addedDate;
	}
    
	
	public String getProductTitle() {
	    return productTitle;
	}

	public void setProductTitle(String productTitle) {
	    this.productTitle = productTitle;
	}

	public double getProductPrice() {
	    return productPrice;
	}

	public void setProductPrice(double productPrice) {
	    this.productPrice = productPrice;
	}

	public String getProductImg() {
	    return productImg;
	}

	public void setProductImg(String productImg) {
	    this.productImg = productImg;
	}

   
}