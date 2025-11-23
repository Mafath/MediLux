<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
  <title>Medilux - Add Product</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
        }
    </style>
</head>
<body class="min-h-screen bg-gradient-to-br from-gray-900 to-teal-900 flex items-center justify-center font-[Poppins] text-sm">

<div class="bg-white/10 backdrop-blur-xl border border-white/20 shadow-2xl rounded-2xl p-6 w-full max-w-md">
    <h2 class="text-2xl font-semibold text-teal-400 mb-6 text-center">Insert New Product</h2>

    <form action="AddProductServlet" method="post" class="space-y-4">

    <!-- Product Title -->
    <div>
        <label for="title" class="block text-gray-300 font-medium mb-1">Product Title</label>
        <input type="text" id="title" name="title" required
               placeholder="e.g., Paracetamol 500mg"
               class="w-full px-3 py-1.5 rounded-xl border border-gray-600 bg-white/10 text-white placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-teal-500 transition" />
    </div>

    <!-- Product Price -->
    <div>
        <label for="price" class="block text-gray-300 font-medium mb-1">Product Price</label>
        <input type="number" id="price" min="1" name="price" required
               placeholder="e.g., 299.99"
               class="w-full px-3 py-1.5 rounded-xl border border-gray-600 bg-white/10 text-white placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-teal-500 transition" />
    </div>

    <!-- Image Filename -->
    <div>
        <label for="img" class="block text-gray-300 font-medium mb-1">Image Filename</label>
        <div class="flex items-center gap-2">
            <input type="text" id="img" name="img" readonly required
                   placeholder="Select image file..."
                   class="flex-grow px-3 py-1.5 rounded-xl border border-gray-600 bg-white/10 text-white placeholder-gray-400 focus:outline-none" />
            <button type="button" onclick="selectImage()"
                    class="px-3 py-1.5 bg-teal-600 hover:bg-teal-500 text-white font-medium rounded-md transition">
                Select
            </button>
            <input type="file" id="realImageInput" accept="image/*" style="display: none;" onchange="setImageName(this)">
        </div>
    </div>

    <!-- Category -->
    <div>
        <label for="category" class="block text-gray-300 font-medium mb-1">Category</label>
        <select name="category" id="category" required
                class="w-full px-3 py-1.5 rounded-xl border border-gray-600 bg-white/10 text-white focus:outline-none focus:ring-2 focus:ring-teal-500">
            <option class="text-black" value="" disabled selected>Select category</option>
            <option class="text-black" value="Baby & Childcare">Baby & Childcare</option>
            <option class="text-black" value="Vitamins & Supplements">Vitamins & Supplements</option>
            <option class="text-black" value="Prescription Medications">Prescription Medications</option>
            <option class="text-black" value="First Aid & Medical Supplies">First Aid & Medical Supplies</option>
        </select>
    </div>

    <!-- Quantity -->
    <div>
        <label for="qty" class="block text-gray-300 font-medium mb-1">Quantity</label>
        <input type="number" id="qty" name="qty" min="1" step="1" required
               placeholder="e.g., 50"
               class="w-full px-3 py-1.5 rounded-xl border border-gray-600 bg-white/10 text-white placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-teal-500" />
    </div>

    <!-- Submit -->
    <div class="flex justify-between items-center pt-2">
        <a href="AdminGetAllProductServlet" class="text-teal-400 hover:underline text-sm">Cancel</a>
        <input type="submit" value="Add Product"
               class="px-4 py-1.5 bg-teal-600 hover:bg-teal-500 text-white font-medium rounded-md shadow transition cursor-pointer" />
    </div>

</form>

</div>

<script>
    function selectImage() {
        document.getElementById('realImageInput').click();
    }

    function setImageName(input) {
        if (input.files.length > 0) {
            const fileName = input.files[0].name;
            document.getElementById('img').value = fileName;
        }
    }
</script>

</body>
</html>
