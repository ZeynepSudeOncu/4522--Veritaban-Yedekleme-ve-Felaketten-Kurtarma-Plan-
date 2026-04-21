USE msdb;
GO

EXEC sp_add_job
    @job_name = N'JOB_Full_Backup_AdventureWorksLT2022',
    @enabled = 1,
    @description = N'AdventureWorksLT2022 için tam yedek alma işi';
GO

EXEC sp_add_jobstep
    @job_name = N'JOB_Full_Backup_AdventureWorksLT2022',
    @step_name = N'Full Backup Step',
    @subsystem = N'TSQL',
    @database_name = N'master',
    @command = N'
BACKUP DATABASE AdventureWorksLT2022
TO DISK = ''C:\SQLBackups\AdventureWorksLT2022\Full\AdventureWorksLT2022_FULL_SCHEDULED.bak''
WITH INIT, CHECKSUM, COMPRESSION, STATS = 10;
';
GO

EXEC sp_add_schedule
    @schedule_name = N'SCH_Full_Backup_Every_Day_0200',
    @freq_type = 4,
    @freq_interval = 1,
    @active_start_time = 020000;
GO

EXEC sp_attach_schedule
    @job_name = N'JOB_Full_Backup_AdventureWorksLT2022',
    @schedule_name = N'SCH_Full_Backup_Every_Day_0200';
GO

EXEC sp_add_jobserver
    @job_name = N'JOB_Full_Backup_AdventureWorksLT2022';
GO
