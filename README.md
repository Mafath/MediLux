# MediLux

MediLux is a Java web application (Servlets + JSP) that implements basic e-commerce features: product catalog, shopping cart, user profiles, feedback, and an admin dashboard for managing products and users.

## Tech stack
- Java 11+ (or compatible JVM)
- Java Servlets and JSP
- Plain JDBC for persistence
- MySQL as the database
- Deployable to a servlet container (Apache Tomcat / Eclipse server)

## Project Overview

MediLux is a lightweight pharmacy / medical supplies web application that demonstrates a complete CRUD + session-based web flow. It includes:
- Public-facing product catalog and search
- User registration, login, and profile management (including profile image upload)
- Shopping cart with add / update / delete item flows
- Feedback submission and admin moderation
- Admin dashboard for managing products and users


## How to run locally

1. Install Java and MySQL.
2. Import the project into Eclipse (or your IDE) as a Dynamic Web Project or Maven/Gradle project if you add build files.
3. Ensure the MySQL JDBC driver (Connector/J) is on the classpath (`WEB-INF/lib/`).
4. Update DB credentials in `src/main/java/com/medilux/util/DBConnection.java`.
5. Create the database using `db/schema.sql` and optionally apply `db/seed.sample.sql`.
6. Deploy to Tomcat and open `http://localhost:8080/<your-app-context>/`.

See the Cloning & Database setup section below for exact commands.

## Database Configuration (placeholders method)

1. Open `src/main/java/com/medilux/util/DBConnection.java`.
2. Replace the placeholders `YOUR_DB_USERNAME` and `YOUR_DB_PASSWORD` with your local MySQL credentials.

Example (in `DBConnection.java`):
```java
private static String url = "jdbc:mysql://localhost:3306/medilux";
private static String user = "YOUR_DB_USERNAME";
private static String pass = "YOUR_DB_PASSWORD";
```

## Files & structure
- `src/main/java/com/medilux/model/` — domain models (`ProductModel`, `UserModel`, `CartModel`, `FeedbackModel`)
- `src/main/java/com/medilux/service/` — JDBC-based service classes (`ProductService`, `UserService`, `CartService`)
- `src/main/java/com/medilux/servlet/` — servlets handling requests and flows
- `src/main/webapp/` — JSP pages, assets and `uploads/`
- `src/main/java/com/medilux/util/DBConnection.java` — DB connection (update credentials here)

## Suggested database schema
Run these statements to create the core tables used by the app. Adjust column types if different types are prefered(e.g., use `DECIMAL` for prices):
Check the seed files in db directory.

```sql
CREATE DATABASE IF NOT EXISTS medilux;
USE medilux;

CREATE TABLE `user` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(100),
  `gmail` VARCHAR(150) UNIQUE,
  `password` VARCHAR(255),
  `phone` VARCHAR(50),
  `address` VARCHAR(255),
  `age` VARCHAR(10),
  `gender` VARCHAR(20),
  `profile_picture_url` VARCHAR(255),
  `role` VARCHAR(20) DEFAULT 'user'
);

CREATE TABLE `product` (
  `product_id` INT AUTO_INCREMENT PRIMARY KEY,
  `product_title` VARCHAR(255),
  `product_price` VARCHAR(50),
  `product_img` VARCHAR(255),
  `category` VARCHAR(100),
  `product_quantity` VARCHAR(50)
);

CREATE TABLE `cart` (
  `cart_id` INT AUTO_INCREMENT PRIMARY KEY,
  `user_id` INT,
  `product_id` INT,
  `quantity` INT DEFAULT 1,
  `added_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`user_id`) REFERENCES `user`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`product_id`) REFERENCES `product`(`product_id`) ON DELETE CASCADE
);

CREATE TABLE `feedback` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `user_id` INT,
  `name` VARCHAR(100),
  `email` VARCHAR(150),
  `city` VARCHAR(100),
  `age` INT,
  `message` TEXT,
  `submit_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`user_id`) REFERENCES `user`(`id`) ON DELETE SET NULL
);
```
