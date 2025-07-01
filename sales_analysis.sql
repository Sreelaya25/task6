CREATE DATABASE sales_analysis;
USE sales_analysis;

CREATE TABLE online_sales (
    InvoiceNo VARCHAR(20),
    StockCode VARCHAR(20),
    Description TEXT,
    Quantity INT,
    InvoiceDate DATETIME,
    UnitPrice DECIMAL(10, 2),
    CustomerID INT,
    Country VARCHAR(50),
    Discount DECIMAL(10, 4),
    PaymentMethod VARCHAR(30),
    ShippingCost DECIMAL(10, 2),
    Category VARCHAR(50),
    SalesChannel VARCHAR(30),
    ReturnStatus VARCHAR(30),
    ShipmentProvider VARCHAR(30),
    WarehouseLocation VARCHAR(50),
    OrderPriority VARCHAR(20)
);
ALTER TABLE online_sales MODIFY CustomerID INT NULL;
USE sales_analysis;

ALTER TABLE online_sales 
MODIFY COLUMN CustomerID INT NULL,
MODIFY COLUMN ShippingCost DECIMAL(10,2) NULL,
MODIFY COLUMN Discount DECIMAL(10,4) NULL;
SELECT * FROM online_sales LIMIT 10;
SELECT 
    YEAR(InvoiceDate) AS Year,
    MONTH(InvoiceDate) AS Month,
    SUM(Quantity * UnitPrice * (1 - Discount)) AS TotalRevenue,
    COUNT(DISTINCT InvoiceNo) AS TotalOrders
FROM online_sales
GROUP BY YEAR(InvoiceDate), MONTH(InvoiceDate)
ORDER BY Year, Month;
SELECT 
    YEAR(InvoiceDate) AS Year,
    MONTH(InvoiceDate) AS Month,
    SUM(Quantity * UnitPrice * (1 - Discount)) AS TotalRevenue
FROM online_sales
GROUP BY YEAR(InvoiceDate), MONTH(InvoiceDate)
ORDER BY TotalRevenue DESC
LIMIT 3;


