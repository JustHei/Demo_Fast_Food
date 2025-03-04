﻿--Create Database fastfood
use fastfood

CREATE TABLE role (
    role_id int PRIMARY KEY IDENTITY(1,1),
    role_name VARCHAR(100) NOT NULL
)
INSERT INTO role (role_name) VALUES
( 'Admin'),
( 'Customer');


-- Users table
CREATE TABLE Users (
    ID INT PRIMARY KEY IDENTITY(1,1),
    username NVARCHAR(255),
    Password NVARCHAR(255),
    role_id INT
	FOREIGN KEY (role_id) REFERENCES role(role_Id)
);

-- Insert sample data into Users table
INSERT INTO Users ( username, Password, role_id)
VALUES 
    ('admin', '12345', 1),
	('Nguyen Van A', '12345', 2),
    ('Kim Van C', '12345', 2),
	('Bob', '12345', 2);


-- Categories table
CREATE TABLE Categories (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(255)
);

-- Insert sample data into Categories table
INSERT INTO Categories (Name)
VALUES 
    ('Hambuger'),
    ('Bami'),
    ('Chicken'),
    ('Drink');

-- Products table
CREATE TABLE Products (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(255),
    Description NVARCHAR(MAX),
    Price INT,
    Image NVARCHAR(MAX),
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES Categories(ID),
);

-- Insert sample data into Products table
INSERT INTO Products (Name, Description, Price, Image, CategoryID)
VALUES 

    ('hambuger 1', 'Description of Hambuger 1', 70000, 'img/product/1.jpg', 1),
	('bami 1', 'Description of Bami 1', 30000, 'img/product/2.jpg', 2),
    ('hambuger 2', 'Description of Hambuger 2', 55000, 'img/product/3.jpg', 1),
    ('bami 2', 'Description of WBami 2', 40000, 'img/product/4.jpg',  2),
	('kfc', 'Description of kfc', 50000, 'img/product/5.jpg', 3),
	('kfc pro max', 'Description of kfc pro max', 85000, 'img/product/6.jpg', 3),
	('hambuger 3', 'Description of hambuger 3', 50000, 'img/product/7.jpg', 1),
	('spite', 'Description of Spite', 15000, 'img/product/8.jpg', 4),
    ('hambuger 4', 'Description of hambuger 4', 45000, 'img/product/9.jpg', 1),
	('cocacola', 'Description of cocacola', 15000, 'img/product/10.jpg', 4),
    ('bami 3', 'Description of bami 3', 35000, 'img/product/11.jpg', 2),
	('bami 4', 'Description of bami 4', 45000, 'img/product/12.jpg', 2),
    ('bami 5', 'Description of bami 5', 40000, 'img/product/13.jpg', 2),
    ('chicken royal ', 'Description of chicken royal', 999999, 'img/product/14.jpg', 3),
	('hambuger 5', 'Description of hambuger 5', 55000, 'img/product/15.jpg',  1),
	('fanta', 'Description of fanta', 15000, 'img/product/16.jpg',  4),
    ('fried chicken', 'Description of fried chicken', 70000, 'img/product/17.jpg',  3),
	('pepsi', 'Description of pepsi', 15000, 'img/product/18.jpg',  4),
    ('hambuger 6', 'Description of hambuger 6', 50000, 'img/product/19.jpg',  1);
	

Create table OrderStatus(
	orderstatus_id int PRIMARY KEY IDENTITY(1,1),
	status_name nvarchar(20)
);

insert into OrderStatus (status_name)
VALUES
	('wait'),
	('process'),
	('done');

-- Orders table
CREATE TABLE Orders (
    ID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT,
	Name NVARCHAR(255) ,
phonenumber nvarchar(20),
    Address NVARCHAR(255),
    OrderDate DATE,
    TotalAmount INT DEFAULT 0,
	StatusID int
    FOREIGN KEY (UserID) REFERENCES Users(ID),
	FOREIGN KEY (StatusID) REFERENCES OrderStatus(orderstatus_id)
);


-- OrderItems table
CREATE TABLE OrderItems (
    ID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(ID),
    FOREIGN KEY (ProductID) REFERENCES Products(ID)
);

-- Chèn một bản ghi vào bảng Orders
INSERT INTO Orders (UserID, Name, phonenumber, Address, OrderDate, TotalAmount, StatusID)
VALUES
(3, 'vit con cute', '037373737', 'Boy pho HaNoi', '2023-10-20', 115000, 3),
 (2, 'meo con cute', '037373737', 'Hot gril NamDing', '2023-10-30', 65000, 2),
 (2, 'ga con cute', '037373737', 'Trap boy FPT', '2023-11-1', 65000, 1),
 (3, 'cho con cute', '037373737', 'Sad girl HaiPhong', '2023-10-20', 160000, 2);


-- Chèn một bản ghi vào bảng OrderItems
INSERT INTO OrderItems (OrderID, ProductID, Quantity)
VALUES 
(1,3,1),
(1,2,2),
(2,18,1),
(2,19,1),
(3,5,1),
(3,8,1),
(4,11,1),
(4,12,1),
(4,13,2);