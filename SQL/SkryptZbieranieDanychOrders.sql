USE HurtowniaDanych
GO

DECLARE @sql nvarchar(2000) = 'x'
--PRINT @sql -- najpierw print czy działa
SET @sql =
'SELECT [OrderID], [CustomerID], CONVERT(date, [OrderDate]) AS OrderDate
      ,[Freight]
	  INTO Zamówienia' +   CONVERT(CHAR(4), YEAR(GETDATE())) + CHAR(13) +
  'FROM [Northwind].[dbo].[Orders]
  WHERE YEAR(OrderDate) = YEAR(GETDATE())'

 -- PRINT @SQL
 IF EXISTS(SELECT * FROM sys.tables WHERE Name = 'Zamówienia2018')
		DROP TABLE Zamówienia2018
PRINT (@sql)
 EXEC (@sql)