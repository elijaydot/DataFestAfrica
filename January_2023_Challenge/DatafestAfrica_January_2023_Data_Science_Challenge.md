# DatafestAfrica January 2023 Data Science Challenge

## Database Description

This challenge uses a database with 8 tables and the following relation schema:

- **CUSTOMERS** (CustomerID, CustomerName, ContactName, Address, City, PostalCode, Country)
- **CATEGORIES** (CategoryID, CategoryName, Description)
- **EMPLOYEES** (EmployeeID, LastName, FirstName, BirthDate, Photo, Notes)
- **ORDERDETAILS** (OrderdetailID, OrderID, ProductID, quantity)
- **ORDERS** (OrderID, CustomerID, EmployeeID, OrderDate, ShipperID)
- **PRODUCTS** (ProductID, ProductName, SupplierID, CategoryID, Unit, Price)
- **SHIPPERS** (ShipperID, ShipperName, Phone)
- **SUPPLIERS** (SupplierID, SupplierName, ContactName, Address, City, PostalCode, Country, Phone)

## Instructions

The dataset for this challenge can be accessed via the following link: https://www.w3schools.com/SQL/TRYSQL.ASP?FILENAME=TRYSQL_SELECT_ALL 

## Questions

1. How many orders were shipped by Speedy Express in total? 
   - Answer: 54
   ```sql
   SELECT 
        COUNT(*) AS TotalOrders
   FROM 
        Orders ord
   INNER JOIN 
        Shippers shp ON ord.ShipperID = shp.ShipperID
   WHERE 
        shp.ShipperName = 'Speedy Express' 
     ```

2. What is the last name of the employee with the most orders?  
   - Answer: Peacock

   ```sql
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
  
   ```
  
3. What product was ordered the most by customers in Germany? 
   - Answer: Gorgonzola Telino

   ```sql
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
   ```