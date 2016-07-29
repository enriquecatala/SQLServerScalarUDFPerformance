/*
The database must have a MEMORY_OPTIMIZED_DATA filegroup
before the memory optimized object can be created.
*/

CREATE TYPE [dbo].[IsEvenNumberResultType] AS TABLE
(
	Id INT NOT NULL IDENTITY PRIMARY KEY NONCLUSTERED HASH WITH (BUCKET_COUNT=131072), 
	Name VARCHAR(128)
) WITH (MEMORY_OPTIMIZED = ON)