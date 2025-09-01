-- Q1
SELECT DISTINCT market
FROM dim_customer
WHERE region = 'APAC'
	AND 
    customer = 'Atliq Exclusive';

-- Q2 
with CTE1 AS (
	Select 
	 Count(distinct(product_code)) AS unique_product,
     fiscal_year
	from fact_sales_monthly
	where fiscal_year IN (2020, 2021)
	group by fiscal_year
),
CTE2 AS (
	select 
	(select unique_product from CTE1 where fiscal_year = 2020) AS unique_product_2020,
    (select unique_product from CTE1 where fiscal_year = 2021) AS unique_product_2021
)
Select 
	unique_product_2020,
    unique_product_2021,
    Round((unique_product_2021-unique_product_2020)*100/unique_product_2020, 2) AS percentage_chg
from CTE2;

-- Q3
Select 
	segment,
	Count(distinct(product_code)) AS product_count
from dim_product
group by segment
order by product_count Desc;

-- Q4 
With CTE1 AS (
	select *
	from dim_product
	join fact_sales_monthly
	using(product_code)
	where fiscal_year IN (2020, 2021)
)	
Select 
	segment,
	count(distinct case when fiscal_year=2020 then product_code END) AS product_count_2020,
	Count(distinct case when fiscal_year=2021 then product_code END) AS product_count_2021,
	count(distinct case when fiscal_year=2021 then product_code END) 
	- 
	count(distinct case when fiscal_year=2020 then product_code END) AS difference
from CTE1
group by segment
order by difference desc;

-- Q5
With CTE1 AS (
	Select p.product_code, product, manufacturing_cost,
		cost_year
	from dim_product p
	join fact_manufacturing_cost m
	using (product_code)
)
(select product_code, product, manufacturing_cost
from CTE1
order by manufacturing_cost DESC
limit 1)
union
(select product_code, product, manufacturing_cost
from CTE1
order by manufacturing_cost asc
limit 1);

-- Q6
Select c.customer_code, c.customer,
	Round(avg(d.pre_invoice_discount_pct),4) 
    as average_discount_percentage
from dim_customer c
join fact_pre_invoice_deductions d
USING (customer_code)
where market = 'India' AND fiscal_year = 2021
group by c.customer_code, c.customer
order by average_discount_percentage desc
limit 5;

-- alternative if ther are multiple wiht same number 
with CTE1 AS (
	Select c.customer_code, c.customer,
		Round(avg(d.pre_invoice_discount_pct),4) as average_discount_percentage,
        rank() over (order by avg(d.pre_invoice_discount_pct) DESC) AS rnk
	from dim_customer c
	join fact_pre_invoice_deductions d
	USING (customer_code)
	where market = 'India' AND fiscal_year = 2021
	group by c.customer_code, c.customer
)
select customer_code, customer, average_discount_percentage
from CTE1 
where rnk <=5
order by rnk, average_discount_percentage desc;

-- Q7
SELECT 
	YEAR(ADDDATE(date, INTERVAL 4 MONTH)) AS Year,
	MONTH(ADDDATE(date, INTERVAL 4 MONTH)) AS Month,
	CONCAT(ROUND(SUM(p.gross_price*s.sold_quantity)/1000000,2), " ", 'M') 
    AS gross_sales
FROM fact_sales_monthly s
JOIN dim_customer c
ON s.customer_code=c.customer_code
JOIN fact_gross_price p
ON s.product_code=p.product_code AND s.fiscal_year=p.fiscal_year
WHERE c.customer = 'Atliq Exclusive'
GROUP BY Year, Month;

-- Q8
SELECT 
	CONCAT('Q', QUARTER(ADDDATE(date, INTERVAL 4 MONTH))) 
    AS Quarter,
    SUM(sold_quantity) AS total_sold_quantity
FROM fact_sales_monthly
WHERE fiscal_year = 2020
GROUP BY Quarter
ORDER BY total_sold_quantity DESC;

-- Q9
WITH CTE1 AS (
	SELECT
		c.channel,
		ROUND(SUM(p.gross_price*s.sold_quantity)/1000000, 2) AS gross_sales
	FROM fact_sales_monthly s
	JOIN dim_customer c
	ON s.customer_code=c.customer_code
	JOIN fact_gross_price p
	ON s.product_code=p.product_code AND s.fiscal_year=p.fiscal_year
	WHERE s.fiscal_year=2021
	GROUP BY c.channel
)
SELECT 
	channel,
	gross_sales,
    ROUND(gross_sales*100/(SELECT SUM(gross_sales) FROM CTE1),2) AS percentage
FROM CTE1
ORDER BY gross_sales DESC;

-- Q10
with CTE AS (
	Select 
		p.division,
		p.product_code,
		p.product,
		SUM(s.sold_quantity) AS total_sold_quantity,
		RANk () OVER (partition by p.division order by SUM(s.sold_quantity) desc) 
        AS rank_order
	from dim_product p
	join fact_sales_monthly s
	USING (product_code)
	where fiscal_year = 2021
	group by p.division, p.product_code, p.product
)
select 
	division, 
    product_code, 
    product, 
    total_sold_quantity,
    rank_order
from CTE
where rank_order <=3


