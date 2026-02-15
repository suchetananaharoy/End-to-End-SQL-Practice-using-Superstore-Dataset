CREATE DATABASE SuperstoreDB;
GO
USE SuperstoreDB;

select * from Storesales

--Total Sales & Total Profit
select 
	SUM(Sales) as total_sales,
	SUM(Profit) as total_profit
from Storesales


--Total Orders per Region
select 
	region, COUNT(Distinct Order_ID) as total_orders
from Storesales
group by region


--Top 10 Highest Sales Orders 
select Top 10 * 
from Storesales
order by Sales DESC


--Total Sales by Category
select Category, SUM(Sales) as total_sales
from Storesales
group by Category 
order by total_sales DESC

--Find Loss-Making Products 

select * from Storesales 

select Customer_Name, Count(*) as Total_Customer
from Storesales
group by Customer_Name

select 
	CAST(Product_Name as nvarchar(255)) as Product_Name,
	SUM(Profit) as Total_profit
from Storesales
group by CAST(Product_Name as nvarchar(255));


--Find Loss-Making Products
select * from Storesales 

select CAST(Product_Name AS NVARCHAR(255)) as Product_Name
from Storesales 
group by CAST(Product_Name AS NVARCHAR(255))


select * from Storesales

--Sales by Region with Manager Name (JOIN)
select 
	Region, 
	Customer_Name,
	SUM(Sales) as total_sales
from Storesales
group by Region, Customer_Name


-- Products Selling Above Average Sales
SELECT 
    CAST(Product_Name AS NVARCHAR(255)) AS Product_Name,
    SUM(Sales) AS total_sales
FROM Storesales
GROUP BY CAST(Product_Name AS NVARCHAR(255))
HAVING SUM(Sales) > 
    (SELECT AVG(Sales) FROM Storesales);


select * from Storesales

--Top 5 Products by Total Sales
select Top 5
	CAST(Product_Name AS NVARCHAR(255)) AS Product_Name,
	SUM(Sales) as Total_sales
from Storesales
group by CAST(Product_Name AS NVARCHAR(255))
order by Total_sales DESC 


--Average Discount by Sub-Category

select Category, Sub_Category, Round(AVG(Discount), 2)*100 as avg_discount
from Storesales
group by Category, Sub_Category


--Customers with Total Sales Above Average Sales
select Customer_Name,  SUM(Sales) as total_sales
from Storesales
group by Customer_Name
Having SUM(Sales) > (Select AVG(Sales) as Avg_sales)


--Sales by Region and Market

select Region, Market, SUM(Sales) as total_sales
from Storesales
group by Region, Market


--Orders with Loss (Negative Profit)
select Order_ID, SUM(Sales) as total_sales
from Storesales
group by Order_ID
Having SUM(Profit) < 0 


--Highest Shipping Cost per Ship Mode
select Ship_Mode, SUM(Shipping_Cost) as total_shipping_cost
from Storesales
group by Ship_Mode
order by total_shipping_cost DESC

--Monthly Sales Trend (Year & Month) 
select 
	YEAR(Order_Date) as Order_Year,
	DATENAME(Month, Order_Date) as Order_Month,
	SUM(Sales) as total_sales
from Storesales
group by 
	YEAR(Order_Date),
	DATENAME(Month, Order_Date)
order by Order_Year, Order_Month


--Rank Products by Profit (Window Function)

Select 
	Cast(Product_Name as nvarchar(255)) as product_name,
	SUM(Profit) as total_profit,
	RANK() Over (Order by SUM(Profit) DESC) as profit_rank
FROM Storesales
group by
	Cast(Product_Name as nvarchar(255)) 


--High-Priority Orders with Sales > 500
select Order_ID, Order_Priority,
	SUM(Sales) as Total_Sales
FROM Storesales
group by 
	Order_ID, Order_Priority

--Find customers from the same city 


SELECT 
    a.Customer_Name AS Customer1,
    b.Customer_Name AS Customer2,
    a.City
FROM Storesales a
JOIN Storesales b
    ON a.City = b.City
    AND a.Customer_Name <> b.Customer_Name;



