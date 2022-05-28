--1.a
GO 
CREATE PROC DELSSN @ssn INT 
AS
	UPDATE EMPLOYEE SET Super_ssn = NULL WHERE Super_ssn = @ssn;
	DELETE FROM Works_on WHERE @ssn = Essn;
	DELETE FROM Dependent WHERE @ssn = Essn;
	UPDATE DEPARTMENT SET Mgr_ssn = NULL WHERE Mgr_ssn = @ssn;
	DELETE FROM EMPLOYEE WHERE @ssn = Ssn;
EXEC DELSSN @ssn = 1234

--1.b 
GO 
CREATE PROC RECORDSET (@nr_anos INT OUTPUT)
AS	
	SELECT  @nr_anos=DateDiff(year,Mgr_Start_Date, GETDATE()), Fname, Lname, Ssn FROM EMPLOYEE JOIN DEPARTMENT ON EMPLOYEE.Ssn = DEPARTMENT.Mgr_ssn ORDER BY Mgr_Start_Date DESC;
DECLARE @anos INT 
EXEC RECORDSET @anos OUTPUT
PRINT @anos

--1.c
GO 
CREATE TRIGGER EMP_TRIGGER ON DEPARTMENT
AFTER INSERT
AS
	DECLARE @count AS INT
	DECLARE @gestor AS INT 
	SELECT @gestor = Mgr_ssn FROM inserted:
	SELECT @count = count(Mgr_ssn) FROM DEPARTMENT WHERE Mgr_ssn = @gestor;
	IF @count > 1
		BEGIN 
			RAISERROR('Funcion�rio j� � gestor de um departamento',16,1);
		END
GO

--1.d




--1.e
CREATE FUNCTION get_project (@ssn INT) RETURNS Table
AS
	RETURN(SELECT Pname, Plocation FROM ((EMPLOYEE JOIN Works_on ON Ssn = Essn) JOIN Project ON Pnumber = Pno) WHERE Ssn = @ssn);
GO


--1.f
CREATE FUNCTION get_func_avg_vencmed (@dno INT) RETURNS Table 
AS
	RETURN(SELECT Fname, Lname FROM EMPLOYEE WHERE Dno =  @dno and Salary > (SELECT AVG(Salary) FROM (EMPLOYEE JOIN DEPARTMENT ON Dno = Dnumber) WHERE Dno = @dno)); 
GO


--1.g
CREATE FUNCTION project_recordSet (@dno INT) RETURNS @table Table(Pname varchar(20), Pnumber INT, Plocation varchar(20), Monthlybudget FLOAT, Totalbudget FLOAT)
AS
BEGIN
	DECLARE @pname as varchar(20), @pnumber AS INT, @plocation varchar(20), @monthlybudget FLOAT, @totalbudget FLOAT;

	DECLARE C CURSOR 
	FOR SELECT Pname, Pnumber, PLocation FROM Project WHERE Dnum = @dno;

	OPEN C;

	FETCH C INTO @pname,@pnumber, @plocation;
	WHILE @@FETCH_STATUS = 0		BEGIN
		


		FETCH C INTO @pname,@pnumber, @plocation;
		END

	CLOSE C;

	DEALLOCATE C;
	RETURN 
END

--1.h



--1.i 
--    -UDF-                          |      -Stored Procedure-
--___________________________________________________________________________________________________
-- Tem que retornar um valor         |      Pode ou n�o retornar valores
-- Podem ser chamadas a partir de    |      N�o podem ser chamados a partir
--   SP		                         |      de UDFs
-- N�o podem mudar os dados que      |      Podem alterar objetos da BD
--   recebem                         |
-- � possivel usar  SELECT/          |      N�o � possivel usar  SELECT/
--  WHERE/ HAVING                    |			WHERE/ HAVING  
-- N�o � possivel usar               |     � possivel usar Try Catch
--   Try Catch .                     |
-- Podem retornar uma tabela de      |     N�o podem retornar os dados em tabelas
--   valores                         |
-- Podem usar todos os tipos de      |    S� podem usar um numero restrito de tipos 
--    dados                          |		de dados
-- N�o permite transa��es            |   Permite transa��es
--_________________________________________________________________________________________________
-- As duas s�o compiladas apenas uma vez isto otimiza a performance e reduz o custo de compila��o
-- Ambas s�o recompiladas automaticamente se houver alguma mudan�a
-- _________________________________________________________________________________________________
--                              -Casos de uso-
--__________________________________________________________________________________________________
-- Obter tabelas para usar em        |	    Modificar a base de dados
--    outras opera��es				 |		Usados como mecanismo de seguran�a   
