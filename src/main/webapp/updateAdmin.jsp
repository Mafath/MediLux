<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Admin Profile</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
        }
    </style>
</head>
<body class="min-h-screen bg-gradient-to-br from-white via-blue-50 to-teal-100 flex items-center justify-center px-4">

<%
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String gmail = request.getParameter("gmail");
    String phone = request.getParameter("phone");
    String address = request.getParameter("address");
    String age = request.getParameter("age");
    String gender = request.getParameter("gender");
%>

<div class="bg-white bg-opacity-60 backdrop-blur-md border border-gray-200 shadow-2xl rounded-2xl p-8 w-full max-w-4xl">
    <h2 class="text-2xl font-semibold text-gray-800 mb-8 text-center">Update Admin Profile</h2>

    <form action="UpdateAdminProfileServlet" method="post">
        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">

            <!-- ID -->
            <div>
                <label for="id" class="block text-gray-700 font-medium mb-1">Admin ID</label>
                <input type="text" id="id" name="id" value="<%= id %>" readonly
                       class="w-full px-4 py-2 rounded-lg border border-gray-300 bg-gray-100 text-gray-600">
            </div>

            <!-- Name -->
            <div>
                <label for="name" class="block text-gray-700 font-medium mb-1">Name</label>
                <input type="text" id="name" name="name"
                       value="<%= (name != null && !name.isEmpty()) ? name : "" %>" required
                       class="w-full px-4 py-2 rounded-lg border border-gray-300 bg-white text-gray-700 focus:ring-2 focus:ring-teal-400">
            </div>

            <!-- Email -->
            <div>
                <label for="gmail" class="block text-gray-700 font-medium mb-1">Email</label>
                <input type="text" id="gmail" name="gmail"
                       value="<%= (gmail != null && !gmail.isEmpty()) ? gmail : "" %>" required
                       class="w-full px-4 py-2 rounded-lg border border-gray-300 bg-white text-gray-700 focus:ring-2 focus:ring-teal-400">
            </div>

            <!-- Phone -->
            <div>
                <label for="phone" class="block text-gray-700 font-medium mb-1">Phone</label>
                <input type="tel" id="phone" name="phone"
       pattern="^0[0-9]{9}$" maxlength="10"
       title="Phone number must start with 0 and be exactly 10 digits"
       value="<%= (phone == null || "null".equalsIgnoreCase(phone) || phone.trim().isEmpty()) ? "" : phone %>"
       class="w-full px-4 py-2 rounded-lg border border-gray-300 bg-white text-gray-700 focus:ring-2 focus:ring-teal-400"
       >

            </div>


            <!-- Address -->
            <div>
                <label for="address" class="block text-gray-700 font-medium mb-1">Address</label>
                <input type="text" id="address" name="address"
                       value="<%= (address == null || "null".equalsIgnoreCase(address) || address.trim().isEmpty()) ? "" : address %>"
                       class="w-full px-4 py-2 rounded-lg border border-gray-300 bg-white text-gray-700 focus:ring-2 focus:ring-teal-400">
            </div>

            <!-- Age -->
            <div>
                <label for="age" class="block text-gray-700 font-medium mb-1">Age</label>
                <input type="number" id="age" name="age" min="1" max="120"
                       value="<%= (age == null || "null".equalsIgnoreCase(age) || age.trim().isEmpty()) ? "" : age %>"
                       class="w-full px-4 py-2 rounded-lg border border-gray-300 bg-white text-gray-700 focus:ring-2 focus:ring-teal-400">
            </div>

            <!-- Gender -->
            <div>
                <label for="gender" class="block text-gray-700 font-medium mb-1">Gender</label>
                <select id="gender" name="gender"
                        class="w-full px-4 py-2 rounded-lg border border-gray-300 bg-white text-gray-700 focus:ring-2 focus:ring-teal-400">
                    <option value="">Select Gender</option>
                    <option value="Male" <%= "Male".equalsIgnoreCase(gender) ? "selected" : "" %>>Male</option>
                    <option value="Female" <%= "Female".equalsIgnoreCase(gender) ? "selected" : "" %>>Female</option>
                </select>
            </div>

        </div>

        <!-- Submit Button -->
        <div class="text-center pt-8">
            <a href="GetAdminProfileServlet" class="text-teal-600 underline mr-6">Cancel</a>
            <input type="submit" value="Update"
                   class="px-6 py-2 bg-teal-600 hover:bg-teal-500 text-white font-medium rounded-md shadow-md transition duration-300 cursor-pointer">
        </div>
    </form>
</div>

</body>
</html>
