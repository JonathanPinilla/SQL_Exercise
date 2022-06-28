/**
This Script is to create, fill, and make a few operations for the first exercise
of SQL in reservoir level 2, Sofka University
**/
DROP DATABASE Shop;

CREATE DATABASE Shop;

USE Shop;

/*Creation of the tables of the DataBase*/

CREATE TABLE shopOwner(
    shopOwnerId INT PRIMARY KEY AUTO_INCREMENT,
    ownerName VARCHAR(20) NOT NULL UNIQUE,
    ownerPhone INT NOT NULL UNIQUE
);

CREATE TABLE shopSeller(
    shopSellerId INT PRIMARY KEY AUTO_INCREMENT,
    sellerName VARCHAR(20) NOT NULL UNIQUE,
    sellerPhone INT NOT NULL UNIQUE
);

CREATE TABLE TypeOfId(
	TypeId INT PRIMARY KEY AUTO_INCREMENT,
    typeName VARCHAR(2) NOT NULL UNIQUE
);

CREATE TABLE costumer(
    costumerId INT PRIMARY KEY,
    TypeId INT,
    costumerName VARCHAR(20) NOT NULL UNIQUE,
    costumerPhone INT NOT NULL UNIQUE,
    FOREIGN KEY (TypeId) REFERENCES TypeOfId(TypeId)
);

CREATE TABLE product(
    productId INT PRIMARY KEY AUTO_INCREMENT,
    productName VARCHAR(20) NOT NULL,
    productDescription VARCHAR(255) NOT NULL,
    price INT NOT NULL
);

CREATE TABLE productProvider(
    providerId INT PRIMARY KEY AUTO_INCREMENT,
    providerName VARCHAR(20) NOT NULL UNIQUE,
    productId INT,
    providerPhone INT NOT NULL UNIQUE,
    FOREIGN KEY(productId) REFERENCES product(productId)
);

CREATE TABLE invoice(
    invoiceId INT PRIMARY KEY AUTO_INCREMENT,
    costumerId INT,
    FOREIGN KEY(costumerId) REFERENCES costumer(costumerId)
);

CREATE TABLE invoiceOrder(
	OrderId INT PRIMARY KEY AUTO_INCREMENT,
    invoiceId INT,
    productId INT,
    deletedOrder BOOLEAN,
    FOREIGN KEY(invoiceId) REFERENCES invoice(invoiceId),
    FOREIGN KEY(productId) REFERENCES product(productId)
);

CREATE TABLE shop(
    storeId INT PRIMARY KEY AUTO_INCREMENT,
    storeAddress VARCHAR(255) NOT NULL UNIQUE,
    shopOwnerId INT,
    shopSellerId INT,
    providerId INT,
    FOREIGN KEY (shopOwnerId) REFERENCES shopOwner(shopOwnerId),
    FOREIGN KEY (shopSellerId) REFERENCES shopSeller(shopSellerId),
    FOREIGN KEY (providerId) REFERENCES productProvider(providerId)
);

/*Fill the tables with data*/

INSERT INTO shopOwner VALUES 
	ROW(0,'Jonathan', '123456789'), 
    ROW(0,'Nicolas', '123456790'), 
    ROW(0,'Mafe', '123456791'), 
    ROW(0,'Sandra', '123456792');

INSERT INTO shopseller VALUES
	ROW(0,'Daniel','223456789'), 
    ROW(0,'Maria','223456790'), 
    ROW(0,'Milena','223456791'), 
    ROW(0,'Fernanda','223456792');
    
INSERT INTO TypeOfId VALUES
	ROW(0, 'CC'),
    ROW(0, 'TI'),
    ROW(0, 'CE');
    
INSERT INTO costumer VALUES
	ROW(1070708876, 2,'Jonathan Pinilla','1234567'),
    ROW(20715645, 1,'Sandra Forero','1234568');

INSERT INTO product VALUES 
	ROW(0, 'Mintaka', 'Mechanical Keyboard RGB', 200000), 
	ROW(0, 'Logitech g203', 'Mouse Gamer', 90000), 
    ROW(0, 'Soundcore Life Q20', 'Wireless Headphones', 170000),
	ROW(0, 'HP M22F', 'Full HD Monitor', 750000),
    ROW(0, 'K57', 'Mechanical Keyboard RGB', 200000);
    
INSERT INTO productProvider VALUES
	ROW(0, 'VSG', 1, 123456),
    ROW(0, 'Logitech', 2, 123457),
    ROW(0, 'Anker', 3, 123458),
    ROW(0, 'HP', 4, 123459),
    ROW(0, 'MercadoLibre', 5, 123460);
    
INSERT INTO invoice VALUES
	ROW(0, 1070708876),
    ROW(0, 20715645),
    ROW(0, 1070708876),
    ROW(0, 1070708876);
    
INSERT INTO invoiceOrder VALUES
	ROW(0, 1, 1, NULL),
    ROW(0, 1, 2, NULL),
    ROW(0, 1, 1, NULL),
    ROW(0, 2, 3, NULL),
    ROW(0, 2, 3, NULL),
    ROW(0, 2, 3, NULL),
    ROW(0, 3, 1, NULL),
    ROW(0, 4, 2, NULL),
    ROW(0, 4, 4, NULL),
    ROW(0, 4, 4, NULL);
    
INSERT INTO shop VALUES
	ROW(0, '4th st Cajica', 2, 1, 1);
    
/*Logical Deletes*/
UPDATE invoiceOrder
SET deletedOrder = true
WHERE invoiceId = 1;

UPDATE invoiceOrder
SET deletedOrder = true
WHERE invoiceId = 2;

/*Physical Deletes*/
DELETE FROM invoiceOrder
WHERE invoiceId = 2;
DELETE FROM invoice
WHERE invoiceId = 2;

DELETE FROM invoiceOrder
WHERE invoiceId = 1;
DELETE FROM invoice
WHERE invoiceId = 1;

/*Modifications*/
UPDATE product
SET productName = 'K57'
where productId = 1;
UPDATE productProvider
SET providerName = 'Corsair'
where productId = 1;

UPDATE product
SET productName = 'MM720'
where productId = 2;
UPDATE productProvider
SET providerName = 'Cooler Master'
where productId = 2;

UPDATE product
SET productName = 'A10'
where productId = 3;
UPDATE productProvider
SET providerName = 'Astro'
where productId = 3;