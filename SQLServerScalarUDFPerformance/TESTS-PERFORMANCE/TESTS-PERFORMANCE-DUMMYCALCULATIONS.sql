USE SQLServerScalarUDFPerformance
go

SET STATISTICS TIME ON

-- OnDisk
--
-- CPU time = 8828 ms,  elapsed time = 10191 ms.
SELECT AVG(dbo.DummyCalculation(n,n2))
FROM dbo.Numbers_OnDisk

-- CPU time = 4141 ms,  elapsed time = 4141 ms.
SELECT AVG(dbo.DummyCalculationInMemory(n,n2))
FROM dbo.Numbers_OnDisk

-- CPU time = 1500 ms,  elapsed time = 1506 ms.
SELECT AVG(dbo.DummyCalculationClr(n,n2))
FROM dbo.Numbers_OnDisk
GO


-- InMemory
--
-- CPU time = 8813 ms,  elapsed time = 10229 ms
SELECT AVG(dbo.DummyCalculation(n,n2))
FROM inmemory.Numbers_InMemory

-- CPU time = 3796 ms,  elapsed time = 3853 ms.
SELECT AVG(dbo.DummyCalculationInMemory(n,n2))
FROM inmemory.Numbers_InMemory

-- CPU time = 2732 ms,  elapsed time = 405 ms.
SELECT AVG(dbo.DummyCalculationClr(n,n2))
FROM inmemory.Numbers_InMemory
GO


