<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Medilux Admin - Inventory</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
  <style>
    body {
      font-family: 'Poppins', sans-serif;
    }
  </style>
</head>
<body class="bg-gray-900 text-white min-h-screen flex">

  <!-- Sidebar Fixed to the left -->
  <div class="w-52 bg-gray-800 h-screen fixed top-0 left-0 p-6 text-md">
    <h2 class="text-xl font-bold text-teal-400 mb-8">Medilux Admin</h2>
    <ul>
      <li><a href="adminDashboard.jsp" class="text-teal-400 hover:text-white hover:font-bold flex items-center py-2"><i class="fas fa-tachometer-alt mr-3"></i> Dashboard</a></li>
      <li><a href="AdminGetAllUsersServlet" class="text-teal-400 hover:text-white hover:font-bold flex items-center py-2"><i class="fas fa-users mr-3"></i> Users</a></li>
      <li><a href="AdminGetAllProductServlet" class="text-teal-400 hover:text-white hover:font-bold flex items-center py-2"><i class="fas fa-cogs mr-3"></i> Inventory</a></li>
      <li><a href="#" class="text-teal-400 hover:text-white hover:font-bold flex items-center py-2"><i class="fas fa-box mr-3"></i> Orders</a></li>
      <li><a href="#" class="text-teal-400 hover:text-white hover:font-bold flex items-center py-2"><i class="fas fa-question-circle mr-3"></i> Inquiries</a></li>
	  <li><a href="showAllFeedbacks" class="text-teal-400 hover:text-white hover:font-bold flex items-center py-2"><i class="fas fa-comments mr-3"></i> Feedbacks</a></li>
      <li><a href="#" class="text-teal-400 hover:text-white hover:font-bold flex items-center py-2"><i class="fas fa-cogs mr-3"></i> Settings</a></li> 
    </ul>
  </div>

  <!-- Content Area Scrollable -->
  <div class="flex-1 p-6 ml-64 overflow-y-auto h-screen">
    
    <!-- Header -->
    <div class="mb-8 flex justify-between items-center">
      <h1 class="text-2xl font-bold text-teal-400">Inventory</h1>
      <button onclick="window.location.href='ProductInsert.jsp';" class="bg-teal-500 hover:bg-teal-600 text-white px-4 py-2 rounded-lg shadow-lg flex items-center">
        <i class="fa fa-user-circle mr-2" aria-hidden="true"></i> Add products +
      </button>
    </div>


    <!-- Search & Filter -->
    <div class="flex flex-col md:flex-row justify-between items-center mb-6 gap-4">
      <input type="text" id="searchInput" placeholder="Search products..." class="w-full md:w-1/3 px-4 py-2 rounded-lg bg-gray-800 text-white text-sm border border-gray-700 focus:ring-2 focus:ring-teal-500 focus:outline-none">
      <div class="flex space-x-4">
        <select id="roleFilter" class="bg-gray-800 text-white text-sm px-4 py-2 border border-gray-700 rounded-lg">
  <option value="all">All Products</option>
  <option value="Baby & Childcare">Baby & Childcare</option>
  <option value="Vitamins & Supplements">Vitamins & Supplements</option>
  <option value="Prescription Medications">Prescription Medications</option>
  <option value="First Aid & Medical Supplies">First Aid & Medical Supplies</option>
</select>
      </div>
    </div>
    
    
    
    
	<table class="w-full text-left bg-gray-800 rounded-lg overflow-hidden shadow-lg">
  <thead>
    <tr class="bg-gray-700 text-teal-400 text-sm">
      <th class="py-3 px-4">Product ID</th>
      <th class="py-3 px-4">Category</th>
      <th class="py-3 px-4">Name</th>
      <th class="py-3 px-4">Price</th>
      <th class="py-3 px-4">Remaining<br/>Stock</th>
      <th class="py-3 px-4">Image</th>
      <th class="py-3 px-4">Actions</th>
    </tr>
  </thead>
  <tbody class="text-sm text-gray-300">
    <c:forEach var="product" items="${allProducts}">
      <tr class="border-b border-gray-600 hover:bg-gray-700">
        <td class="py-3 px-4">${product.getProduct_id()}</td>
        <td class="py-3 px-4">${product.getCategory()}</td>
        <td class="py-3 px-4">${product.getProduct_title()}</td>
        <td class="py-3 px-4">Rs. ${product.getProduct_price()}</td>
        <td class="py-3 px-4">${product.getProduct_quantity()}</td>
        <td class="py-3 px-4">
          <img src="Featured products/${product.getProduct_img()}" alt="Product Image" class="w-12 h-12 object-cover rounded-md"/>
        </td>
        <td class="px-4 py-4 flex space-x-6">
	        <a href="ProductUpdate.jsp?id=${product.getProduct_id()}&name=${product.getProduct_title()}&price=${product.getProduct_price()}&category=${product.getCategory()}&quantity=${product.getProduct_quantity()}&image=${product.getProduct_img()}">
			  <button class="text-blue-400 hover:text-blue-600"><i class="fas fa-edit"></i></button>
			</a>


	        <form action="DeleteProductServlet" method="post" onsubmit="return confirm('Are you sure you want to delete this product?');">
  <input type="hidden" name="id" value="${product.getProduct_id()}" />
  <button class="text-red-400 hover:text-red-600"><i class="fas fa-trash"></i></button>		
</form>

        </td>
      </tr>
    </c:forEach>
  </tbody>
</table>



  </div>
  
  
  
  
  <!-- JavaScript for Filtering Users -->
	<script>
	    function filterTable() {
	        var input, filter, table, tr, td, i, j, txtValue;
	        input = document.getElementById("searchInput");
	        filter = input.value.toUpperCase();
	        table = document.querySelector("table");
	        tr = table.getElementsByTagName("tr");
	
	        for (i = 1; i < tr.length; i++) { // Start from 1 to skip the table header row
	            td = tr[i].getElementsByTagName("td");
	            tr[i].style.display = "none"; // Default to hide
	            for (j = 0; j < td.length; j++) {
	                if (td[j]) {
	                    txtValue = td[j].textContent || td[j].innerText;
	                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
	                        tr[i].style.display = "";
	                        break;
	                    }
	                }
	            }
	        }
	    }
	
	    document.getElementById("searchInput").addEventListener("input", filterTable);
	    //calls the function
	</script>
	
	<script>
  const roleFilter = document.getElementById('roleFilter');
  const productRows = document.querySelectorAll('tbody tr');

  roleFilter.addEventListener('change', function () {
    const selectedCategory = this.value.toLowerCase();

    productRows.forEach(row => {
      const categoryText = row.cells[1].textContent.trim().toLowerCase();
      if (selectedCategory === 'all' || categoryText === selectedCategory) {
        row.style.display = '';
      } else {
        row.style.display = 'none';
      }
    });
  });
</script>


	
	
	
  
</body>
</html>
