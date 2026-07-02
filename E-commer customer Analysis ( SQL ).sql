select * from ecommerce_customer_data

---Data Cleaning---
UPDATE ecommerce_customer_data
SET Returns = 0
WHERE Returns IS NULL;

---1.Count total records
SELECT COUNT(*) AS Total_Records
FROM ecommerce_customer_data

---2.Find duplicate Customer IDs
SELECT Customer_ID, COUNT(*)
FROM ecommerce_customer_data
GROUP BY Customer_ID
HAVING COUNT(*) > 1;

---3.Find unique product categories
SELECT DISTINCT Product_Category
FROM ecommerce_customer_data

---4.Count unique customers
SELECT COUNT(DISTINCT Customer_ID)
FROM ecommerce_customer_data

---5.Maximum Product Price
SELECT MAX(Product_Price)
FROM ecommerce_customer_data

---6.Minimum Product Price
SELECT MIN(Product_Price)
FROM ecommerce_customer_data

---7.Average Product Price
SELECT AVG(Product_Price)
FROM ecommerce_customer_data

---8. Highest Purchase Amount
SELECT MAX(Total_Purchase_Amount)
FROM ecommerce_customer_data

---9.Lowest Purchase Amount
SELECT MIN(Total_Purchase_Amount)
FROM ecommerce_customer_data

---10.Total Revenue
SELECT SUM(Total_Purchase_Amount) AS Total_Revenue
from ecommerce_customer_data

---11.Revenue by Product Category
SELECT Product_Category,SUM(Total_Purchase_Amount) AS Revenue
FROM ecommerce_customer_data
GROUP BY Product_Category
ORDER BY Revenue DESC;

---12.Average Revenue by Category
SELECT Product_Category,AVG(Total_Purchase_Amount)
FROM ecommerce_customer_data
GROUP BY Product_Category;

---13.Quantity Sold by Category
SELECT Product_Category,SUM(Quantity)
FROM ecommerce_customer_data
GROUP BY Product_Category;

---14.Revenue by Gender
SELECT Gender,SUM(Total_Purchase_Amount)
FROM ecommerce_customer_data
GROUP BY Gender;

---15.Average Purchase by Gender
SELECT Gender,AVG(Total_Purchase_Amount)
FROM ecommerce_customer_data
GROUP BY Gender;

---16.Customer Count by Gender
SELECT Gender,COUNT(Customer_ID)
FROM ecommerce_customer_data
GROUP BY Gender;

---17.Revenue by Payment Method
SELECT Payment_Method,SUM(Total_Purchase_Amount)
FROM ecommerce_customer_data
GROUP BY Payment_Method;

---18.Orders by Payment Method
SELECT Payment_Method,COUNT(*)
FROM ecommerce_customer_data
GROUP BY Payment_Method;

---19.Average Purchase by Payment Method
SELECT Payment_Method,AVG(Total_Purchase_Amount)
FROM ecommerce_customer_data
GROUP BY Payment_Method;

---20.Highest Revenue Category
select TOP 1 product_category, sum(total_purchase_amount) AS Highest_revenue from ecommerce_customer_data
group by Product_Category
order by Highest_revenue DESC

---21.Lowest Revenue Category
select TOP 1 product_category, sum(total_purchase_amount) AS Highest_revenue from ecommerce_customer_data
group by Product_Category
order by Highest_revenue ASC

---22.Highest Quantity Sold Category
select TOP 1 product_category, sum(Quantity) AS Total_quantity from ecommerce_customer_data
group by Product_Category
order by Total_quantity DESC

---23.Lowest Quantity Sold Category
select TOP 1 product_category, sum(Quantity) AS Total_quantity from ecommerce_customer_data
group by Product_Category
order by Total_quantity ASC

---24.Top 10 Customers by Revenue
Select top 10 customer_name, sum(Total_Purchase_Amount) AS Revenue from ecommerce_customer_data
group by Customer_Name
order by Revenue DESC

---25.Bottom 10 Customers by Revenue
Select top 10 customer_name, sum(Total_Purchase_Amount) AS Revenue from ecommerce_customer_data
group by Customer_Name
order by Revenue ASC


---26.Highest Spending Customer
select TOP 1 customer_name, sum(total_purchase_amount) AS high_spending from ecommerce_customer_data
group by Customer_Name
order BY high_spending DESC

---27.Lowest Spending Customer
select TOP 1 customer_name, sum(total_purchase_amount) AS high_spending from ecommerce_customer_data
group by Customer_Name
order BY high_spending ASC


---29.Which age group spends the most?
select Age, sum(total_purchase_amount) AS most_spend from ecommerce_customer_data
group by Age
order By most_spend DESC

---30.Which age group buys the highest quantity?
select Age, max(quantity) AS highest_quantity from ecommerce_customer_data
group by Age
order by highest_quantity Desc

---31.Which gender spends more?
select Gender , sum(total_purchase_amount) AS Spend_more from ecommerce_customer_data
group by Gender

---32.Which gender returns more products?
select gender, sum(returns) AS Returns from ecommerce_customer_data
group by Gender

---33.Customer count by age group
select Age, count(customer_ID) AS Customer from ecommerce_customer_data
group by Age

---34.Average age by gender
select Gender , Avg(Age) AS Avg_Age from ecommerce_customer_data
group by gender

---35.Top 20 customers
select top 10 * from ecommerce_customer_data

---36.Repeat customers
select customer_name , count(*) AS Repeated_customers from ecommerce_customer_data
group by Customer_Name
having count(*)>1

---37.Which age group has the highest return rate?
select Age, count(*) AS returns from ecommerce_customer_data
where Returns = 1
group by Age
order by returns DESc

---38.What is the average purchase amount for returned vs. non-returned orders?
SELECT Returns,AVG(Total_Purchase_Amount) AS Avg_Purchase
FROM ecommerce_customer_data
GROUP BY Returns;

---39.Which product category has the highest return value?
SELECT Product_Category,SUM(Total_Purchase_Amount) AS Returned_Revenue
FROM ecommerce_customer_data
WHERE Returns = 1
GROUP BY Product_Category
ORDER BY Returned_Revenue DESC;

---40.How many customers returned products by payment method?
SELECT Payment_Method,COUNT(Customer_ID) AS Returned_Customers
FROM ecommerce_customer_data
WHERE Returns = 1
GROUP BY Payment_Method
ORDER BY Returned_Customers DESC;