CREATE TABLE mytemp (
	rid BIGINT IDENTITY (1, 1) NOT NULL,
	at1 INT NULL,
	at2 INT NULL,
	at3 INT NULL,
	lixo varchar(100) NULL
);

-- a)

CREATE CLUSTERED INDEX Ixrid ON mytemp(rid);

-- b)

-- Record the Start Time
DECLARE @start_time DATETIME, @end_time DATETIME;
SET @start_time = GETDATE();
PRINT @start_time

-- Generate random records
DECLARE @val as int = 1;
DECLARE @nelem as int = 50000;

SET nocount ON

WHILE @val <= @nelem
BEGIN
	DBCC DROPCLEANBUFFERS;					 -- need to be sysadmin
	INSERT mytemp (rid, at1, at2, at3, lixo)
	SELECT	cast((RAND()*@nelem*40000) as int), cast((RAND()*@nelem) as int),
				cast((RAND()*@nelem) as int), cast((RAND()*@nelem) as int),
				'lixo...lixo...lixo...lixo...lixo...lixo...lixo...lixo...lixo';
	SET @val = @val + 1;
END

PRINT 'Inserted ' + str(@nelem) + ' total records'

-- Duration of Insertion Process
SET @end_time = GETDATE();
PRINT 'Milliseconds used: ' + CONVERT(VARCHAR(20), DATEDIFF(MILLISECOND, @start_time, @end_time));

SELECT * FROM sys.dm_db_index_physical_stats(db_id('temp'), 
OBJECT_ID('mytemp'), NULL, NULL, 'DETAILED');

-- percentagem de fragmentação dos índices -> 99,4%
-- percentagem de ocupação das páginas dos índices -> 68,6%

-- c)

ALTER INDEX ALL ON mytemp REBUILD WITH (FILLFACTOR = 65);

--ALTER INDEX ALL ON mytemp REBUILD WITH (FILLFACTOR = 80)

--ALTER INDEX ALL ON mytemp REBUILD WITH (FILLFACTOR = 90)

-- d)

-- Record the Start Time
/*DECLARE @start_time DATETIME, @end_time DATETIME;
SET @start_time = GETDATE();
PRINT @start_time

-- Generate random records
DECLARE @val as int = 1;
DECLARE @nelem as int = 50000;

SET nocount ON

WHILE @val <= @nelem
BEGIN
	DBCC DROPCLEANBUFFERS;					 -- need to be sysadmin
	INSERT mytemp (at1, at2, at3, lixo)
	SELECT cast((RAND()*@nelem) as int),
				cast((RAND()*@nelem) as int), cast((RAND()*@nelem) as int),
				'lixo...lixo...lixo...lixo...lixo...lixo...lixo...lixo...lixo';
	SET @val = @val + 1;
END

PRINT 'Inserted ' + str(@nelem) + ' total records'

-- Duration of Insertion Process
SET @end_time = GETDATE();
PRINT 'Milliseconds used: ' + CONVERT(VARCHAR(20), DATEDIFF(MILLISECOND, @start_time, @end_time));

SELECT * FROM sys.dm_db_index_physical_stats(db_id('temp'), 
OBJECT_ID('mytemp'), NULL, NULL, 'DETAILED');

*/

-- e)

DROP INDEX Ixrid ON mytemp;

CREATE INDEX Ixrid ON mytemp(rid);
CREATE INDEX Ixat1 ON mytemp(at1);
CREATE INDEX Ixat2 ON mytemp(at2);
CREATE INDEX Ixat3 ON mytemp(at3);
CREATE INDEX Ixlixo ON mytemp(lixo);
