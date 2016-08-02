 -- 
 -- Enrique Catala is Mentor at SolidQ: http://www.solidq.com 
 -- Microsoft Data Platform MVP:        https://mvp.microsoft.com/es-es/PublicProfile/5000312?fullName=Enrique%20Catala 
 -- Blog:                               http://www.enriquecatala.com 
 -- Twitter:                            https://twitter.com/enriquecatala 
 -- 
 USE [SQLServerScalarUDFPerformance];
GO

SET STATISTICS TIME ON; 

--
-- ON DISK
--
--   CPU time = 1672 ms,  elapsed time = 1828 ms.
SELECT  COUNT(*)
FROM    dbo.Numbers_OnDisk
WHERE   dbo.IsSumEvenNumber(n, n2) = 1;
GO
--   CPU time = 343 ms,  elapsed time = 347 ms.
SELECT  COUNT(*)
FROM    dbo.Numbers_OnDisk
WHERE   dbo.IsSumEvenNumberClr(n, n2) = 1;
GO
--  CPU time = 2438 ms,  elapsed time = 2433 ms.
SELECT  COUNT(*)
FROM    dbo.Numbers_OnDisk
WHERE   inmemory.IsSumEvenNumberInMemory(n, n2) = 1;	
GO

--   CPU time = 94 ms,  elapsed time = 89 ms.
SELECT  COUNT(*)
FROM    Numbers_OnDisk f
        CROSS APPLY dbo.IsSumEvenNumberInline(n, n2) e
WHERE   e.Result = 1;
GO

-- Expanded
-- CPU time = 63 ms,  elapsed time = 67 ms.
SELECT  COUNT(*)
FROM    dbo.Numbers_OnDisk
WHERE   ( n + n2 ) % 2 = 0;
GO

--
-- IN MEMORY NONCLUSTERED INDEX
--
-- CPU time = 1672 ms,  elapsed time = 1908 ms.
SELECT  COUNT(*)
FROM    inmemory.Numbers_InMemory
WHERE   dbo.IsSumEvenNumber(n, n2) = 1;
GO
--   CPU time = 717 ms,  elapsed time = 109 ms.
SELECT  COUNT(*)
FROM    inmemory.Numbers_InMemory
WHERE   dbo.IsSumEvenNumberClr(n, n2) = 1;
GO
--  CPU time = 2140 ms,  elapsed time = 2135 ms..
SELECT  COUNT(*)
FROM    inmemory.Numbers_InMemory
WHERE   inmemory.IsSumEvenNumberInMemory(n, n2) = 1;	
GO

--   CPU time = 344 ms,  elapsed time = 43 ms.
SELECT  COUNT(*)
FROM    inmemory.Numbers_InMemory f
        CROSS APPLY dbo.IsSumEvenNumberInline(n, n2) e
WHERE   e.Result = 1;

-- CPU time = 328 ms,  elapsed time = 42 ms.
SELECT  COUNT(*)
FROM    inmemory.Numbers_InMemory
WHERE   ( n + n2 ) % 2 = 0;

-- CPU time = 766 ms,  elapsed time = 768 ms.
EXEC inmemory.[sp_inmemory_IsSumEvenNumber_using_udf];
GO
-- CPU time = 31 ms,  elapsed time = 32 ms.
EXEC inmemory.[sp_inmemory_IsSumEvenNumber_expanded_manually];
GO