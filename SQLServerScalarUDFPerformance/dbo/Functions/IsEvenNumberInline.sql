 -- 
 -- Enrique Catala is Mentor at SolidQ: http://www.solidq.com 
 -- Microsoft Data Platform MVP:        https://mvp.microsoft.com/es-es/PublicProfile/5000312?fullName=Enrique%20Catala 
 -- Blog:                               http://www.enriquecatala.com 
 -- Twitter:                            https://twitter.com/enriquecatala 
 -- 
CREATE FUNCTION [dbo].[IsSumEvenNumberInline] ( @num INT , @num2 int)
RETURNS TABLE
AS
RETURN
    ( SELECT    CASE WHEN (@num+@num2) % 2 = 0 THEN 1
                     ELSE 0
                END AS result
    );