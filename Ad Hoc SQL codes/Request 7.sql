/*7. Get the complete report of the Gross sales amount for the customer “Atliq
Exclusive” for each month. This analysis helps to get an idea of low and
high-performing months and take strategic decisions.
The final report contains these columns:
Month
Year
Gross sales Amount*/

SELECT CONCAT(MONTHNAME(FS.date), ' (', YEAR(FS.date), ')') AS 'Month', FS.fiscal_year,
       ROUND(SUM(G.gross_price*FS.sold_quantity), 2) AS Gross_sales_Amount
FROM fact_sales_monthly FS JOIN dim_customer C ON FS.customer_code = C.customer_code
						   JOIN fact_gross_price G ON FS.product_code = G.product_code
WHERE C.customer = 'Atliq Exclusive'
GROUP BY  Month, FS.fiscal_year 
ORDER BY FS.fiscal_year ;