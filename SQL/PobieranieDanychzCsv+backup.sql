USE HurtowniaDanych
GO
BACKUP DATABASE HurtowniaDanych TO DISK ='C:\SQL\kopiaHD.bak'

PRINT CONVERT (time, getdate())
PRINT 'Rozpoczo³êm import danych'
--
DECLARE @path nvarchar(255)
DECLARE @sql nvarchar(2000)

PRINT CONVERT (time, getdate())
PRINT 'Tworzê tabelê tymczasow¹'


CREATE TABLE #sprzeda¿
(
id int,
Klient int,
Kwota nvarchar(30),
Pracownik int, 
Czas smalldatetime
)
PRINT CONVERT (time, getdate())
PRINT 'Deklarujê zmienne'

SET @path = 'C:\SQL\sprzeda¿.csv'
SET @sql = 'BULK INSERT #sprzeda¿
			FROM ''' + @path + '''
			WITH (FIELDTERMINATOR = '';'',
			MAXERRORS = 0,
			ROWTERMINATOR = ''\n'',
			FIRSTROW = 2)'
PRINT CONVERT (time, getdate())
PRINT @sql
PRINT CONVERT (time, getdate())
PRINT 'Wykonujemy kod'

EXEC (@sql)
SELECT * FROM #sprzeda¿
DROP TABLE #sprzeda¿
PRINT CONVERT (time, getdate())
PRINT 'koniec pracy'
