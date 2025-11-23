<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.medilux.model.CartModel" %>

<%
    List<CartModel> cartList = (List<CartModel>) request.getAttribute("Cart");
    double totalPrice = 0;
    if (cartList != null && !cartList.isEmpty()) {
        for (CartModel item : cartList) {
            totalPrice += item.getProductPrice() * item.getQuantity(); // Calculate total price
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
      <title>MediLux - My Cart</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #e0f2f1, #ffffff);
        }
    </style>
</head>
<body class="bg-gradient-to-tr from-white via-gray-100 to-gray-200 min-h-screen">

    <%@ include file="header.jsp" %>

    <h1 class="text-3xl font-bold text-teal-700 mb-8 text-center mt-8">🛒 Your Shopping Cart</h1>

    <div class="flex justify-center px-12 py-12 gap-12">
        <div class="w-full lg:w-2/3">
            <% if (cartList != null && !cartList.isEmpty()) {
                for (CartModel item : cartList) {
            %>
            
            <div class="bg-white shadow-xl rounded-2xl overflow-hidden hover:shadow-2xl transition-all duration-300 w-full mb-6">
                <div class="p-6 flex flex-row gap-6">

                    <% if (item.getProductImg() != null && !item.getProductImg().isEmpty()) { %>
                        <div class="w-40 h-40 overflow-hidden rounded-lg">
                            <img src="Featured products/<%= item.getProductImg() %>" alt="Product Image" class="w-full h-full object-cover">
                        </div>
                    <% } %>

                    <div class="flex flex-col justify-between w-full">

                        <div class="flex justify-between text-sm text-gray-700 border-b border-gray-300 pb-2 mb-2">
                            <span class="font-medium">Product Name:</span>
                            <span class="text-gray-900"><%= item.getProductTitle() %></span>
                        </div>

                        <div class="flex justify-between text-sm text-gray-700 border-b border-gray-300 pb-2 mb-2">
                            <span class="font-medium">Product Price:</span>
                            <span class="text-gray-900">Rs. <%= item.getProductPrice() %></span>
                        </div>

                        <div class="flex justify-between text-sm text-gray-700 border-b border-gray-300 pb-2 mb-2">
                            <span class="font-medium">Quantity:</span>
                            <span class="text-gray-900"><%= item.getQuantity() %></span>
                        </div>

                        <div class="flex justify-between text-sm text-gray-700 border-b border-gray-300 pb-2 mb-2">
                            <span class="font-medium">Added On:</span>
                            <span><%= item.getAddedDate() %></span>
                        </div>

                        <div class="mt-4 flex justify-end gap-2">
                            <button class="bg-teal-600 hover:bg-teal-700 text-white text-sm px-4 py-1 rounded-full"
                                onclick="openEditModal('<%= item.getCartId() %>', <%= item.getQuantity() %>)">
                                Edit
                            </button>

                           
                            <form action="DeleteCartServlet" method="post" onsubmit="return confirm('Are you sure you want to remove this product?');">
                                <input type="hidden" name="id" value="<%= item.getCartId() %>" />
                                <button class="bg-red-500 hover:bg-red-600 text-white text-sm px-4 py-1 rounded-full">
                                <i class="fas fa-trash-alt mr-1"></i>Remove
                            </button>    
                            </form>
                        </div>

                    </div>

                </div>
            </div>

            <%  }
            } else { %>
                <p class="col-span-full text-center text-gray-600 text-lg">Your cart is currently empty.</p>
            <% } %>
        </div>

        
        <div class="w-full lg:w-1/3 bg-white shadow-xl rounded-2xl p-6 flex flex-col justify-between h-60">
            <h2 class="text-xl font-semibold text-gray-700 mb-4">Cart Summary</h2>

            
            <div class="flex justify-between text-lg text-gray-800 mb-6">
                <span class="font-medium">Total Price:</span>
                <span class="text-teal-600">Rs. <%= totalPrice %></span>
            </div>

            
            <div class="flex justify-center">
                <button class="bg-teal-600 hover:bg-teal-700 text-white text-lg px-6 py-2 rounded-full w-full">
                    Checkout
                </button>
            </div>
        </div>
    </div>

    <!-- Edit Quantity Modal -->
    <div id="editModal" class="fixed inset-0 flex justify-center items-center bg-gray-500 bg-opacity-50 hidden">
        <div class="bg-white p-8 rounded-lg shadow-lg w-96">
            <h2 class="text-2xl font-semibold text-teal-800 mb-4">Edit Quantity</h2>

           
            <div class="flex flex-col mb-4">
                <label for="editQuantity" class="text-lg text-gray-800">Quantity:</label>
                <input id="editQuantity" type="number" class="border p-2 rounded-lg" min="1" />
            </div>

           
            <div class="flex justify-between">
                <button onclick="closeEditModal()" class="bg-gray-300 text-gray-700 px-6 py-2 rounded-full hover:bg-gray-400 transition">
                    Cancel
                </button>

                <!-- Update Quantity Form -->
                <form id="updateQuantityForm" method="POST" action="UpdateCartServlet">
                    <input type="hidden" name="cart_id" id="hiddenCartId" />
                    <input type="hidden" name="quantity" id="hiddenQuantity" />
                    <button type="submit" class="bg-teal-600 text-white px-6 py-2 rounded-full">Update Quantity</button>
                </form>
            </div>
        </div>
    </div>

    
    <script>
        function openEditModal(cartId, currentQuantity) {
            
            document.getElementById('editQuantity').value = currentQuantity;

            
            document.getElementById('hiddenCartId').value = cartId;

           
            document.getElementById('editModal').classList.remove('hidden');
        }

        function closeEditModal() {
            document.getElementById('editModal').classList.add('hidden');
        }

        // Update the hidden quantity field before submitting
        document.getElementById('editQuantity').addEventListener('input', function () {
            document.getElementById('hiddenQuantity').value = document.getElementById('editQuantity').value;
        });
    </script>

    <%@ include file="footer.jsp" %>

</body>
</html>