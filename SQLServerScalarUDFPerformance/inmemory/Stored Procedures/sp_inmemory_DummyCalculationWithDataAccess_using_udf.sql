 -- 
 -- Enrique Catala is Mentor at SolidQ: http://www.solidq.com 
 -- Microsoft Data Platform MVP:        https://mvp.microsoft.com/es-es/PublicProfile/5000312?fullName=Enrique%20Catala 
 -- Blog:                               http://www.enriquecatala.com 
 -- Twitter:                            https://twitter.com/enriquecatala 
 -- 
CREATE PROCEDURE [inmemory].[sp_inmemory_DummyCalculationWithDataAccess_using_udf]	
WITH NATIVE_COMPILATION, SCHEMABINDING, EXECUTE AS OWNER 
AS BEGIN ATOMIC WITH (
      TRANSACTION ISOLATION LEVEL = SNAPSHOT,
      LANGUAGE = N'English')

	  SELECT AVG(LEN((inmemory.DummyCalculationWithDataAccessInMemory(n,n2))))
	  FROM inmemory.Numbers_InMemory

END