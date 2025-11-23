package com.medilux.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.medilux.util.DBConnection;
import com.medilux.model.CartModel;

public class CartService {

    // Insert data into cart
    public static boolean insertdata(int userId, int productId, int quantity) {
        boolean isSuccess = false;

        String sql = "INSERT INTO cart (user_id, product_id, quantity, added_date) " +
                     "VALUES (?, ?, ?, CURRENT_TIMESTAMP)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {

            pstmt.setInt(1, userId);
            pstmt.setInt(2, productId);
            pstmt.setInt(3, quantity);

            int rows = pstmt.executeUpdate();
            isSuccess = rows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return isSuccess;
    }

    // Retrieve cart items for a user
    public static List<CartModel> getCart(String userIdStr) {
        List<CartModel> cart = new ArrayList<>();
        int userId = Integer.parseInt(userIdStr);

        String sql = "SELECT c.cart_id, c.user_id, c.product_id, c.quantity, c.added_date, " +
                     "p.product_title, p.product_price, p.product_img " +
                     "FROM cart c " +
                     "JOIN product p ON c.product_id = p.product_id " +
                     "WHERE c.user_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {

            pstmt.setInt(1, userId);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    int cartId = rs.getInt("cart_id");
                    int productId = rs.getInt("product_id");
                    int qty = rs.getInt("quantity");
                    String addedDate = rs.getString("added_date");
                    String title = rs.getString("product_title");
                    double price = rs.getDouble("product_price");
                    String img = rs.getString("product_img");

                    CartModel cm = new CartModel(cartId, userId, productId, qty, addedDate);
                    cm.setProductTitle(title);
                    cm.setProductPrice(price);
                    cm.setProductImg(img);

                    cart.add(cm);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return cart;
    }

    // Delete a cart item
    public static boolean deleteCartItem(int cartId) {
        boolean result = false;
        String sql = "DELETE FROM cart WHERE cart_id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, cartId);
            result = stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

    
    // Update a cart item
    public static boolean updateCartItem(int cartId, int newQuantity, String addedDate) {
        boolean success = false;
        String sql = "UPDATE cart SET quantity = ?, added_date = ? WHERE cart_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {

            pstmt.setInt(1, newQuantity);
            pstmt.setString(2, addedDate);
            pstmt.setInt(3, cartId);

            int rowsAffected = pstmt.executeUpdate();
            success = rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return success;
    }
    
    
}