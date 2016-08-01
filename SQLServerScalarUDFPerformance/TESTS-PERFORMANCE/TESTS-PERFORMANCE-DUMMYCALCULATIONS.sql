USE SQLServerScalarUDFPerformance
go

SET STATISTICS TIME ON

-- CPU time = 8828 ms,  elapsed time = 10191 ms.
SELECT AVG(dbo.DummyCalculation(n,n2))
FROM dbo.Numbers_OnDisk
GO

-- CPU time = 4141 ms,  elapsed time = 4141 ms.
SELECT AVG(dbo.DummyCalculationInMemory(n,n2))
FROM dbo.Numbers_OnDisk
GO

-- CPU time = 1500 ms,  elapsed time = 1506 ms.
SELECT AVG(dbo.DummyCalculationClr(n,n2))
FROM dbo.Numbers_OnDisk
go