<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
  <title>MediLux - Products</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>

  <%@ include file="header.jsp" %>

<section class="py-12 bg-white">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        
        <!-- Baby & Childcare Category -->
        <h2 class="text-3xl font-bold text-red-800 mb-8">Baby & Childcare</h2>
        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-5 gap-6 auto-rows-fr">
            <c:forEach var="product" items="${allProducts}">
                <c:if test="${product.getCategory() == 'Baby & Childcare'}">
                    <div class="bg-white shadow-md rounded-lg overflow-hidden border transform transition duration-300 hover:scale-105 flex flex-col justify-between h-full">
                        <img src="Featured products/${product.getProduct_img()}" alt="${product.getProduct_title()}" class="w-3/4 mx-auto h-36 object-cover">
                        <div class="p-5">
                            <h3 class="text-base font-semibold text-gray-800">${product.getProduct_title()}</h3>
                            <p class="text-teal-600 text-sm font-medium mt-1">Rs. ${product.getProduct_price()}</p>
                        </div>
                        <div class="px-3 pb-3">
	                        <button class="w-full bg-teal-600 text-white text-sm py-1.5 rounded-full hover:bg-teal-700 transition" 
	                            onclick="openModal('${product.getProduct_id()}', '${product.getProduct_title()}', '${product.getProduct_price()}', '${product.getProduct_img()}')">
	                            Add to Cart
	                        </button>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
        </div>


        <!-- Vitamins & Supplements Category -->
        <h2 class="text-3xl font-bold text-red-800 mb-8 mt-12">Vitamins & Supplements</h2>
        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-5 gap-6 auto-rows-fr">
            <c:forEach var="product" items="${allProducts}">
                <c:if test="${product.getCategory() == 'Vitamins & Supplements'}">
                    <div class="bg-white shadow-md rounded-lg overflow-hidden border transform transition duration-300 hover:scale-105 flex flex-col justify-between h-full">
                        <img src="Featured products/${product.getProduct_img()}" alt="${product.getProduct_title()}" class="w-3/4 mx-auto h-36 object-cover">
                        <div class="p-5">
                            <h3 class="text-base font-semibold text-gray-800">${product.getProduct_title()}</h3>
                            <p class="text-teal-600 text-sm font-medium mt-1">Rs. ${product.getProduct_price()}</p>
                        </div>
                        <div class="px-3 pb-3">
		                        <button class="w-full bg-teal-600 text-white text-sm py-1.5 rounded-full hover:bg-teal-700 transition" 
	                            onclick="openModal('${product.getProduct_id()}', '${product.getProduct_title()}', '${product.getProduct_price()}', '${product.getProduct_img()}')">
	                            Add to Cart
	                        </button>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
        </div>



        <!-- Prescription Medications Category -->
        <h2 class="text-3xl font-bold text-red-800 mb-8 mt-12">Prescription Medications</h2>
        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-5 gap-6 auto-rows-fr">
            <c:forEach var="product" items="${allProducts}">
                <c:if test="${product.getCategory() == 'Prescription Medications'}">
                    <div class="bg-white shadow-md rounded-lg overflow-hidden border transform transition duration-300 hover:scale-105 flex flex-col justify-between h-full">
                        <img src="Featured products/${product.getProduct_img()}" alt="${product.getProduct_title()}" class="w-3/4 mx-auto h-36 object-cover">
                        <div class="p-5">
                            <h3 class="text-base font-semibold text-gray-800">${product.getProduct_title()}</h3>
                            <p class="text-teal-600 text-sm font-medium mt-1">Rs. ${product.getProduct_price()}</p>
                        </div>
                        <div class="px-3 pb-3">
	                        <button class="w-full bg-teal-600 text-white text-sm py-1.5 rounded-full hover:bg-teal-700 transition" 
	                            onclick="openModal('${product.getProduct_id()}', '${product.getProduct_title()}', '${product.getProduct_price()}', '${product.getProduct_img()}')">
	                            Add to Cart
	                        </button>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
        </div>

        <!-- First Aid & Medical Supplies Category -->
        <h2 class="text-3xl font-bold text-red-800 mb-8 mt-12">First Aid & Medical Supplies</h2>
        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-5 gap-6 auto-rows-fr">
            <c:forEach var="product" items="${allProducts}">
                <c:if test="${product.getCategory() == 'First Aid & Medical Supplies'}">
                    <div class="bg-white shadow-md rounded-lg overflow-hidden border transform transition duration-300 hover:scale-105 flex flex-col justify-between h-full">
                        <img src="Featured products/${product.getProduct_img()}" alt="${product.getProduct_title()}" class="w-3/4 mx-auto h-36 object-cover">
                        <div class="p-5">
                            <h3 class="text-base font-semibold text-gray-800">${product.getProduct_title()}</h3>
                            <p class="text-teal-600 text-sm font-medium mt-1">Rs. ${product.getProduct_price()}</p>
                        </div>
                        <div class="px-3 pb-3">
	                        <button class="w-full bg-teal-600 text-white text-sm py-1.5 rounded-full hover:bg-teal-700 transition" 
	                            onclick="openModal('${product.getProduct_id()}', '${product.getProduct_title()}', '${product.getProduct_price()}', '${product.getProduct_img()}')">
	                            Add to Cart
	                        </button>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
        </div>
        

    </div>
</section>




    <div id="modal" class="fixed z-50 inset-0 flex justify-center items-center bg-gray-500 bg-opacity-50 hidden">
        <div class="bg-white p-8 rounded-lg shadow-lg w-96">
            <h2 class="text-2xl font-semibold text-teal-800 mb-4">Confirm Add to Cart</h2>
            <p class="text-lg text-gray-800 mb-4">You are adding the following product:</p>

            
            <div class="flex items-center space-x-4 mb-4">
                <img id="modalImage" src="" alt="" class="w-16 h-16 object-cover rounded-lg">
                <div>
                    <h3 id="modalTitle" class="text-xl font-semibold text-teal-700"></h3>
                    <p id="modalPrice" class="text-sm text-teal-600"></p>
                </div>
            </div>

            
            <div class="flex items-center justify-between mb-4">
                <span class="text-lg font-medium text-gray-700">Quantity:</span>
                <div class="flex items-center space-x-2 border border-gray-300 rounded-lg">
                    <button type="button" class="bg-teal-600 text-white p-2 rounded-full" onclick="updateModalQuantity('minus')">-</button>
                    <input id="modalQuantity" value="1" min="1" class="w-16 text-center border-0 outline-none p-2" />
                    <button type="button" class="bg-teal-600 text-white p-2 rounded-full" onclick="updateModalQuantity('plus')">+</button>
                </div>
            </div>

            
			<div class="flex justify-between">
			    <button onclick="closeModal()" class="bg-gray-300 text-gray-700 px-6 py-2 rounded-full hover:bg-gray-400 transition">
			        Cancel
			    </button>
			    
			    <!-- Add to Cart Form -->
			    <form id="addToCartForm" method="POST" action="AddToCartServlet">
			        <input type="hidden" name="id" id="hiddenProductId">
			        <input type="hidden" name="quantity" id="hiddenQuantity">
			        <button type="submit" class="bg-teal-600 text-white px-6 py-2 rounded-full">Add to Cart</button>
			    </form>
			</div>

        </div>
    </div>
    
    
    
    

    

    <script>
	    function openModal(productId, productTitle, productPrice, productImg) {
	       
	        document.getElementById('modalTitle').innerText = productTitle;
	        document.getElementById('modalPrice').innerText = 'Rs. ' + productPrice;
	        document.getElementById('modalImage').src = 'Featured products/' + productImg;
	
	       
	        document.getElementById('hiddenProductId').value = productId;
	
	        
	        document.getElementById('modalQuantity').value = 1;
	        document.getElementById('hiddenQuantity').value = 1;
	
	      
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
        
        function updateModalQuantity(action) {
            let quantityInput = document.getElementById('modalQuantity');
            let hiddenQuantity = document.getElementById('hiddenQuantity');
            let currentQuantity = parseInt(quantityInput.value);

            if (action === 'plus') {
                quantityInput.value = currentQuantity + 1;
            } else if (action === 'minus' && currentQuantity > 1) {
                quantityInput.value = currentQuantity - 1;
            }

           
            hiddenQuantity.value = quantityInput.value;
        }



    </script>

  <%@ include file="footer.jsp" %>

</body>
</html>