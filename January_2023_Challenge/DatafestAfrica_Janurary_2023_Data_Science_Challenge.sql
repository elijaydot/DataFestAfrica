/*
DatafestAfrica Janurary 2023 Data Science Challenge

Instructions:
Dataset can be accessed via: https://www.w3schools.com/SQL/TRYSQL.ASP?FILENAME=TRYSQL_SELECT_ALL 
Please use queries to answer the following questions. Paste your queries along with your final numerical answers below.
*/

/*
Database Description:
in the database for this challenge, there are 8 tables with the following Relation Schema:

CUSTOMERS (CustomerID, CustomerName, ContactName, Address, City, PostalCode, Country)
CATEGORIES (CategoryID, CategoryName, Description)
EMPLOYEES (Eml=ployeeID, LastName, FirstName, BirthDate, Photo, Notes)
ORDERDETAILS (OrderdetailID, OrderID, ProductID, quantity)
ORDERS (OrderID, CustomerID, EmployeeID, OrderDate, ShipperID)
Products(ProductID, ProductName, SupplierID, CategoryID, Unit,Price)
Shippers (ShipperID, ShipperName, Phone)
Suppliers(SupplierID, SupplierName, ContactName, Address, City, PostalCOde, Country, Phone)

*/
-- Question 1: How many orders were shipped by Speedy Express in total?  Answer = 54

        SELECT 
            COUNT(*) AS TotalOrders
        FROM 
            Orders ord
            INNER JOIN Shippers shp ON ord.ShipperID = shp.ShipperID
        WHERE 
            shp.ShipperName = 'Speedy Express' 


-- Question 2: What is the last name of the employee with the most orders?  Answer = Peacock
        SELECT 
            LastName, 
            COUNT(EmployeeID) AS OrderCount 
        FROM 
            Employees 
            INNER JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID 
        GROUP BY 
            LastName 
        ORDER BY 
            OrderCount DESC 
        LIMIT 1


-- Question 3: What product was ordered the most by customers in Germany? Answer = Gorgonzola Telino
        SELECT 
            prd.ProductName, 
            COUNT(ProductName) AS Quantity 
        FROM 
            Orders ord
            INNER JOIN Orderdetails odd ON odd.orderID = ord.OrderID
            INNER JOIN Products prd ON odd.ProductID = prd.ProductID 
            INNER JOIN Customers cx ON ord.CustomerID = cx.CustomerID 
        WHERE 
            cx.Country = 'Germany' 
        GROUP BY 
            prd.ProductName 
        ORDER BY 
            Quantity DESC 
        LIMIT 1
