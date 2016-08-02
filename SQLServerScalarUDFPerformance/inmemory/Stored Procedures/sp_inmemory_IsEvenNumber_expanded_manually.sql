 -- 
 -- Enrique Catala is Mentor at SolidQ: http://www.solidq.com 
 -- Microsoft Data Platform MVP:        https://mvp.microsoft.com/es-es/PublicProfile/5000312?fullName=Enrique%20Catala 
 -- Blog:                               http://www.enriquecatala.com 
 -- Twitter:                            https://twitter.com/enriquecatala 
 -- 
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