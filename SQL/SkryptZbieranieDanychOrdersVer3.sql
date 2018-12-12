DECLARE @Krok int = 0
DECLARE @Data_min date
DECLARE @Data_max date
DECLARE @SQL NVARCHAR(2000) = ''
DECLARE @Miesi¹c CHAR(6) = ''
-- przypisanie waroœci do zmiennych
SET @Data_min = (SELECT MIN(CONVERT(date, [OrderDate])) FROM [Northwind].[dbo].[Orders])
SET @Data_max = (SELECT MAX(CONVERT(date, [OrderDate])) FROM [Northwind].[dbo].[Orders])
SET @Krok = DATEDIFF(MONTH, @Data_min, @Data_max)
WHILE @Krok >= 0
BEGIN
	SET @Miesi¹c = CONVERT(CHAR(6), DATEADD(MONTH, @Krok, @Data_min),112)
	SET @SQL = 'SELECT [OrderID], [CustomerID],
				CONVERT(date, [OrderDate]) AS OrderDate,
				[Freight], '
				+ @Miesi¹c + ' AS Okres, +
				GETDATE() AS CzasDodania
				FROM [Northwind].[dbo].[Orders]
				WHERE CONVERT(CHAR(6), OrderDate,112) = ' + @Miesi¹c

	--PRINT CONCAT(YEAR(DATEADD(MONTH, @Krok, @Data_min)), MONTH(DATEADD(MONTH, @Krok, @Data_min)))
		--PRINT CONVERT(CHAR(6), DATEADD(MONTH, @Krok, @Data_min),112)
		SET @Krok = @Krok -1 
		EXEC (@SQL)
END

/*PRINT @Data_min
PRINT @Data_max
PRINT @Krok
SELECT [OrderID], [CustomerID], CONVERT(date, [OrderDate]) AS OrderDate, [Freight]
		INTO
		FROM [Northwind].[dbo].[Orders]*/
