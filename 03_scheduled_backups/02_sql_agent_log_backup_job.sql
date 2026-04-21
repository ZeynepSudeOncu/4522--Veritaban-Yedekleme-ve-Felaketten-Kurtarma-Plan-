USE msdb;
GO

EXEC sp_add_job
    @job_name = N'JOB_Log_Backup_AdventureWorksLT2022',
    @enabled = 1,
    @description = N'AdventureWorksLT2022 için 15 dakikada bir log yedeği alma işi';
GO

EXEC sp_add_jobstep
    @job_name = N'JOB_Log_Backup_AdventureWorksLT2022',
    @step_name = N'Log Backup Step',
    @subsystem = N'TSQL',
    @database_name = N'master',
    @command = N'
DECLARE @FileName NVARCHAR(4000);

SET @FileName = ''C:\SQLBackups\AdventureWorksLT2022\Log\AdventureWorksLT2022_LOG_''
              + REPLACE(REPLACE(REPLACE(CONVERT(VARCHAR(19), GETDATE(), 120), ''-'', ''''), '':'', ''''), '' '', ''_'')
              + ''.trn'';

BACKUP LOG AdventureWorksLT2022
TO DISK = @FileName
WITH INIT, CHECKSUM, COMPRESSION, STATS = 10;
';
GO

EXEC sp_add_schedule
    @schedule_name = N'SCH_Log_Backup_Every_15_Minutes',
    @freq_type = 4,
    @freq_interval = 1,
    @freq_subday_type = 4,
    @freq_subday_interval = 15,
    @active_start_time = 000000;
GO

EXEC sp_attach_schedule
    @job_name = N'JOB_Log_Backup_AdventureWorksLT2022',
    @schedule_name = N'SCH_Log_Backup_Every_15_Minutes';
GO

EXEC sp_add_jobserver
    @job_name = N'JOB_Log_Backup_AdventureWorksLT2022';
GO
