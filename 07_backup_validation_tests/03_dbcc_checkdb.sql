USE master;
GO

DBCC CHECKDB ('AdventureWorksLT2022_RestoreTest') WITH NO_INFOMSGS, ALL_ERRORMSGS;
GO

/*
Restore sonrası veritabanı tutarlılığı kontrol edilir.
*/
