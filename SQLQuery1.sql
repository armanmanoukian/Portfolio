Select *
From [dbo].[Ocean]


UPDATE [dbo].[Ocean]
SET [Type] = '-'
WHERE [Type] IS NULL;

UPDATE [dbo].[Ocean]
SET [Consignee]= '-'
WHERE [Consignee] IS NULL;


SELECT *
FROM [dbo].[Ocean]
WHERE [I_E]= 'import'; -- Select rows with 'import'

SELECT *
FROM [dbo].[Ocean]
WHERE [I_E] = 'export'; -- Select rows with 'export'

SELECT *
FROM [dbo].[Ocean]
where [Status] = 'Ordered'


--Count the total number of rows:

SELECT COUNT(*) as TotalRows
FROM [dbo].[Ocean];

--Summarize the data distribution for numeric columns:

SELECT
  MIN(Weight) AS MinWeight,
  MAX(Weight) AS MaxWeight,
  AVG(Weight) AS AvgWeight,
  SUM(Total_incomes) AS TotalIncome,
  SUM(Total_costs) AS TotalCost
FROM [dbo].[Ocean];

SELECT *
FROM [dbo].[Ocean]
ORDER BY Date_of_order ASC;


SELECT Delivery_city, COUNT(*) as OrderCount
FROM [dbo].[Ocean]
GROUP BY Delivery_city;


SELECT Customer, COUNT(*) AS ShipmentCount
FROM [dbo].[Ocean]
GROUP BY Customer
ORDER BY ShipmentCount DESC;

SELECT Customer, SUM([Total_incomes]) AS TotalIncome
FROM [dbo].[Ocean]
GROUP BY Customer
ORDER BY TotalIncome DESC;


--Determine the most common delivery terms:
--sql
SELECT [Delivery_term], COUNT(*) AS TermCount
FROM [dbo].[Ocean]
GROUP BY [Delivery_term]
ORDER BY TermCount DESC;

--Analyze the distribution of FCL and LCL shipments:
--sql
SELECT [Status], COUNT(*) AS ShipmentCount
FROM [dbo].[Ocean]
GROUP BY [Status];

--Agent Performance:

--Evaluate the performance of agents and agencies based on the number of shipments and total income:
--sql
SELECT [Customer], COUNT(*) AS ShipmentCount, SUM([Total_incomes]) AS TotalIncome
FROM [dbo].[Ocean]
GROUP BY [Customer]
ORDER BY TotalIncome DESC, ShipmentCount DESC;


--Geographical Insights:

--Analyze which ports, cities, and ZIP codes are frequently used for shipping:
--sql

SELECT [Origin_port], COUNT(*) AS ShipmentCount
FROM [dbo].[Ocean]
GROUP BY [Origin_port]
ORDER BY ShipmentCount DESC;


SELECT [Customer], COUNT(*) AS ShipmentCount, SUM([Total_incomes]) AS TotalIncome
FROM [dbo].[Ocean]
GROUP BY [Customer]
ORDER BY 
    CASE WHEN [Status] = 'Ordered' THEN 0 ELSE 1 END, -- 'Ordered' status first
    TotalIncome DESC,
    ShipmentCount DESC;


	WITH CTE AS (
    SELECT [Customer], COUNT(*) AS ShipmentCount, SUM([Total_incomes]) AS TotalIncome
    FROM [dbo].[Ocean]
    GROUP BY [Customer]
)

SELECT [Customer], ShipmentCount, TotalIncome
FROM CTE
ORDER BY 
    CASE WHEN EXISTS (SELECT 1 FROM [dbo].[Ocean] o WHERE o.[Customer] = CTE.[Customer] AND o.[Status] = 'Ordered') THEN 0 ELSE 1 END,
    TotalIncome DESC,
    ShipmentCount DESC;



	SELECT
    [Customer],
    COUNT(*) AS ShipmentCount,
    SUM(CASE WHEN [Status] = 'Ordered' THEN 1 ELSE 0 END) AS OrderedShipmentCount
FROM [dbo].[Ocean]
GROUP BY [Customer]
ORDER BY
    OrderedShipmentCount DESC,
    ShipmentCount DESC;