 -- 
 -- Enrique Catala is Mentor at SolidQ: http://www.solidq.com 
 -- Microsoft Data Platform MVP:        https://mvp.microsoft.com/es-es/PublicProfile/5000312?fullName=Enrique%20Catala 
 -- Blog:                               http://www.enriquecatala.com 
 -- Twitter:                            https://twitter.com/enriquecatala 
 -- 
 CREATE FUNCTION [dbo].[DummyCalculationInMemory]
(
	@num1 INT,
	@num2 int
)
RETURNS float
WITH NATIVE_COMPILATION, SCHEMABINDING
AS BEGIN ATOMIC WITH (
	TRANSACTION ISOLATION LEVEL = SNAPSHOT,
	LANGUAGE = N'English')
	DECLARE @steps INT = @num1 % 123456
	DECLARE @no_of_sides_in_the_polygon int =@num2 % 54321
	DECLARE @return2 FLOAT = 1.0
	DECLARE @return FLOAT 
	SET @return = SIN(pi()/180*(180.0 - 360/(@no_of_sides_in_the_polygon + @steps))/2)/sin(pi()*2/(@no_of_sides_in_the_polygon + @steps))
	IF(@return < 1.0)
		SET @return2 = 1.0
	IF (@return > 1.0 AND @return < 5000)
		SET @return2 = 5.0
	IF (@return >= 5000 AND @return < 100000)
		SET @return2 = 6.0
	IF(@return >=100000 AND @return < 200000)
		SET @return2 = 7.0
	IF (@return >=200000)
		SET @return2 = 9.0

	SET @return = @return * (1.0 -@return2)

	RETURN (@return)
END
