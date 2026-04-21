USE AdventureWorksLT2022;
GO

INSERT INTO dbo.BackupRecoveryTest (Description)
VALUES ('Log yedeğinden önce eklenen kayıt');
GO

USE master;
GO

BACKUP LOG AdventureWorksLT2022
TO DISK = 'C:\SQLBackups\AdventureWorksLT2022\Log\AdventureWorksLT2022_LOG_001.trn'
WITH
    INIT,
    CHECKSUM,
    COMPRESSION,
    STATS = 10,
    NAME = 'AdventureWorksLT2022 Transaction Log Backup 001';
GO

/*
Transaction log yedeği, point-in-time restore için kullanılır.
*/
