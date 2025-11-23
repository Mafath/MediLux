<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Products</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
        }
        .button {
            transition: background-color 0.3s ease, transform 0.3s ease;
        }
        .button:hover {
            background-color: #38b2ac;
            transform: scale(1.05);
        }
    </style>
</head>
<body class="bg-gradient-to-br from-teal-100 via-gray-100 to-teal-200 min-h-screen flex items-center justify-center">

    <!-- Product Listing -->
    <div class="max-w-6xl w-full p-8">
        <h2 class="text-3xl font-bold text-teal-800 mb-8">Our Products</h2>
        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6 auto-rows-fr">
            <c:forEach var="product" items="${allProducts}">
                <div class="bg-white shadow-md rounded-lg overflow-hidden border transform transition duration-300 hover:scale-105 flex flex-col justify-between h-full">
                    <!-- Product Image -->
                    <img src="Featured products/${product.getProduct_img()}" alt="${product.getProduct_title()}" class="w-3/4 mx-auto h-32 object-cover">
                    <div class="p-5">
                        <h3 class="text-base font-semibold text-gray-800">${product.getProduct_title()}</h3>
                        <p class="text-teal-600 text-sm font-medium mt-1">Rs. ${product.getProduct_price()}</p>
                    </div>
                    <div class="px-3 pb-3">
                        <!-- Open Modal Button -->
                        <button class="w-full bg-teal-600 text-white text-sm py-1.5 rounded-full hover:bg-teal-700 transition" 
                            onclick="openModal('${product.getProduct_id()}', '${product.getProduct_title()}', '${product.getProduct_price()}', '${product.getProduct_img()}')">
                            Add to Cart
                        </button>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- Modal -->
    <div id="modal" class="fixed inset-0 flex justify-center items-center bg-gray-500 bg-opacity-50 hidden">
        <div class="bg-white p-8 rounded-lg shadow-lg w-96">
            <h2 class="text-2xl font-semibold text-teal-800 mb-4">Confirm Add to Cart</h2>
            <p class="text-lg text-gray-800 mb-4">You are adding the following product:</p>

            <!-- Product Info -->
            <div class="flex items-center space-x-4 mb-4">
                <img id="modalImage" src="" alt="" class="w-16 h-16 object-cover rounded-lg">
                <div>
                    <h3 id="modalTitle" class="text-xl font-semibold text-teal-700"></h3>
                    <p id="modalPrice" class="text-sm text-teal-600"></p>
                </div>
            </div>

            <!-- Quantity Control -->
            <div class="flex items-center justify-between mb-4">
                <span class="text-lg font-medium text-gray-700">Quantity:</span>
                <div class="flex items-center space-x-2 border border-gray-300 rounded-lg">
                    <button type="button" class="bg-teal-600 text-white p-2 rounded-full" onclick="updateModalQuantity('minus')">-</button>
                    <input id="modalQuantity" type="number" value="1" min="1" class="w-16 text-center border-0 outline-none p-2" />
                    <button type="button" class="bg-teal-600 text-white p-2 rounded-full" onclick="updateModalQuantity('plus')">+</button>
                </div>
            </div>

            <!-- Buttons -->
            <div class="flex justify-between">
                <button onclick="closeModal()" class="bg-gray-300 text-gray-700 px-6 py-2 rounded-full hover:bg-gray-400 transition">Cancel</button>
                <button onclick="addToCart()" class="bg-teal-600 text-white px-6 py-2 rounded-full button">Add to Cart</button>
            </div>
        </div>
    </div>

    <script>
        function openModal(productId, productTitle, productPrice, productImg) {
            // Set the modal content
            document.getElementById('modalTitle').innerText = productTitle;
            document.getElementById('modalPrice').innerText = 'Rs. ' + productPrice;
            document.getElementById('modalImage').src = 'Featured products/' + productImg;

            // Store product details in modal for later use
            document.getElementById('modal').dataset.productId = productId;
            document.getElementById('modal').dataset.productTitle = productTitle;
            document.getElementById('modal').dataset.productPrice = productPrice;
            document.getElementById('modal').dataset.productImg = productImg;

            // Open the modal
            document.getElementById('modal').classList.remove('hidden');
        }

        function closeModal() {
            document.getElementById('modal').classList.add('hidden');
        }

        function updateModalQuantity(action) {
            let quantityInput = document.getElementById('modalQuantity');
            let currentQuantity = parseInt(quantityInput.value);

            if (action === 'plus') {
                quantityInput.value = currentQuantity + 1;
            } else if (action === 'minus' && currentQuantity > 1) {
                quantityInput.value = currentQuantity - 1;
            }
        }

        function addToCart() {
            // Get the product details from the modal
            let productId = document.getElementById('modal').dataset.productId;
            let productTitle = document.getElementById('modal').dataset.productTitle;
            let productPrice = document.getElementById('modal').dataset.productPrice;
            let productImg = document.getElementById('modal').dataset.productImg;
            let quantity = document.getElementById('modalQuantity').value;

            // Here you would typically add the product to the cart (either in session, localStorage, or AJAX request)
            alert(`Added ${quantity} ${productTitle}(s) to the cart.`);

            // Close the modal after adding to cart
            closeModal();
        }
    </script>
</body>
</html>
