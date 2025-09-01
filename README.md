# Consumer-Ad-Hoc-Insights
## 🚀 Project Overview
This project is an analysis of consumer goods data for **AtliQ Hardware**, a leading Indian computer hardware manufacturer. The primary goal is to provide data-driven insights to the company's leadership by answering 10 ad-hoc business requests. By leveraging SQL for data querying and analysis, this project helps management identify key business trends, evaluate performance, and make informed strategic decisions.

---
## 📝 Problem Statement

The management team at AtliQ Hardware needed quick and accurate answers to several pressing business questions. The following 10 ad-hoc requests were addressed in this project:

1.  List all markets in the **APAC region** where the customer "Atliq Exclusive" operates.
2.  Calculate the percentage increase in **unique products** in 2021 compared to 2020.
3.  Report the count of unique products for each **product segment**, sorted in descending order.
4.  Identify the product segment with the **highest increase** in unique products from 2020 to 2021.
5.  Find the products with the **highest and lowest manufacturing costs**.
6.  Generate a report of the top 5 customers in the **Indian market** who received the highest average pre-invoice discount percentage in the fiscal year 2021.
7.  Provide a monthly report of the **gross sales amount** for the customer "Atliq Exclusive".
8.  Determine the quarter in 2020 with the **maximum total sold quantity**.
9.  Identify the sales **channel** that generated the most gross sales in the fiscal year 2021 and its percentage contribution.
10. List the **top 3 products** by total sold quantity in each division for the fiscal year 2021.

---
## 🗃️ Database Schema

The analysis was performed on the `gdb023` database, which contains transactional and master data for AtliQ Hardware. The key tables used in this project are:

* **`dim_customer`**: Stores information about customers, their location, and sales channel.
* **`dim_product`**: Contains details about the products, including division, segment, and category.
* **`fact_gross_price`**: Includes the gross price for each product for a given fiscal year.
* **`fact_manufacturing_cost`**: Contains the manufacturing cost for each product.
* **`fact_pre_invoice_deductions`**: Stores pre-invoice discount data for customers.
* **`fact_sales_monthly`**: Contains monthly sales data, including sold quantity and product codes.

---
## 💡 Key Insights & Findings

The analysis yielded several actionable insights:

* **Product Growth**: There was a **36.33% increase** in unique products from FY 2020 to FY 2021. The **Accessories segment** drove this growth, adding 34 new products.
* **Sales Performance**: The **Retailer channel** was the most successful, contributing **73.23%** of total gross sales in FY 2021.
* **Customer & Market Analysis**: **Flipkart** received the highest average pre-invoice discount (**30.83%**) among top Indian customers. The customer **"AtliQ Exclusive"** was found to operate in several APAC markets, including India and Japan.
* **Top Products**: The analysis identified top-performing products by division. The **N&S division** was dominated by "AQ Pen Drive" variants, while the **P&A division's** top products were "AQ Gamers Ms" and variants of "AQ Maxima Ms".

---
## 🛠️ Skills Demonstrated

This project showcases the following skills:

* **Advanced SQL Querying**: Proficiency in using Common Table Expressions (CTEs), window functions (RANK()), JOIN statements, and aggregation functions to solve complex business problems.
* **Data Analysis & Interpretation**: The ability to translate raw data into clear, actionable business insights.
* **Business Intelligence & Reporting**: Experience in creating comprehensive and easy-to-understand reports and visualizations for business stakeholders.
* **Problem-Solving**: The capacity to break down ad-hoc business requests into a structured, data-driven analytical process.

---

## 🔧 Tools Used

* **MySQL**: For database management, data storage, and running complex SQL queries to extract insights.
* **Power BI**: Used for data visualization to create interactive dashboards and reports that clearly communicate the findings.
* **PowerPoint**: Utilized for creating the final presentation to deliver the project's insights and recommendations to stakeholders.

---









