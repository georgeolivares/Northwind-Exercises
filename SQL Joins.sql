
--ORDERDETAILS TABLE
--2,155 rows on OrderDetails table
SELECT COUNT(dbo.OrderDetails.ProductID) FROM OrderDetails
GO

--INNER JOIN (>2 Tables)
--2,155 rows out of Inner Join - In this case all the rows had a match, but the rows could have been less
SELECT OrderDetails.ProductID, OrderDetails.UnitPrice, 
Orders.OrderID AS "OrderID From Orders", Products.ProductName FROM OrderDetails
INNER JOIN Orders ON OrderDetails.OrderID = Orders.OrderID
INNER JOIN Products ON OrderDetails.ProductID = Products.ProductID
GO


--ORDERS TABLE
--830 rows in Orders table
SELECT COUNT(dbo.Orders.OrderID) FROM Orders
GO

--830 rows out of Left Join
SELECT Orders.OrderID, Customers.CustomerID FROM Orders
LEFT JOIN Customers ON Orders.CustomerID = Customers.CustomerID
GO



--CUSTOMERS TABLE
--91 rows in Customers table
SELECT COUNT(dbo.Customers.CustomerID) FROM Customers
GO

--832 rows out of Left Join (Customers table = , Orders table = 830 rows)
SELECT Customers.CustomerID, Orders.OrderID FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GO

--91 rows out of distinct count from previous select query. This means we got all the rows from the Customers table.
WITH DummyTable 
	AS (SELECT Customers.CustomerID AS CustomersChidos, Orders.OrderID FROM Customers
			LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID)
SELECT DISTINCT CustomersChidos FROM DummyTable
GO







--Left Join with 3 different customers. Brings all the orders related to these customers.
WITH DummyCustomers AS (SELECT TOP 3 * FROM Customers)
SELECT DummyCustomers.CustomerID, Orders.OrderID FROM DummyCustomers
LEFT JOIN Orders ON DummyCustomers.CustomerID = Orders.CustomerID
GO


--LEFT JOIN TWO DUMMY TABLES (WE GET NULL RESULTS BECAUSE WITH LEFT WE RETURN ALL VALUES 
--								FROM LEFT TABLE EVEN IF THERE ARE NO RESULTS RELATED IN THE OTHER TABLE)
WITH DummyCustomers AS (SELECT TOP 3 * FROM Customers),
DummyOrders AS (SELECT TOP 3 * FROM Orders)
SELECT DummyCustomers.CustomerID, DummyOrders.OrderID from DummyCustomers
LEFT JOIN DummyOrders ON DummyCustomers.CustomerID = DummyOrders.CustomerID
GO



-- FULL JOIN (BRINGS ALL THE VALUES FROM BOTH TABLES, RELATED OR NOT)
WITH DummyCustomers AS (SELECT TOP 30 * FROM Customers),
DummyOrders AS (SELECT TOP 30 * FROM Orders)
SELECT DummyCustomers.CustomerID, DummyOrders.OrderID from DummyCustomers
FULL JOIN DummyOrders ON DummyCustomers.CustomerID = DummyOrders.CustomerID
GO





