USE master;
GO

ALTER DATABASE AdventureWorksLT2022
SET PARTNER FAILOVER;
GO

/*
Manuel failover, uygun mirroring modunda principal rolünü mirror sunucuya geçirmek için kullanılır.
*/
