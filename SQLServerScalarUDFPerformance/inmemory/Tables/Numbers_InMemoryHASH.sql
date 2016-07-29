/*
The database must have a MEMORY_OPTIMIZED_DATA filegroup
before the memory optimized object can be created.

The bucket count should be set to about two times the 
maximum expected number of distinct values in the 
index key, rounded up to the nearest power of two.
*/

CREATE TABLE inmemory.[Numbers_InMemoryHASH]
(
	[n] INT NOT NULL PRIMARY KEY NONCLUSTERED HASH WITH (BUCKET_COUNT = 10000000), 
    [n2] INT NOT NULL
) WITH (MEMORY_OPTIMIZED = ON)