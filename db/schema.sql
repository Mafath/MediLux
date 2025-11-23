-- Schema for MediLux (DDL only)

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `product` (
  `product_id` INT AUTO_INCREMENT PRIMARY KEY,
  `product_title` VARCHAR(255),
  `product_price` VARCHAR(50),
  `product_img` VARCHAR(255),
  `category` VARCHAR(100),
  `product_quantity` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `cart` (
  `cart_id` INT AUTO_INCREMENT PRIMARY KEY,
  `user_id` INT,
  `product_id` INT,
  `quantity` INT DEFAULT 1,
  `added_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`user_id`) REFERENCES `user`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`product_id`) REFERENCES `product`(`product_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
