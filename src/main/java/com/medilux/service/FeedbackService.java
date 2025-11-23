package com.medilux.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.medilux.model.FeedbackModel;
import com.medilux.util.DBConnection;

public class FeedbackService {

    public static boolean insertFeedback(int userId, String name, String email, String city, int age, String message) {
        boolean isSuccess = false;

        String sql = "INSERT INTO feedback (user_id, name, email, city, age, message) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {

            pstmt.setInt(1, userId);
            pstmt.setString(2, name);
            pstmt.setString(3, email);
            pstmt.setString(4, city);
            pstmt.setInt(5, age);
            pstmt.setString(6, message);

            int rows = pstmt.executeUpdate();
            isSuccess = rows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return isSuccess;
    }
    
    public static List<FeedbackModel> getAllFeedbacks() {
		List<FeedbackModel> feedbackList = new ArrayList<>();
		
		try (
			Connection conn = DBConnection.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM feedback")
		) {
			while (rs.next()) {
			    FeedbackModel f = new FeedbackModel();
			    f.setId(rs.getInt("feedback_id"));
			    f.setUserId(rs.getInt("user_id"));
			    f.setName(rs.getString("name"));
			    f.setEmail(rs.getString("email"));
			    f.setCity(rs.getString("city"));
			    f.setAge(rs.getInt("age"));
			    f.setMessage(rs.getString("message"));
			    f.setSubmitDate(rs.getString("submitted_date")); // Must match DB column

			    feedbackList.add(f);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return feedbackList;
	}
    
    public static List<FeedbackModel> getUserFeedbacks(int userId) {
        List<FeedbackModel> feedbacks = new ArrayList<>();

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT feedback_id, name, email, city, age, message, submitted_date FROM feedback WHERE user_id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, userId);

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                FeedbackModel fb = new FeedbackModel();
                fb.setId(rs.getInt("feedback_id"));
                fb.setName(rs.getString("name"));
                fb.setEmail(rs.getString("email"));
                fb.setCity(rs.getString("city"));
                fb.setAge(rs.getInt("age"));
                fb.setMessage(rs.getString("message"));
                fb.setSubmitDate(rs.getTimestamp("submitted_date").toString());

                feedbacks.add(fb);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return feedbacks;
    }


    public boolean deleteFeedbackById(int feedbackId) {
        boolean isDeleted = false;
        String sql = "DELETE FROM feedback WHERE feedback_id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
             
            stmt.setInt(1, feedbackId);
            isDeleted = stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace(); // You can log this instead in production
        }

        return isDeleted;
    }
    
    
    
    public FeedbackModel getFeedbackById(int feedbackId) {
        FeedbackModel feedback = null;
        String sql = "SELECT * FROM feedback WHERE feedback_id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, feedbackId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                feedback = new FeedbackModel();
                feedback.setId(rs.getInt("feedback_id"));
                feedback.setUserId(rs.getInt("user_id"));
                feedback.setName(rs.getString("name"));
                feedback.setEmail(rs.getString("email"));
                feedback.setCity(rs.getString("city"));
                feedback.setAge(rs.getInt("age"));
                feedback.setMessage(rs.getString("message"));
                feedback.setSubmitDate(rs.getString("submitted_date"));
            }

        } catch (SQLException e) {
            e.printStackTrace(); // Consider logging in real apps
        }

        return feedback;
    }
    
    
    
    public boolean updateFeedback(FeedbackModel feedback) {
        boolean isUpdated = false;

        try (Connection conn = DBConnection.getConnection()) {
        	String sql = "UPDATE feedback SET name=?, email=?, city=?, age=?, message=? WHERE feedback_id=?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, feedback.getName());
            stmt.setString(2, feedback.getEmail());
            stmt.setString(3, feedback.getCity());
            stmt.setInt(4, feedback.getAge());
            stmt.setString(5, feedback.getMessage());
            stmt.setInt(6, feedback.getId());

            int rows = stmt.executeUpdate();
            if (rows > 0) {
                isUpdated = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isUpdated;
    }

}
