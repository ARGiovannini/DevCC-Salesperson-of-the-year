-- Problem 1 & 2
-- 1. Using JOINs in a single query, combine data from all three tables (employees, products, sales) to view all sales with complete employee and product information in one table.
-- SELECT *
-- FROM sales
-- LEFT JOIN employees ON SalesPersonID = EmployeeID
-- LEFT JOIN products ON sales.ProductID = products.ProductID;

-- 2a. Create a View for the query you made in Problem 1 named "all_sales"
-- NOTE: You'll want to remove any duplicate columns to clean up your view!
-- CREATE VIEW all_sales AS
-- SELECT SalesID, CustomerID, sales.ProductID, Quantity, EmployeeID, CONCAT(FirstName, " ", LastName) AS EmployeeName, Name AS ProductName, price 
-- FROM sales
-- LEFT JOIN employees ON SalesPersonID = EmployeeID
-- LEFT JOIN products ON sales.ProductID = products.ProductID;

-- 2b. Test your View by selecting all rows and columns from the View
-- SELECT *
-- FROM all_sales;

-- Problem 3
-- Find the average sale amount for each sales person
-- SELECT EmployeeName, AVG(price * Quantity) AS Average_sale_amount
-- FROM all_sales
-- GROUP BY EmployeeName
-- ORDER BY Average_sale_amount DESC;

-- Problem 4
-- Find the top three sales persons by total sales
-- SELECT EmployeeName, count(EmployeeID) AS total_sales
-- FROM all_sales
-- GROUP BY EmployeeName
-- ORDER BY total_sales DESC;

-- Problem 5
-- Find the product that has the highest price
-- SELECT name, price
-- FROM products
-- ORDER BY price DESC
-- Limit 1;

-- Problem 6
-- Find the product that was sold the most times
-- SELECT ProductName, count(ProductName)
-- FROM all_sales
-- GROUP BY ProductName
-- ORDER BY count(ProductName) DESC
-- LIMIT 5;

-- Problem 7
-- Using a subquery, find all products that have a price higher than the average price for all products
-- SELECT *
-- FROM products
-- WHERE price > (SELECT AVG(price) FROM products)
-- ORDER BY price;

-- Problem 8
-- Find the customer who spent the most money in purchased products
SELECT CustomerID, SUM(Quantity * price) AS total_spent_by_customer
FROM all_sales
GROUP BY CustomerID
ORDER BY total_spent_by_customer DESC;

-- Problem 9
-- Find the total number of sales for each sales person
-- SELECT EmployeeID, COUNT(EmployeeID) AS total_number_of_sales
-- FROM all_sales
-- GROUP BY EmployeeID
-- ORDER BY total_number_of_sales DESC;

-- Problem 10
-- Find the sales person who sold the most to the customer you found in Problem 8
-- SELECT EmployeeID, COUNT(EmployeeID)
-- FROM all_sales
-- WHERE customerID = 18723
-- GROUP BY EmployeeID;