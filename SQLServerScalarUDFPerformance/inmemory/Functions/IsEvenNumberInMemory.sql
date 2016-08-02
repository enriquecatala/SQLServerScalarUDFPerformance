 -- 
 -- Enrique Catala is Mentor at SolidQ: http://www.solidq.com 
 -- Microsoft Data Platform MVP:        https://mvp.microsoft.com/es-es/PublicProfile/5000312?fullName=Enrique%20Catala 
 -- Blog:                               http://www.enriquecatala.com 
 -- Twitter:                            https://twitter.com/enriquecatala 
 -- 
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
