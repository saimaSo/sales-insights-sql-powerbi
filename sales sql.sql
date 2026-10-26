
/*
=====================================================
Project:      Sales Insights Analysis
Database:     sales (MySQL)
Author:       [Saima Solanki]
Data source:  Codebasics resume project challenge
=====================================================
Description:
This script answers business questions about sales
performance using five tables: transactions,
customers, products, markets and date.

Data notes:
- Currency values contain a hidden carriage return (\r).
  Queries 6 and 7 handle this by matching 'INR\r' and 'USD\r'.
- Some transactions have zero or negative amounts. These
  are not filtered in the SQL queries (they are excluded
  in the Power BI model).
- Products are not joined in these queries. About 60
  product codes in transactions are missing from the
  products table.
=====================================================
*/



use sales;
SELECT * FROM customers;
SELECT * FROM date;
SELECT * FROM markets;
SELECT * FROM products;
SELECT * FROM transactions;

## Now we will see different questions to generate insights from the sales 

#1.Show total number of customers

SELECT count(*) FROM customers;

#Insight : The business has 38 customers, split evenly between 19 brick-and-mortar stores and 19 e-commerce customers.

#2.Show transactions for Chennai market

SELECT * FROM transactions where market_code='Mark001';

#Insight : Chennai has 1,035 transactions, which is small compared with Delhi NCR (about 44,000).

#3. Show distinct product codes that were sold in chennai

SELECT distinct product_code FROM transactions where market_code='Mark001';

#Insight : 77 different product codes were sold in Chennai, so the market buys a wide range of products but in small volumes.

#4. Show transactions where currency is US dollars

SELECT * from transactions where currency="USD";

#Insight : Only 2 distinct sales were recorded in US dollars (500 and 250 USD, both in November 2017), so foreign currency is negligible for this business.

#5 .Show transactions in 2020 join by date table

SELECT transactions.*, date.* FROM transactions INNER JOIN date ON transactions.order_date=date.date where date.year=2020;

#Insight : There were 21,550 transactions in 2020, covering January to June only (the data ends on 26 June 2020).

#6. Show total revenue in year 2020

SELECT SUM(transactions.sales_amount) FROM transactions INNER JOIN date ON transactions.order_date=date.date where
 date.year=2020 and (transactions.currency="INR\r" or transactions.currency="USD\r");

#Insight : Revenue was about ₹142.2 million for January to June 2020. This is a half-year figure, so it shouldn’t be compared directly with full years.

#7. Show total revenue in year 2020, January Month

SELECT SUM(transactions.sales_amount) FROM transactions INNER JOIN date ON transactions.order_date=date.date
 where date.year=2020 and  date.month_name="January" and (transactions.currency="INR\r" or transactions.currency="USD\r");

#insight : January revenue was about ₹25.7 million, which is close to the monthly level seen throughout early 2020 (roughly ₹23M to ₹27M).

#8. Show total revenue in year 2020 in Chennai

SELECT SUM(transactions.sales_amount) FROM transactions INNER JOIN date ON transactions.order_date=date.date where date.year=2020
and transactions.market_code="Mark001";

#insight : Chennai brought in about ₹2.5 million in 2020, roughly 1.7% of total 2020 revenue, which makes it a low-revenue market.(Mark001 is code for Chennai)
