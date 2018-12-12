DECLARE @Krok int = 0
DECLARE @Data_min date
DECLARE @Data_max date
-- przypisanie waroœci do zmiennych
SET @Data_min = (SELECT MIN(CONVERT(date, [OrderDate])) FROM [Northwind].[dbo].[Orders])
SET @Data_max = (SELECT MAX(CONVERT(date, [OrderDate])) FROM [Northwind].[dbo].[Orders])
SET @Krok = DATEDIFF(MONTH, @Data_min, @Data_max)

/*PRINT @Data_min
PRINT @Data_max
PRINT @Krok
*/
SELECT [OrderID], [CustomerID], CONVERT(date, [OrderDate]) AS OrderDate, [Freight]
		FROM [Northwind].[dbo].[Orders]