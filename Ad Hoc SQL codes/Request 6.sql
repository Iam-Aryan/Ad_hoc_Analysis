/*6. Generate a report which contains the top 5 customers who received an
average high pre_invoice_discount_pct for the fiscal year 2021 and in the
Indian market. The final output contains these fields,
customer_code
customer
average_discount_percentage*/

WITH TBL1 AS
(SELECT customer_code AS A, AVG(pre_invoice_discount_pct) AS B FROM fact_pre_invoice_deductions
WHERE fiscal_year = '2021'
GROUP BY customer_code),
     TBL2 AS
(SELECT customer_code AS C, customer AS D FROM dim_customer
WHERE market = 'India')

SELECT TBL2.C AS customer_code, TBL2.D AS customer, ROUND (TBL1.B, 4) AS average_discount_percentage
FROM TBL1 JOIN TBL2
ON TBL1.A = TBL2.C
ORDER BY average_discount_percentage DESC
LIMIT 5 

