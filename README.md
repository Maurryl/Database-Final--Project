E-commerce Database System
Project Description

This project contains a relational database schema for a simple e-commerce store. It is designed to demonstrate key database principles, including table creation, primary and foreign key constraints, and various types of relationships.

The database is built using MySQL and is ready to be implemented.
Database Schema

The schema consists of five main tables that model a basic e-commerce system:

    Customers: Stores customer information.

    CustomerProfiles: Linked to Customers in a One-to-One relationship to store extended profile information.

    Products: Stores details about all items available for purchase.

    Orders: Stores information about each order placed by a customer. This table has a One-to-Many relationship with Customers.

    OrderItems: A junction table that resolves the Many-to-Many relationship between Orders and Products. It stores information about which products are in each order and in what quantity.

How to Run the Project

To run this project, you will need a MySQL database system installed on your local machine.

    Open your terminal or command prompt.

    Navigate to the directory where you have saved the e-commerce.sql file.

    Execute the SQL file using the following command. This command will create the database and all its tables automatically.

mysql -u [username] -p < e-commerce.sql

    Replace [username] with your MySQL username (e.g., root).

    The -p flag will prompt you to enter your password.

Verification

To confirm that the database and tables have been created successfully, you can log in to your MySQL command-line client and run the following commands:

-- Log in to MySQL
mysql -u [username] -p

-- Show all databases to confirm 'e_commerce_db' exists
SHOW DATABASES;

-- Select the newly created database
USE e_commerce_db;

-- Show the tables to confirm they were created
SHOW TABLES;

If the SHOW TABLES; command lists all the tables (Customers, CustomerProfiles, Products, Orders, OrderItems), your project is set up and ready to go.
