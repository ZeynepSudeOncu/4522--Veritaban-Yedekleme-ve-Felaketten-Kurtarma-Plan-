USE master;
GO

BACKUP DATABASE AdventureWorksLT2022
TO DISK = 'C:\SQLBackups\AdventureWorksLT2022\Full\AdventureWorksLT2022_FULL.bak'
WITH
    INIT,
    FORMAT,
    CHECKSUM,
    --COMPRESSION,
    STATS = 10,
    NAME = 'AdventureWorksLT2022 Full Backup';
GO

/*
Tam yedek, restore işleminin başlangıç noktasıdır.
*/
