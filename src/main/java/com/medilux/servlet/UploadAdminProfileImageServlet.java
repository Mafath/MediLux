package com.medilux.servlet;

import com.medilux.model.UserModel;
import com.medilux.service.UserService;
import com.medilux.util.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

@WebServlet("/UploadAdminProfileImageServlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 1,   // 1MB
    maxFileSize = 1024 * 1024 * 10,        // 10MB
    maxRequestSize = 1024 * 1024 * 15      // 15MB
)
public class UploadAdminProfileImageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // This path is where your profile images will be saved under the project directory (webapp/uploads/)
    private static final String UPLOAD_DIRECTORY = "uploads";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Get user ID
            int userId = Integer.parseInt(request.getParameter("userId"));

            // Get uploaded file
            Part filePart = request.getPart("profileImage");
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

            // Get real path to the 'uploads' folder
            String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdir();

            // Save the file on the server
            String filePath = uploadPath + File.separator + fileName;
            filePart.write(filePath);

            // Create relative path to store in DB
            String imagePath = UPLOAD_DIRECTORY + "/" + fileName;

            // Update in database
            UserService userService = new UserService();
            userService.updateProfileImage(userId, imagePath); // You must implement this method

            // Update session user object
            HttpSession session = request.getSession();
            UserModel user = (UserModel) session.getAttribute("user");
            if (user != null) {
                user.setProfile_picture_url(imagePath);
                session.setAttribute("user", user);
            }

            // Redirect to profile page
            response.sendRedirect("adminProfile.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp"); // optional error page
        }
    }
}
