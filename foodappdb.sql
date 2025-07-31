-- Create and use database
USE foodappdb;
DROP TABLE IF EXISTS cart;
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS menu;
DROP TABLE IF EXISTS restaurant;
DROP TABLE IF EXISTS users;

CREATE DATABASE IF NOT EXISTS foodappdb;
USE foodappdb;

-- USERS TABLE
DROP TABLE IF EXISTS users;

    CREATE TABLE users (
    userid INT  NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    username VARCHAR(100) UNIQUE,
    password VARCHAR(100),
    email VARCHAR(100),
    phonenumber VARCHAR(20),
    address VARCHAR(255),
    role VARCHAR(50),
    created_date TIMESTAMP,
    last_login_date TIMESTAMP
);




-- RESTAURANT TABLE
DROP TABLE IF EXISTS restaurant;
CREATE TABLE restaurant (
    restaurantId INT PRIMARY KEY NOT NULL  AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255) NOT NULL,
    phoneNumber VARCHAR(20),
    cuisineType VARCHAR(50),
    deliveryTime INT,
    adminuserId INT, -- FK to users.id
    rating DOUBLE,
    isActive BOOLEAN DEFAULT TRUE,
    imagePath VARCHAR(255),
    FOREIGN KEY (adminuserId) REFERENCES users(userid)
);

-- MENU TABLE
DROP TABLE IF EXISTS menu;
CREATE TABLE menu (
    menuId INT PRIMARY KEY AUTO_INCREMENT,
    restaurantId INT,
    itemName VARCHAR(100),
    description TEXT,
    price DOUBLE,
    imagePath VARCHAR(255),
    isAvailable BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (restaurantId) REFERENCES restaurant(restaurantId)
);

-- ORDERS TABLE
DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
    orderId INT PRIMARY KEY AUTO_INCREMENT,
    userId INT,
    restaurantId INT,
    orderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    totalAmount DOUBLE,
    status VARCHAR(50) DEFAULT 'Pending',
    FOREIGN KEY (userId) REFERENCES users(userid),
    FOREIGN KEY (restaurantId) REFERENCES restaurant(restaurantId)
);

-- ORDER ITEMS TABLE
DROP TABLE IF EXISTS order_items;
CREATE TABLE order_items (
    itemId INT PRIMARY KEY AUTO_INCREMENT,
    orderId INT,
    menuId INT,
    quantity INT,
    price DOUBLE,
    FOREIGN KEY (orderId) REFERENCES orders(orderId),
    FOREIGN KEY (menuId) REFERENCES menu(menuId)
);

-- (OPTIONAL) CART TABLE
DROP TABLE IF EXISTS cart;
CREATE TABLE cart (
    cartId INT PRIMARY KEY AUTO_INCREMENT,
    userId INT,
    menuId INT,
    quantity INT,
    FOREIGN KEY (userId) REFERENCES users(userid),
    FOREIGN KEY (menuId) REFERENCES menu(menuId)
);
INSERT INTO users 
(name, username, password, email, phonenumber, address, role, created_date, last_login_date)
VALUES 
(
  ' Haarika',
  'haarika_admin',
  'admin@123',
  'rhaarika@quickbite.com',
  '9876543210',
  'MG Road, Bangalore',
  'admin',
  NOW(),
  NOW()
);
INSERT INTO users 
(name, username, password, email, phonenumber, address, role, created_date, last_login_date)
VALUES 
(
  'Siri',
  'siri_user',
  'user@123',
  'siri@gmail.com',
  '9876543211',
  'HSR Layout, Bangalore',
  'customer',
  NOW(),
  NOW()
);
INSERT INTO restaurant
(name, address, phoneNumber, cuisineType, deliveryTime, adminuserId, rating, isActive, imagePath)
VALUES
('Pizza Hut', 'BTM Layout, Bangalore', '8888888881', 'Pizza', 30, 2, 4.3, true, 'images/restaurant1.jpg'),
('Biryani House', 'Jayanagar, Bangalore', '8888888882', 'Biryani', 40, 2, 4.5, true, 'images/restaurant2.jpg'),
('Paneer Paradise', 'Indiranagar, Bangalore', '8888888883', 'North Indian', 28, 2, 4.3, true, 'images/restaurant3.jpg'),
('Dragon Express', 'HSR Layout, Bangalore', '8888888884', 'Chinese', 35, 2, 4.1, true, 'images/restaurant4.jpg'),
('Spice Garden', 'Whitefield, Bangalore', '9888888885', 'South Indian', 25, 2, 4.6, true, 'images/restaurant5.jpg'),
('Taco Fiesta', 'Koramangala, Bangalore', '8988888886', 'Mexican', 30, 2, 4.2, true, 'images/restaurant6.jpg'),
('Biryani Bazaar', 'Rajajinagar, Bangalore', '8587888887', 'Biryani', 35, 2, 4.4, true, 'images/restaurant7.jpg'),
('Sushi Central', 'Indiranagar, Bangalore', '8886588888', 'Japanese', 40, 2, 4.7, true, 'images/restaurant8.jpg');


select* FROM restaurant;
DESC restaurant;
select userid from users where username='haarika_admin';

UPDATE restaurant SET imagePath = 'images/restaurant1.jpg' WHERE restaurantId = 1;
UPDATE restaurant SET imagePath = 'images/restaurant2.jpg' WHERE restaurantId = 2;
UPDATE restaurant SET imagePath = 'images/restaurant3.jpg' WHERE restaurantId = 3;
UPDATE restaurant SET imagePath = 'images/restaurant4.jpg' WHERE restaurantId = 4;
UPDATE restaurant SET imagePath = 'images/restaurant5.jpg' WHERE restaurantId = 5;
UPDATE restaurant SET imagePath = 'images/restaurant6.jpg' WHERE restaurantId = 6;
UPDATE restaurant SET imagePath = 'images/restaurant7.jpg' WHERE restaurantId = 7;
UPDATE restaurant SET imagePath = 'images/restaurant8.jpg' WHERE restaurantId = 8;

INSERT INTO menu (itemName, description, price, imagePath, restaurantId) VALUES
-- 🍕 Pizza Hut (ID: 1)
('Cheese Pizza', 'Loaded cheese pizza', 250, 'images/cheesepizza.jpg', 1),
('Baked Pizza', 'Veg loaded baked pizza', 270, 'images/bakedpizza.jpg', 1),
('Chicken Puff', 'Crispy puff with chicken stuffing', 40, 'images/chickenpuff.jpg', 1),

-- 🍛 Biryani House (ID: 2)
('Chicken Biryani', 'Spicy Hyderabadi biryani', 200, 'images/biryani.jpg', 2),
('Paneer Biryani', 'Vegetarian biryani with paneer', 180, 'images/paneer.jpg', 2),
('Puri', 'Puris with potato curry', 50, 'images/puri.jpg', 2),

-- 🧀 Paneer Paradise (ID: 3)
('Paneer Butter Masala', 'Creamy paneer curry', 160, 'images/paneer.jpg', 3),
('Full Meals', 'Traditional North Indian thali', 120, 'images/fullmeals.jpg', 3),
('Dosa', 'Plain crispy dosa', 60, 'images/dosa.jpeg', 3),

-- 🥡 Dragon Express (ID: 4)
('Hakka Noodles', 'Spicy Chinese noodles', 120, 'images/chinesenoddles.jpg', 4),
('Chicken Body', 'Spicy chicken curry Chinese-style', 180, 'images/chickenbody.jpg', 4),
('French Fries', 'Crispy potato fries', 90, 'images/frenchfries.jpg', 4),

-- 🌶 Spice Garden (ID: 5)
('Andhra Chicken Curry', 'Spicy Andhra-style chicken curry', 180, 'images/andhrachickencurry.jpg', 5),
('Gongura Mutton', 'Tangy mutton curry with gongura', 220, 'images/gonguramutton.jpg', 5),
('Pesarattu', 'Green gram dosa', 55, 'images/pesarattu.jpg', 5),

-- 🌮 Taco Fiesta (ID: 6)
('Chicken Taco', 'Crispy taco with chicken filling', 130, 'images/burger.jpg', 6),
('Veg Taco', 'Taco filled with beans and cheese', 110, 'images/chickenpuff.jpg', 6),
('Fries', 'Mexican-seasoned fries', 80, 'images/frenchfries.jpg', 6),

-- 🍲 Biryani Bazaar (ID: 7)
('Mutton Biryani', 'Traditional Dum biryani', 220, 'images/biryani.jpg', 7),
('Egg Biryani', 'Boiled egg biryani with spices', 170, 'images/biryani.jpg', 7),
('Paneer Curry', 'Paneer curry with masala rice', 160, 'images/paneer.jpg', 7),

-- 🍣 Sushi Central (ID: 8)
('Sushi Roll', 'Classic Japanese sushi rolls', 300, 'images/burger.jpg', 8),
('Tempura', 'Deep-fried seafood and veggies', 280, 'images/pizza.jpeg', 8),
('Miso Soup', 'Japanese soup with tofu and seaweed', 150, 'images/fullmeals.jpg', 8);

SELECT * FROM menu WHERE restaurantId = 1;
ALTER TABLE menu ADD COLUMN rating DOUBLE DEFAULT 0.0;
UPDATE menu SET rating = 4.0 WHERE menuid=1;
SELECT * FROM menu WHERE restaurantId = 5;

UPDATE menu SET rating = 4.2 WHERE menuid = 1;
UPDATE menu SET rating = 3.8 WHERE menuid = 2;
UPDATE menu SET rating = 4.5 WHERE menuid = 3;
UPDATE menu SET rating = 4.0 WHERE menuid = 4;
UPDATE menu SET rating = 4.3 WHERE menuid = 5;
UPDATE menu SET rating = 2.9 WHERE menuid = 6;
UPDATE menu SET rating = 4.7 WHERE menuid = 7;
UPDATE menu SET rating = 4.6 WHERE menuid = 8;
UPDATE menu SET rating = 3.9 WHERE menuid = 9;
UPDATE menu SET rating = 3.7 WHERE menuid = 10;
UPDATE menu SET rating = 3.6 WHERE menuid = 11;
UPDATE menu SET rating = 3.7 WHERE menuid = 12;
UPDATE menu SET rating = 4.3 WHERE menuid = 13;
UPDATE menu SET rating = 4.9 WHERE menuid = 14;
UPDATE menu SET rating = 2.7 WHERE menuid = 15;
UPDATE menu SET rating = 5.6 WHERE menuid = 16;
UPDATE menu SET rating = 3.7 WHERE menuid = 17;
UPDATE menu SET rating = 4.6 WHERE menuid = 18;
UPDATE menu SET rating = 3.9 WHERE menuid = 19;
UPDATE menu SET rating = 4.0 WHERE menuid = 20;
UPDATE menu SET rating = 4.2 WHERE menuid = 21;
UPDATE menu SET rating = 4.3 WHERE menuid = 22;
UPDATE menu SET rating = 4.6 WHERE menuid = 23;
UPDATE menu SET rating = 4.7 WHERE menuid = 24;


-- ...add for other rows as needed

SELECT * FROM menu WHERE restaurantId = 7;

show triggers like 'menu';
SELECT * FROM menu WHERE rating=0 OR  rating IS NULL;
desc menu;

SELECT * FROM menu WHERE restaurantId = 8;

