CREATE TABLE Products(
    ID INT PRIMARY KEY,
    Name NVARCHAR(255) not null,
    Description NVARCHAR(255) not null,
    Unit NVARCHAR(10) not null check(Unit in(N'Chiếc',N'Sản phẩm',N'Bộ')),
    Price DECIMAL(10,4) not null check(Price >=0),
    Quantity INT check(Quantity >=1) DEFAULT 1,
);
CREATE TABLE Customers(
    ID INT PRIMARY KEY,
    Name nVARCHAR(255) not null,
    Address NVARCHAR(255) not null,
    Phone VARCHAR(10) not null UNIQUE
);
CREATE TABLE Oders(
    Code int PRIMARY KEY,
    Date DATE not null check(Date <= getdate()),
    CustomerID INT not null FOREIGN KEY REFERENCES Customers(ID)

);
CREATE TABLE CustomersProducts(
    CustomerID INT not null FOREIGN KEY REFERENCES Customers(ID),
    ProductID INT not null FOREIGN KEY REFERENCES Products(ID)
);
