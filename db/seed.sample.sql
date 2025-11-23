-- Small sample seed data for MediLux (safe for public repo)
-- Replace passwords with hashed values in production.

USE medilux;

-- Sample admin user (change password before use)
INSERT INTO `user` (id, name, gmail, password, phone, address, age, gender, profile_picture_url, role) VALUES
(1, 'admin', 'admin@example.com', 'changeme', '0000000000', 'Admin Address', '30', 'Other', NULL, 'admin');

-- Sample product
INSERT INTO `product` (product_id, product_title, product_price, product_img, category, product_quantity) VALUES
(1, 'Sample Product', '99', 'sample.jpg', 'General', 10);
