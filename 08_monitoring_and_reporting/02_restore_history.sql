USE msdb;
GO

SELECT TOP 50
    rh.destination_database_name,
    rh.restore_date,
    rh.user_name,
    rh.restore_type,
    bs.database_name AS SourceDatabase,
    bs.backup_start_date,
    bs.backup_finish_date
FROM msdb.dbo.restorehistory rh
LEFT JOIN msdb.dbo.backupset bs
    ON rh.backup_set_id = bs.backup_set_id
WHERE rh.destination_database_name LIKE 'AdventureWorksLT2022%'
ORDER BY rh.restore_date DESC;
GO
