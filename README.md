#Sales Insights: SQL and Power BI Project#

An end-to-end sales analysis of an electronics hardware business in India, using MySQL for analysis and Power BI for an interactive dashboard.

##Tools Used:
MySQL: data exploration and business queries
Power Query: data cleaning and transformation
DAX: measures (revenue, sales quantity)
Power BI Desktop: dashboard

##Data Model:

The database has five tables:

Table         	Description
1.transactions:	  One row per sale: product, customer, market, date, quantity, amount, currency
2.customers:    	Customer code, name, type (Brick & Mortar or E-Commerce)
3.products:      	Product code and type (Own Brand or Distribution)
4.markets:      	Market code, name and zone
5.date:           Calendar table with year, month and month-year labels

Size: about 150,000 transactions between October 2017 and June 2020, across 15 markets and 38 customers.

##Power BI Dashboard:

What the dashboard shows:

- KPI cards: total revenue and total sales quantity
- Revenue and sales quantity by market
- Monthly revenue trend (June 2020 excluded because the month is incomplete)
- Top 5 customers and top 5 products by revenue
- Slicers: year and month

