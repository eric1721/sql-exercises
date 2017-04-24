--Write a query to return all category names with their descriptions from the Categories table.
--Select [CategoryName] , [description]
--From Categories

--Write a query to return the contact name, customer id, company name and city name of all Customers in London
--Select [ContactName], [customerID], [companyname], [city]
--From Customers Where city = 'London'

--Write a query to return all available columns in the Suppliers tables for the marketing managers and sales representatives that have a FAX number
--Select  [SupplierID],[CompanyName],[ContactName],[ContactTitle],[Address],[City],[Region],[PostalCode],[Country],[Phone],[Fax],[HomePage]
--From Suppliers Where (Contacttitle = 'marketing manager' OR Contacttitle = 'sales representative') and not fax = 'NULL'

--Write a query to return a list of customer id's from the Orders table with required dates between Jan 1, 1997 and Dec 31, 1997 and with freight under 100 units.
--Select [CustomerId]
--From [orders] Where ([requireddate] between 'Jan 1, 1997' AND 'Dec 31,1997') AND [freight] < 100

--Write a query to return a list of company names and contact names of all customers from Mexico, Sweden and Germany.
--Select [CompanyName] , [ContactName]
--From [Customers] Where [Country] = 'Mexico' or  [country] = 'Sweeden' or  [Country] = 'Germany'

--Write a query to return a count of the number of discontinued products in the Products table.
--Select count(*) [Discontinued]
--From [Products]
--Where [discontinued] = 1


--Write a query to return a list of category names and descriptions of all categories beginning with 'Co' from the Categories table.
--Select [categoryname] , [description]
--From [categories]
--Where [categoryname] Like 'co%'

--Write a query to return all the company names, city, country and postal code from the Suppliers table with the word 'rue' in their address. The list should ordered alphabetically by company name.
--Select [companyname], [city], [country], [postalcode]
--From [suppliers]
--Where [address] like '%rue%'
--Order by [companyname] ASC

--Write a query to return the product id and the quantity ordered for each product labelled as 'Quantity Purchased' in the Order Details table ordered by the Quantity Purchased in descending order.
--Select [productid], [quantity] AS 'Quantity Purchased'
--From [order details]
--Order by [quantity] DESC

--Write a query to return the company name, address, city, postal code and country of all customers with orders that shipped using Speedy Express, along with the date that the order was made.
--Select Customers.[CompanyName], [address], [city], [postalcode], [country], [orderdate]
--From [customers] join [orders] on Customers.[customerid] = Orders.[customerid] join [shippers] on Orders.[ShipVia] = Shippers.[ShipperId]
--Where Shippers.[CompanyName] = 'Speedy Express'

--Write a query to return a list of Suppliers containing company name, contact name, contact title and region description.
--Select [CompanyName], [contactname], [contacttitle], [region]
--From [suppliers]

--Write a query to return all product names from the Products table that are condiments.
--Select [productname]  
--From [products] 
--Where [categoryid] = 2

--Write a query to return a list of customer names who have no orders in the Orders table.
--select [Contactname] 
--from [customers] 
--where [customerid] not in (select [customerid] from orders)

--Write a query to add a shipper named 'Amazon' to the Shippers table using SQL.
--Insert into [shippers] (companyname)
--values ('Amazon')


--Write a query to change the company name from 'Amazon' to 'Amazon Prime Shipping' in the Shippers table using SQL.
--Update [shippers]
--Set [companyname] = 'Amazon Prime Shipping'
--Where [companyname] = 'Amazon'

--Write a query to return a complete list of company names from the Shippers table. Include freight totals rounded to the nearest whole number for each shipper from the Orders table for those shippers with orders.
--select [CompanyName], ROUND(SUM(Freight), 0) as 'Freight'
--From [dbo].[Shippers], [dbo].[Orders]
--group by [CompanyName]


--Write a query to return all employee first and last names from the Employees table by combining the 2 columns aliased as 'DisplayName'. The combined format should be 'LastName, FirstName'.
--Select Concat([LastName],  ', ',  [FirstName]) As 'DisplayName'    
--From [employees]

--Write a query to add yourself to the Customers table with an order for 'Grandma's Boysenberry Spread'.
--Insert into [customers] ([customerID],[companyname])
--values ('eric','E-money')
--insert into [orders] ([customerid])  
--values ('eric')
--insert into [order details] ([orderid],[productid])
--Values ((select [OrderID] from [Orders] where [CustomerID] ='eric'),(Select [productid] from [products] Where [productname] = 'Grandma''s Boysenberry Spread'))


--Write a query to remove yourself and your order from the database.
--delete from[Order Details] where [OrderID] =(select [OrderID] from [Orders] where [CustomerID] ='eric');
--delete from [Orders] where [CompanyName] ='E-money';
--delete [Customers] where [CustomerID] ='eric'



--Write a query to return a list of products from the Products table along with the total units in stock for each product. Include only products with TotalUnits greater than 100.
--Select [productname], [unitsInStock]
--From [Products]
--Where [unitsInstock] > 100