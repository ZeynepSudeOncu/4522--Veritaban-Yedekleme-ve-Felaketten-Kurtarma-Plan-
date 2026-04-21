USE master;
GO

RESTORE FILELISTONLY
FROM DISK = 'C:\SQLBackups\AdventureWorksLT2022\Full\AdventureWorksLT2022_FULL.bak';
GO

/*
Yukarıdaki logical file name değerlerine göre aşağıdaki MOVE alanlarını düzenleyin.
*/

RESTORE DATABASE AdventureWorksLT2022_RestoreTest
FROM DISK = 'C:\SQLBackups\AdventureWorksLT2022\Full\AdventureWorksLT2022_FULL.bak'
WITH
    MOVE 'AdventureWorksLT2022_Data' TO 'C:\SQLBackups\AdventureWorksLT2022\RestoreTest\AdventureWorksLT2022_RestoreTest.mdf',
    MOVE 'AdventureWorksLT2022_Log' TO 'C:\SQLBackups\AdventureWorksLT2022\RestoreTest\AdventureWorksLT2022_RestoreTest.ldf',
    RECOVERY,
    REPLACE,
    STATS = 10;
GO
