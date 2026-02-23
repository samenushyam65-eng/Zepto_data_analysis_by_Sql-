-- create database if not exists zepto_sql_project;
use zepto_sql_project;
-- drop table if exists zepto;
-- alter table zepto add column sku_id INT AUTO_INCREMENT PRIMARY KEY FIRST ;
 
-- data exploration

-- count
select count(*) from zepto;

-- sample data
select * from zepto limit 10;

-- null Values
select * from zepto where name is null or Category is null or mrp is null or discountPercent is null or availableQuantity is null or 
discountedSellingPrice is null or weightInGms is null or outOfStock is null or quantity is null;

-- different product categories
select distinct Category from zepto order by Category;

-- products in stock vs out of stock
select outOfStock , count(sku_id) from zepto group by outOfStock;

-- product names present multiple times
select name , count(sku_id) as Number_of_sku from zepto group by name having count(sku_id) > 1 order by count(sku_id) desc;


-- data cleaning

-- product with price = 0;
select * from zepto where mrp = 0 or discountedSellingPrice = 0;

delete from zepto where mrp = 0;

-- convert paisa to rupees
update zepto set mrp = mrp/100.0 , discountedSellingPrice = discountedSellingPrice/100.0 ;
select mrp ,discountedSellingPrice from zepto;

-- Q1. Find the top 10 best-value products based on the discount percentage.
select distinct(name),mrp,discountPercent from zepto order by discountPercent desc limit 10;

-- Q2.What are the Products with High MRP but Out of Stock
select distinct(name) ,mrp from zepto where outOfStock = 'True' and mrp > 300 order by mrp desc;

-- Q3.Calculate Estimated Revenue for each category
select Category ,sum(quantity * discountedSellingPrice) as Revenue from zepto group by Category;

-- Q4.Find all products where MRP is greater than ?500 and discount is less than 10%.
select distinct name, mrp, discountPercent from zepto where mrp >500 and discountPercent < 10 order by mrp desc, discountPercent desc;

-- Q5. Identify the top 5 categories offering the highest average discount percentage.
select distinct(Category),avg(discountPercent) from zepto group by Category order by avg(discountPercent) desc limit 5;

-- Q6. Find the price per gram for products above 100g and sort by best value.
select distinct(name) ,	weightInGms , discountedSellingPrice, round(discountedSellingPrice/weightInGms,2) as price_per_gram 
from zepto where weightInGms >= 100 order by price_per_gram;

-- Q7.Group the products into categories like Low, Medium, Bulk. 
select distinct(name) ,weightInGms ,
case when weightInGms <  1000 then 'Low'
when weightInGms < 5000 then 'Medium' else 'Bulk' end as weight_category
from zepto;

-- 08.What is the Total Inventory Weight Per ctegory
select category , sum(weightInGms * availableQuantity) as total_weight 
from zepto group by category order by total_weight;

