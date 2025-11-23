<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Medilux - Add Admin</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
  <style>
    body {
      font-family: 'Poppins', sans-serif;
    }
  </style>
</head>
<body class="relative bg-gradient-to-br from-gray-900 via-gray-800 to-gray-900 min-h-screen flex items-center justify-center overflow-hidden">

  <!-- Main Container -->
  <div class="relative z-10 flex flex-col md:flex-row items-center justify-center px-4 py-8 md:px-0 md:py-0">
    <!-- Right Side Form -->
    <div class="w-full md:w-[420px] bg-white/10 backdrop-blur-2xl shadow-2xl rounded-2xl p-8 border border-white/20">
      <h2 class="text-3xl font-bold text-center text-teal-400 mb-6">Add Admin</h2>
      <form action="AdminInsertServlet" method="post" class="space-y-5">
        <div>
          <label for="name" class="block text-gray-300 font-medium mb-1">Name</label>
          <input type="text" name="name" id="name" required
                 class="w-full px-4 py-2 rounded-xl border border-gray-600 bg-white/10 text-white placeholder-gray-400 focus:ring-2 focus:ring-teal-500 focus:outline-none transition duration-150" />
        </div>
        <div>
          <label for="gmail" class="block text-gray-300 font-medium mb-1">Email</label>
          <input type="email" name="gmail" id="gmail" required
                 class="w-full px-4 py-2 rounded-xl border border-gray-600 bg-white/10 text-white placeholder-gray-400 focus:ring-2 focus:ring-teal-500 focus:outline-none transition duration-150" />
        </div>
        <div>
          <label for="password" class="block text-gray-300 font-medium mb-1">Password</label>
          <input type="password" name="password" id="password" required
	          pattern=".{6,}" title="Password must be at least 6 characters"
	          class="w-full px-4 py-2 rounded-xl border border-gray-600 bg-white/10 text-white placeholder-gray-400 focus:ring-2 focus:ring-teal-500 focus:outline-none transition duration-150" />
        </div>

        <button type="submit"
                class="w-full bg-gradient-to-r from-teal-500 to-teal-700 text-white font-semibold py-2 rounded-full shadow-lg hover:shadow-xl hover:scale-[1.02] transition duration-200">
          Register Admin
        </button>

        <p class="text-center text-gray-400 mt-4 text-sm">
          <a href="AdminGetAllUsersServlet" class="text-teal-400 font-semibold hover:underline">Cancel</a>
        </p>
      </form>
    </div>
  </div>
</body>
</html>
