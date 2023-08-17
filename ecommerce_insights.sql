USE ECommerceDatabase;

-- Sales Analysis by Month
SELECT DATE_FORMAT(OrderDate, '%Y-%m') AS Month,
       COUNT(DISTINCT TransactionID) AS TotalTransactions,
       SUM(Quantity) AS TotalItemsSold,
       SUM(Price * Quantity) AS TotalRevenue
FROM SalesTransactions
GROUP BY Month
ORDER BY Month;

-- Top Selling Products
SELECT p.ProductName,
       p.Category,
       SUM(st.Quantity) AS TotalItemsSold,
       SUM(st.Price * st.Quantity) AS TotalRevenue
FROM Products p
JOIN SalesTransactions st ON p.ProductID = st.ProductID
GROUP BY p.ProductName, p.Category
ORDER BY TotalRevenue DESC
LIMIT 10;

-- Customer Analysis
SELECT c.CustomerID,
       MAX(c.FirstName) AS FirstName,
       MAX(c.LastName) AS LastName,
       COUNT(st.TransactionID) AS TotalTransactions,
       SUM(st.Quantity) AS TotalItemsPurchased,
       SUM(st.Price * st.Quantity) AS TotalSpending
FROM Customers c
JOIN SalesTransactions st ON c.CustomerID = st.CustomerID
GROUP BY c.CustomerID
ORDER BY TotalSpending DESC
LIMIT 10;
