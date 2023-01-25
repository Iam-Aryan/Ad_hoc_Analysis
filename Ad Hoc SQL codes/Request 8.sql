/*8. In which quarter of 2020, got the maximum total_sold_quantity? The final
output contains these fields sorted by the total_sold_quantity,
Quarter
total_sold_quantity*/

SELECT 
CASE
    WHEN date BETWEEN '2019-09-01' AND '2019-11-01' then 1  
    WHEN date BETWEEN '2019-12-01' AND '2020-02-01' then 2
    WHEN date BETWEEN '2020-03-01' AND '2020-05-01' then 3
    WHEN date BETWEEN '2020-06-01' AND '2020-08-01' then 4
    END AS Quarters,
    SUM(sold_quantity) AS total_sold_quantity
FROM fact_sales_monthly
WHERE fiscal_year = 2020
GROUP BY Quarters
ORDER BY total_sold_quantity DESC
