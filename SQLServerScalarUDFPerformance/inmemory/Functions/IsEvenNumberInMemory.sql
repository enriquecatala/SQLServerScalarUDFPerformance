/*
The database must have a MEMORY_OPTIMIZED_DATA filegroup
before the memory optimized object can be created.
*/

CREATE FUNCTION inmemory.[IsSumEvenNumberInMemory]
(
	@num INT,
	@num2 int
)
RETURNS bit
WITH NATIVE_COMPILATION, SCHEMABINDING
AS BEGIN ATOMIC WITH (
	TRANSACTION ISOLATION LEVEL = SNAPSHOT,
	LANGUAGE = N'English')
--RETURN (CASE WHEN @num %2 = 0 THEN 1 ELSE 0 END); -- CASE IS NOT SUPPORTED
	
	DECLARE @return bit

	IF (@num+@num2) %2 = 0
		 SET @return = 1
	ELSE
		 SET @return = 0

	RETURN(@return)
END
