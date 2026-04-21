USE master;
GO

ALTER DATABASE AdventureWorksLT2022
SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
GO

RESTORE DATABASE AdventureWorksLT2022
FROM DISK = 'C:\SQLBackups\AdventureWorksLT2022\Full\AdventureWorksLT2022_FULL.bak'
WITH NORECOVERY, REPLACE, STATS = 10;
GO

RESTORE DATABASE AdventureWorksLT2022
FROM DISK = 'C:\SQLBackups\AdventureWorksLT2022\Differential\AdventureWorksLT2022_DIFF.bak'
WITH NORECOVERY, STATS = 10;
GO

RESTORE LOG AdventureWorksLT2022
FROM DISK = 'C:\SQLBackups\AdventureWorksLT2022\Log\AdventureWorksLT2022_LOG_001.trn'
WITH
    STOPAT = '2026-04-20T14:30:00',
    RECOVERY,
    STATS = 10;
GO

ALTER DATABASE AdventureWorksLT2022
SET MULTI_USER;
GO

USE AdventureWorksLT2022;
GO

SELECT * FROM dbo.BackupRecoveryTest;
GO

/*
STOPAT değerini kendi güvenli zamanınıza göre değiştirin.
*/
