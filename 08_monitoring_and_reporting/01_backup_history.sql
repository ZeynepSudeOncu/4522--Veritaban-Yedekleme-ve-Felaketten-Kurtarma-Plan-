USE msdb;
GO

SELECT TOP 50
    bs.database_name,
    CASE bs.type
        WHEN 'D' THEN 'Full'
        WHEN 'I' THEN 'Differential'
        WHEN 'L' THEN 'Transaction Log'
        ELSE bs.type
    END AS BackupType,
    bs.backup_start_date,
    bs.backup_finish_date,
    DATEDIFF(SECOND, bs.backup_start_date, bs.backup_finish_date) AS DurationSeconds,
    CAST(bs.backup_size / 1024.0 / 1024.0 AS DECIMAL(10,2)) AS BackupSizeMB,
    bmf.physical_device_name
FROM msdb.dbo.backupset bs
JOIN msdb.dbo.backupmediafamily bmf
    ON bs.media_set_id = bmf.media_set_id
WHERE bs.database_name = 'AdventureWorksLT2022'
ORDER BY bs.backup_start_date DESC;
GO
