/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
USE [$(DatabaseName)]
GO
IF(NOT EXISTS(SELECT 1 FROM dbo.Numbers_OnDisk))
BEGIN
	INSERT INTO dbo.Numbers_OnDisk(n,n2)
	SELECT n,n+3 FROM dbo.fn_nums(1000000)
END
GO 
IF(NOT EXISTS(SELECT 1 FROM inmemory.Numbers_InMemory))
BEGIN
	INSERT INTO inmemory.Numbers_InMemory(n,n2)
	SELECT  n,n+3 FROM dbo.fn_nums(1000000)
END
GO 
IF(NOT EXISTS(SELECT 1 FROM inmemory.Numbers_InMemoryHASH))
BEGIN
	INSERT INTO inmemory.Numbers_InMemoryHASH(n,n2)
	SELECT  n,n+3 FROM dbo.fn_nums(1000000)
END
GO 
IF(NOT EXISTS(SELECT 1 FROM dbo.Random_Strings))
BEGIN
	DECLARE @AlLChars VARCHAR(100) = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
	  
	INSERT INTO dbo.Random_Strings
	SELECT n, 
		   REVERSE(LEFT(@AlLChars, ABS(BINARY_CHECKSUM(NEWID()) % 35) + 1)), 
		   RIGHT(@AlLChars, ABS(BINARY_CHECKSUM(NEWID()) % 35) + 1)
	FROM dbo.fn_nums(1000000)
	
END
GO
IF(NOT EXISTS(SELECT 1 FROM inmemory.Random_Strings_InMemoryHASH))
BEGIN
	-- inserting same data
	INSERT INTO inmemory.Random_Strings_InMemoryHASH
	SELECT * FROM dbo.Random_Strings
	
END