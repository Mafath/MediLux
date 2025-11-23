package com.medilux.model;

public class FeedbackModel {
    private int id;
    private int userId;
    private String name;
    private String email;
    private String city;
    private int age;
    private String message;
    private String submitDate;
    
    public FeedbackModel() {
    	
    }

    public FeedbackModel(int id, int userId, String name, String email, String city, int age, String message) {
        this.id = id;
        this.userId = userId;
        this.name = name;
        this.email = email;
        this.city = city;
        this.age = age;
        this.message = message;
    }

    // Getters & Setters
    public int getId() {
    	return id; 
    }
    
    public int getUserId() {
    	return userId;
    }
    
    public String getName() { 
    	return name; 
    }
    
    public String getEmail() {
    	return email; 
    }
    
    public String getCity() { 
    	return city; 
    }
    
    public int getAge() { 
    	return age; 
    }
    
    public String getMessage() { 
    	return message; 
    }

    public String getSubmitDate() {
		return submitDate;
	}

	public void setSubmitDate(String submitDate) {
		this.submitDate = submitDate;
	}

	public void setId(int id) { 
		this.id = id; 
	}
	
    public void setUserId(int userId) { 
    	this.userId = userId; 
    }
    
    public void setName(String name) { 
    	this.name = name;
    }
    
    public void setEmail(String email) { 
    	this.email = email; 
    }
    
    public void setCity(String city) { 
    	this.city = city; 
    }
    
    public void setAge(int age) { 
    	this.age = age;
    }
    
    public void setMessage(String message) { 
    	this.message = message; 
    }
    
}
