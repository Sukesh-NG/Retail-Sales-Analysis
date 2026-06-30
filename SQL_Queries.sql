USE retail_project;

-- USING AGGREGATION FUNCTION
SELECT COUNT(*)
FROM cleaned_retail_sales;

SELECT AVG(Sales) AS Average_Sales
FROM cleaned_retail_sales;

SELECT MAX(Profit) AS Highest_Profit
FROM cleaned_retail_sales;

-- USING GROUPBY
SELECT Category,
       COUNT(*) AS Total_Orders
FROM cleaned_retail_sales
GROUP BY Category;

-- USING CASE WHEN 
SELECT Product,
       Sales,
       CASE
           WHEN Sales > 50000 THEN 'High Sales'
           WHEN Sales > 20000 THEN 'Medium Sales'
           ELSE 'Low Sales'
       END AS Sales_Category
FROM cleaned_retail_sales;

-- USING WHERE,GROUPBY,HAVING,ORDERBY
SELECT State,
       SUM(Sales) AS Total_Sales
FROM cleaned_retail_sales
WHERE Profit > 0
GROUP BY State
HAVING SUM(Sales) > 100000
ORDER BY Total_Sales DESC;

-- USING SUBQUERY
SELECT Customer_Name,
       Sales
FROM cleaned_retail_sales
WHERE Sales >
(
    SELECT AVG(Sales)
    FROM cleaned_retail_sales
);

-- USING WINDOW FUNCTION (RANK)
SELECT Customer_Name,
       SUM(Sales) AS Total_Sales,
       RANK() OVER(ORDER BY SUM(Sales) DESC) AS Customer_Rank
FROM cleaned_retail_sales
GROUP BY Customer_Name;

SELECT Product,
       Category,
       Sales,
       ROW_NUMBER() OVER(
           PARTITION BY Category
           ORDER BY Sales DESC
       ) AS Product_Rank
FROM cleaned_retail_sales;



