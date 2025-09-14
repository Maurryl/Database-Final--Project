
-- Question 1: Build a Complete Database Management System
-- Use Case: E-commerce Store


-- 1. Create the database
CREATE DATABASE IF NOT EXISTS e_commerce_db;
USE e_commerce_db;

-- --------------------------------------------------------
-- Table Definitions with Constraints
-- --------------------------------------------------------

-- 2. Create the Customers table
-- This table stores core customer data.
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. Create the CustomerProfiles table (One-to-One relationship)
-- This table stores additional, optional customer information.
-- The customer_id is both a PRIMARY KEY and a FOREIGN KEY,
-- ensuring each customer has at most one profile.
CREATE TABLE CustomerProfiles (
    customer_id INT PRIMARY KEY,
    address VARCHAR(255),
    city VARCHAR(100),
    country VARCHAR(100),
    phone_number VARCHAR(20) UNIQUE,
    birth_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- 4. Create the Products table
-- This table stores information about the items for sale.
CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    CHECK (price >= 0),
    CHECK (stock >= 0)
);

-- 5. Create the Orders table (One-to-Many relationship)
-- This table stores information about each customer's order.
-- The 'customer_id' column is a FOREIGN KEY, linking each order back to a customer.
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('Pending', 'Processing', 'Shipped', 'Delivered', 'Cancelled') DEFAULT 'Pending',
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

-- 6. Create the OrderItems table (Many-to-Many relationship)
-- This is a junction table that connects Orders and Products.
-- It resolves the Many-to-Many relationship.
-- The PRIMARY KEY is a composite key of both foreign keys.
CREATE TABLE OrderItems (
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CHECK (quantity > 0)
);
