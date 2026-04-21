USE master;
GO

BACKUP LOG AdventureWorksLT2022
TO DISK = 'C:\SQLBackups\AdventureWorksLT2022\Log\AdventureWorksLT2022_TAIL_LOG.trn'
WITH
    INIT,
    NO_TRUNCATE,
    CHECKSUM,
    STATS = 10,
    NAME = 'AdventureWorksLT2022 Tail Log Backup';
GO
