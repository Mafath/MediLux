package com.medilux.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.medilux.util.DBConnection;
import com.medilux.model.ProductModel;

public class ProductService {
	
	// Connect DB
    private static boolean isSuccess;
    private static Connection con = null;
    private static Statement stmt = null;
    private static ResultSet rs = null;

    // Insert data function
    public static boolean insertProduct(String title, String price, String img, String category, String quantity) {
        boolean isSuccess = false;
        try {
            // DB CONNECTION CALL
            con = DBConnection.getConnection();
            stmt = con.createStatement();

            // SQL QUERY to insert data
            String sql = "INSERT INTO product VALUES (0, '" + title + "', '" + price + "', '" + img + "', '" + category + "', '" + quantity + "')";
            
            int result = stmt.executeUpdate(sql); // Executes the query
            
            if (result > 0) {
                isSuccess = true;
            } else {
                isSuccess = false;
            }
        } catch (Exception e) {
            e.printStackTrace(); // Print stack trace for debugging
        }
        return isSuccess; // Return success status
    }
    
    

    // Display data function - getAll (fetch all products)
    public static List<ProductModel> getAllProducts() {
        ArrayList<ProductModel> productLists = new ArrayList<>();

        try {
            // DB CONNECTION CALL
            con = DBConnection.getConnection();
            stmt = con.createStatement();

            // SQL QUERY to get all products
            String sql = "SELECT * FROM product";

            rs = stmt.executeQuery(sql); // Executes the query to get all products

            while (rs.next()) {
                int id = rs.getInt(1);
                String title = rs.getString(2);
                String price = rs.getString(3);
                String img = rs.getString(4);
                String category = rs.getString(5);
                String quantity = rs.getString(6);


                ProductModel product = new ProductModel(id, title, price, img, category, quantity);
                productLists.add(product); // Add product to the list
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return productLists; // Return the list of all products
    }

    // Update data function
    public static boolean updateProduct(String id, String name, String price, String category, String quantity, String image) {
        try {
            // DB CONNECTION CALL
            con = DBConnection.getConnection();
            stmt = con.createStatement();

            // SQL QUERY to update product
            String sql = "UPDATE product SET product_title = '" + name + "', product_price = '" + price + "', product_img = '" + image + "', category = '" + category + "', product_quantity = '" + quantity + "' WHERE product_id = '" + id + "'";

            int result = stmt.executeUpdate(sql); // Executes the update query

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
    
    
 // Display data function - getById (fetch a product by ID)
    public static List<ProductModel> getProductById(String Id) {
        int convertedId = Integer.parseInt(Id); // Convert the string ID to int
        ArrayList<ProductModel> productList = new ArrayList<>();

        try {
            // DB CONNECTION CALL
            con = DBConnection.getConnection();
            stmt = con.createStatement();

            // SQL QUERY to get product by ID
            String sql = "SELECT * FROM product WHERE product_id = '" + convertedId + "'";

            rs = stmt.executeQuery(sql); // Executes the query and stores the results in rs

            while (rs.next()) {
                int id = rs.getInt(1);
                String title = rs.getString(2);
                String price = rs.getString(3);
                String img = rs.getString(4);
                String category = rs.getString(5);
                String quantity = rs.getString(6);

                ProductModel product = new ProductModel(id, title, price, img, category, quantity); // Create ProductModel object and add it to the list
                productList.add(product);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return productList; // Return the list of products
    }

    // Delete data function
    public static boolean deleteProduct(String id) {
        int convertedId = Integer.parseInt(id); // Convert the ID to an integer
        try {
            // DB CONNECTION CALL
            con = DBConnection.getConnection();
            stmt = con.createStatement();

            // SQL QUERY to delete product
            String sql = "DELETE FROM product WHERE product_id = '" + convertedId + "'";

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
    
    
    public static List<ProductModel> getLimitedProducts(int limit) {
        ArrayList<ProductModel> limitedProducts = new ArrayList<>();

        try {
            con = DBConnection.getConnection();
            stmt = con.createStatement();

            String sql = "SELECT * FROM product ORDER BY product_id ASC LIMIT " + limit;
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                int id = rs.getInt("product_id");
                String title = rs.getString("product_title");
                String price = rs.getString("product_price");
                String img = rs.getString("product_img");
                String category = rs.getString("category");
                String quantity = rs.getString("product_quantity");

                ProductModel product = new ProductModel(id, title, price, img, category, quantity);
                limitedProducts.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return limitedProducts;
    }


}
