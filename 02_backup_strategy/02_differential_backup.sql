USE AdventureWorksLT2022;
GO

INSERT INTO dbo.BackupRecoveryTest (Description)
VALUES ('Fark yedeğinden önce eklenen kayıt');
GO

USE master;
GO

BACKUP DATABASE AdventureWorksLT2022
TO DISK = 'C:\SQLBackups\AdventureWorksLT2022\Differential\AdventureWorksLT2022_DIFF.bak'
WITH
    DIFFERENTIAL,
    INIT,
    CHECKSUM,
    --COMPRESSION,
    STATS = 10,
    NAME = 'AdventureWorksLT2022 Differential Backup';
GO

/*
Fark yedeği, son tam yedekten sonra değişen verileri içerir.
*/
