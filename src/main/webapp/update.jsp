<!-- Delete this one -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Profile</title>
</head>
<body>
    <%
        // Retrieving user data from URL parameters and storing them in variables
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String gmail = request.getParameter("gmail");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String age = request.getParameter("age");
        String gender = request.getParameter("gender");
    %>
    
    <form action="UpdateProfileServlet" method="post">
        <table>
            <tr>
                <td>ID:</td>
                <td><input type="text" id="id" name="id" value="<%= id %>" readonly></td>
            </tr>
            <tr>
                <td>Name:</td>
                <td><input type="text" id="name" name="name" value="<%= (name != null && !name.isEmpty()) ? name : "" %>" required></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><input type="text" id="gmail" name="gmail" value="<%= (gmail != null && !gmail.isEmpty()) ? gmail : "" %>" required></td>
            </tr>
            <tr>
                <td>Phone:</td>
                <td><input type="text" id="phone" name="phone" value="<%= (phone != null && !phone.isEmpty()) ? phone : "" %>" required></td>
            </tr>
            <tr>
                <td>Address:</td>
                <td><input type="text" id="address" name="address" value="<%= (address != null && !address.isEmpty()) ? address : "" %>" required></td>
            </tr>
            <tr>
                <td>Age:</td>
                <td><input type="text" id="age" name="age" value="<%= (age != null && !age.isEmpty()) ? age : "" %>" required></td>
            </tr>
            <tr>
                <td>Gender:</td>
                <td><input type="text" id="gender" name="gender" value="<%= (gender != null && !gender.isEmpty()) ? gender : "" %>" required></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Update"></td>
            </tr>
        </table>
    </form>
</body>
</html>
