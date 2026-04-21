USE msdb;
GO

SELECT
    d.name AS DatabaseName,
    MAX(CASE WHEN bs.type = 'D' THEN bs.backup_finish_date END) AS LastFullBackup,
    MAX(CASE WHEN bs.type = 'I' THEN bs.backup_finish_date END) AS LastDifferentialBackup,
    MAX(CASE WHEN bs.type = 'L' THEN bs.backup_finish_date END) AS LastLogBackup
FROM master.sys.databases d
LEFT JOIN msdb.dbo.backupset bs
    ON d.name = bs.database_name
WHERE d.name = 'AdventureWorksLT2022'
GROUP BY d.name;
GO
