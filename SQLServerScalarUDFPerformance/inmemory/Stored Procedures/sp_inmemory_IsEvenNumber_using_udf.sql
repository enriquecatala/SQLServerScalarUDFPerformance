/*
The database must have a MEMORY_OPTIMIZED_DATA filegroup
before the memory optimized object can be created.
*/

CREATE PROCEDURE inmemory.[sp_inmemory_IsSumEvenNumber_using_udf]
WITH NATIVE_COMPILATION, SCHEMABINDING, EXECUTE AS OWNER 
AS BEGIN ATOMIC WITH (
      TRANSACTION ISOLATION LEVEL = SNAPSHOT,
      LANGUAGE = N'English')

	SELECT count(*)
	FROM inmemory.Numbers_InMemory
	WHERE inmemory.IsSumEvenNumberInMemory(n,n2) = 1	
END