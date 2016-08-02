 -- 
 -- Enrique Catala is Mentor at SolidQ: http://www.solidq.com 
 -- Microsoft Data Platform MVP:        https://mvp.microsoft.com/es-es/PublicProfile/5000312?fullName=Enrique%20Catala 
 -- Blog:                               http://www.enriquecatala.com 
 -- Twitter:                            https://twitter.com/enriquecatala 
 -- 
 CREATE FUNCTION [dbo].IsSumEvenNumber
(
	@num INT,
	@num2 int
)
RETURNS int
WITH SCHEMABINDING
AS
BEGIN
	RETURN (CASE WHEN (@num+@num2) %2 = 0 THEN 1 ELSE 0 END);
END