/*5. Get the products that have the highest and lowest manufacturing costs.
The final output should contain these fields,
product_code
product
manufacturing_cost*/

SELECT F.product_code, P.product, F.manufacturing_cost 
FROM fact_manufacturing_cost F JOIN dim_product P
ON F.product_code = P.product_code
WHERE manufacturing_cost
IN (
	SELECT MAX(manufacturing_cost) FROM fact_manufacturing_cost
    UNION
    SELECT MIN(manufacturing_cost) FROM fact_manufacturing_cost
    ) 
ORDER BY manufacturing_cost DESC ;
