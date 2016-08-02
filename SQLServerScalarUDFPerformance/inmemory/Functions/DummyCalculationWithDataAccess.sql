/*
The database must have a MEMORY_OPTIMIZED_DATA filegroup
before the memory optimized object can be created.
*/

CREATE FUNCTION inmemory.[DummyCalculationWithDataAccessInMemory]
(
	@num1 int,
	@num2 int
)
RETURNS VARCHAR(200)
WITH NATIVE_COMPILATION, SCHEMABINDING
AS BEGIN ATOMIC WITH (
	TRANSACTION ISOLATION LEVEL = SNAPSHOT,
	LANGUAGE = N'English')


	DECLARE @steps INT = @num1 % 123456
	DECLARE @no_of_sides_in_the_polygon INT =@num2 % 54321
	DECLARE @tmp2 FLOAT = 1.0
	DECLARE @tmp FLOAT
    DECLARE @return VARCHAR(200)
	 
	SET @tmp = SIN(pi()/180*(180.0 - 360/(@no_of_sides_in_the_polygon + @steps))/2)/sin(pi()*2/(@no_of_sides_in_the_polygon + @steps))
	IF(@tmp < 1.0)
		SET @tmp2 = 1.0
	IF (@tmp > 1.0 AND @tmp < 5000)
		SET @tmp2 = 5.0
	IF (@tmp >= 5000 AND @tmp < 100000)
		SET @tmp2 = 6.0
	IF(@tmp >=100000 AND @tmp < 200000)
		SET @tmp2 = 7.0
	IF (@tmp >=200000)
		SET @tmp2 = 9.0

	SET @tmp = @tmp * (1.0 -@tmp2)

	-- Indirect data access
	SELECT @return = String1 + String2
	FROM inmemory.Random_Strings_InMemoryHASH  -- We are using inmemory object
	WHERE id = ABS(CAST(@tmp+1 AS INT)%100000 )

	RETURN (@return)
END
