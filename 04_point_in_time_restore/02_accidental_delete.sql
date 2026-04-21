USE AdventureWorksLT2022;
GO

SELECT GETDATE() AS DeleteTime;
GO

DELETE FROM dbo.BackupRecoveryTest;
GO

SELECT * FROM dbo.BackupRecoveryTest;
GO
