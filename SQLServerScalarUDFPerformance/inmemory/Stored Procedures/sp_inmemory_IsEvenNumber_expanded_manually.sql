/*
The database must have a MEMORY_OPTIMIZED_DATA filegroup
before the memory optimized object can be created.
*/

CREATE PROCEDURE inmemory.[sp_inmemory_IsSumEvenNumber_expanded_manually]
WITH NATIVE_COMPILATION, SCHEMABINDING, EXECUTE AS OWNER 
AS BEGIN ATOMIC WITH (
      TRANSACTION ISOLATION LEVEL = SNAPSHOT,
      LANGUAGE = N'English')
	
	DECLARE @result INT

	SELECT @result = COUNT(*)
	FROM inmemory.Numbers_InMemory
	WHERE (n+n2)%2 = 0

	SELECT @result

END