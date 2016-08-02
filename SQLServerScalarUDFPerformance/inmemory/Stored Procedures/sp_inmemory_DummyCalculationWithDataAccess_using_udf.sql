/*
The database must have a MEMORY_OPTIMIZED_DATA filegroup
before the memory optimized object can be created.
*/

CREATE PROCEDURE [inmemory].[sp_inmemory_DummyCalculationWithDataAccess_using_udf]	
WITH NATIVE_COMPILATION, SCHEMABINDING, EXECUTE AS OWNER 
AS BEGIN ATOMIC WITH (
      TRANSACTION ISOLATION LEVEL = SNAPSHOT,
      LANGUAGE = N'English')

	  SELECT AVG(LEN((inmemory.DummyCalculationWithDataAccessInMemory(n,n2))))
	  FROM inmemory.Numbers_InMemory

END