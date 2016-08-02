 -- 
 -- Enrique Catala is Mentor at SolidQ: http://www.solidq.com 
 -- Microsoft Data Platform MVP:        https://mvp.microsoft.com/es-es/PublicProfile/5000312?fullName=Enrique%20Catala 
 -- Blog:                               http://www.enriquecatala.com 
 -- Twitter:                            https://twitter.com/enriquecatala 
 -- 
USE SQLServerScalarUDFPerformance
go

SET STATISTICS TIME ON

-- OnDisk
--
-- CPU time = 20234 ms,  elapsed time = 21910 ms
SELECT AVG(LEN((dbo.DummyCalculationWithDataAccess(n,n2))))
FROM dbo.Numbers_OnDisk

-- CPU time = 6484 ms,  elapsed time = 6493 ms.
SELECT AVG(LEN((inmemory.DummyCalculationWithDataAccessInMemory(n,n2))))
FROM dbo.Numbers_OnDisk

-- CPU time = 219281 ms,  elapsed time = 221816 ms.
SELECT AVG(LEN((dbo.DummyCalculationWithDataAccessClr(n,n2))))
FROM dbo.Numbers_OnDisk
GO


-- InMemory
--
-- CPU time = 20375 ms,  elapsed time = 22234 ms.
SELECT AVG(LEN((dbo.DummyCalculationWithDataAccess(n,n2))))
FROM inmemory.Numbers_InMemory

-- CPU time = 5937 ms,  elapsed time = 5932 ms.
SELECT AVG(LEN((inmemory.DummyCalculationWithDataAccessInMemory(n,n2))))
FROM inmemory.Numbers_InMemory

-- CPU time = 217766 ms,  elapsed time = 219831 ms.
SELECT AVG(LEN((dbo.DummyCalculationWithDataAccessClr(n,n2))))
FROM inmemory.Numbers_InMemory
GO


