package com.medilux.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.medilux.util.DBConnection;
import com.medilux.model.CartModel;
//import com.medilux.model.ProductModel;
import com.medilux.model.UserModel;


public class UserService {
	//connect DB
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	

	
	public void updateProfileImage(int userId, String imagePath) {
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "UPDATE user SET profile_picture_url = ? WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, imagePath);
            ps.setInt(2, userId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
	
	
	// Method to check if email already exists
    public static boolean isEmailTaken(String email) {
        boolean emailExists = false;
        try {
            con = DBConnection.getConnection();
            stmt = con.createStatement();
            String sql = "SELECT * FROM user WHERE gmail = '" + email + "'"; // Check if email exists
            rs = stmt.executeQuery(sql);
            if (rs.next()) {
                emailExists = true; // Email is already taken
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return emailExists;
    }
	
	
	//Insert data function
	public static boolean insertdata (String name, String gmail, String password) {
		
		boolean isSuccess = false;
		
		// Check if email is already taken
        if (isEmailTaken(gmail)) {
            return false; // Email already exists
        }
        
		try {
			//DB CONNECTION CALL
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			
			//SQL QUERY
			String sql = "INSERT INTO user (id, name, gmail, password, phone, address, age, gender, profile_picture_url, role) " +
		             "VALUES (0, '"+name+"', '"+gmail+"', '"+password+"', NULL, NULL, NULL, NULL, NULL, 'user')";
			
			int rs = stmt.executeUpdate(sql);
			
			if(rs>0) {
				isSuccess = true;
			}
			else {
				isSuccess = false;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
	
	
	//Insert admin function
		public static boolean insertAdmin (String name, String gmail, String password) {
			
			boolean isSuccess = false;
			
			// Check if email is already taken
	        if (isEmailTaken(gmail)) {
	            return false; // Email already exists
	        }
	        
			try {
				//DB CONNECTION CALL
				con = DBConnection.getConnection();
				stmt = con.createStatement();
				
				//SQL QUERY
				String sql = "INSERT INTO user (id, name, gmail, password, phone, address, age, gender, profile_picture_url, role) " +
			             "VALUES (0, '"+name+"', '"+gmail+"', '"+password+"', NULL, NULL, NULL, NULL, NULL, 'admin')";

				int rs = stmt.executeUpdate(sql);
				
				if(rs>0) {
					isSuccess = true;
				}
				else {
					isSuccess = false;
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			return isSuccess;
		}
	
	//Login validate function
    //User Model eken thami meka validate krl gnne

		public static List<UserModel> loginValidate(String gmail,String password){
			
			ArrayList<UserModel> user = new ArrayList<>();
			
			try {
				//DB CONNECTION CALL
				con = DBConnection.getConnection();
				stmt = con.createStatement();
				
				//SQL QUERY
				String sql = "select * from user where " + "gmail= '"+gmail+"' and password='"+password+"'";
				rs = stmt.executeQuery(sql);
				
				if(rs.next()) {
					int id = rs.getInt(1);
					String name = rs.getString(2);
					String email = rs.getString(3);
					String pass = rs.getString(4);
					String phone = rs.getString(5);
					String add = rs.getString(6);
					String age = rs.getString(7);
					String gender = rs.getString(8);
					String profile = rs.getString(9);
					String role = rs.getString(10);
					//1,2,3,4,5are table columns
					
					UserModel u = new UserModel(id,name,email,pass,phone,add,age,gender,profile,role);
					user.add(u);
				}
				else {
					isSuccess = false;
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return user;
		}

	
	//Display user function
	
	
	public static List<UserModel> userProfile (String Id){ 
		int convertID = Integer.parseInt(Id);
		
		ArrayList<UserModel> user = new ArrayList<>();
		
		try {
			//DB CONNECTION CALL
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			
			String sql = "select * from user where id= '"+convertID+"' ";
			
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String gmail = rs.getString(3);
				String password = rs.getString(4);
				String phone = rs.getString(5);
				String add = rs.getString(6);
				String age = rs.getString(7);
				String gender = rs.getString(8);
				String profile = rs.getString(9);
				String role = rs.getString(10);
				
				
				UserModel u = new UserModel(id,name,gmail,password,phone,add,age,gender,profile,role);
				user.add(u);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	
	
	
	
	//User Profile Update
	public static boolean updateprofile(String id, String name, String gmail, String phone, String add, String age, String gender){
		try {
			//DB CONNECTION CALL
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			
			//SQL Query
			String sql = "UPDATE user SET name='" + name + 
					                    "', gmail='" + gmail + 
					                    "', phone='" + phone + 
					                    "', address='" + add + 
					                    "', age='" + age +
					                    "', gender='" + gender +
					                    "' WHERE id='" + id + "'";
			
			int rs = stmt.executeUpdate(sql);
			if(rs>0) {
				isSuccess = true;
			}
			else {
				isSuccess = false;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
	
	
	
	public static List<UserModel> getById (String Id){
		//And this method returns a list of BookModel. It takes a String parameter Id
		
		//convert the id
		int convertedId = Integer.parseInt(Id);
		
		//create a list to hold the result(eventhough it's a one book)
		ArrayList <UserModel> user = new ArrayList<>();
		
		try {
			//DB CONNECTION CALL
			con = DBConnection.getConnection(); //opens a DB connection
			stmt = con.createStatement();
			
			//SQL QUERY
			String sql = "select * from user where id = '"+convertedId+"'";
			
			rs = stmt.executeQuery(sql);  //Executes the SQL query and stores the results in rs(result set)
			
			while(rs.next()) {		//Loops through the result set (could be one or more rows)
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String gmail = rs.getString(3);
				String password = rs.getString(4);
				String phone = rs.getString(5);
				String add = rs.getString(6);
				String age = rs.getString(7);
				String gender = rs.getString(8);
				String profile = rs.getString(9);
				String role = rs.getString(10);
				
				UserModel u = new UserModel(id,name,gmail,password,phone,add,age,gender,profile,role);
				user.add(u);
				
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return user;
		
		}
	
	
	// Display data function - getAll (fetch all users for admin side)
    public static List<UserModel> getAllUsers() {
        ArrayList<UserModel> userList = new ArrayList<>();

        try {
            // DB CONNECTION CALL
            con = DBConnection.getConnection();
            stmt = con.createStatement();

            // SQL QUERY to get all products
            String sql = "SELECT * FROM user";

            rs = stmt.executeQuery(sql); // Executes the query to get all products

            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String gmail = rs.getString(3);
                String password = rs.getString(4);
                String phone = rs.getString(5);
                String address = rs.getString(6);
                String age = rs.getString(7);
                String gender = rs.getString(8);
                String img = rs.getString(9);
                String role = rs.getString(10);


                UserModel user = new UserModel(id, name, gmail, password, phone, address, age, gender, img, role);
                userList.add(user); // Add product to the list
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return userList; // Return the list of all products
    }
    
    
    
    
    // Delete user function
    public static boolean deleteUser(String id) {
        int convertedId = Integer.parseInt(id); // Convert the ID to an integer
        try {
            // DB CONNECTION CALL
            con = DBConnection.getConnection();
            stmt = con.createStatement();

            // SQL QUERY to delete product
            String sql = "DELETE FROM user WHERE id = '" + convertedId + "'";

            int result = stmt.executeUpdate(sql); // Executes the delete query

            if (result > 0) {
                isSuccess = true;
            } else {
                isSuccess = false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isSuccess; // Return success status
    }
    


}
