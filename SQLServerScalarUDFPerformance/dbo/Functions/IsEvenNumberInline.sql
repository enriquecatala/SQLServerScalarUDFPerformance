CREATE FUNCTION [dbo].[IsSumEvenNumberInline] ( @num INT , @num2 int)
RETURNS TABLE
AS
RETURN
    ( SELECT    CASE WHEN (@num+@num2) % 2 = 0 THEN 1
                     ELSE 0
                END AS result
    );