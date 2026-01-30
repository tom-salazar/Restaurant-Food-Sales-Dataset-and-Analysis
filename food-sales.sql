---- TABLE -----
CREATE TABLE Food_Sales (
	Order_ID INT, Sales_Date DATE, Customer_ID VARCHAR(20),
	Food_Item VARCHAR(30), Category VARCHAR(30), Quantity INT,
	Unit_Price NUMERIC, Total_Sales NUMERIC, Payment_Method VARCHAR(30),
	City VARCHAR(120)
);
----------------------

--- Return all 1,200 rows in ascending order ----
SELECT * FROM Food_Sales ORDER BY Sales_Date ASC; 
-------------------------------------------------

---- Display Food Categories --------------
SELECT DISTINCT(Category) FROM Food_Sales;
---------------------------------------------

--------------- Total Sales per Day -----------------
SELECT Sales_Date, SUM(Total_Sales) AS Sales_per_Day FROM Food_Sales
GROUP BY Sales_Date ORDER BY Sales_Date ASC;
--------------------------------------------------------

---------- Food Sold per Day -------------------------
SELECT Sales_Date, SUM(Quantity) AS Food_Sold_per_Day FROM Food_Sales
GROUP BY Sales_Date ORDER BY Sales_Date ASC;
-------------------------------------------------------

---------- Highest Food Sold in one day ----------------
SELECT MAX(max_sold) AS Pieces_Sold FROM (
	SELECT SUM(Quantity) AS max_sold FROM Food_Sales GROUP BY Sales_Date );
-----------------------------------------------------------

---------- Lowest Food Sold in one day ---------------------
SELECT MIN(lowest_sold) AS Minimum_Pieces_Sold FROM (
	SELECT SUM(Quantity) AS lowest_sold FROM Food_Sales GROUP BY Sales_Date );
------------------------------------------------------------

----------------------------- Best Seller Food from January 1 to April 1, 2025 ----------------
SELECT Food_Item, COUNT(*) AS Best_Seller FROM Food_Sales GROUP BY Food_Item;
-----------------------------------------------------------------------------------------------

------------------------- Customers City and Total of Customers from a City --------------
SELECT City, COUNT(*) AS Customers_City FROM Food_Sales GROUP BY City;
-------------------------------------------------------------------------------------------
