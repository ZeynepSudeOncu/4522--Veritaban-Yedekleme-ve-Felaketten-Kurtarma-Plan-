USE master;
GO

ALTER DATABASE AdventureWorksLT2022
SET RECOVERY FULL;
GO

SELECT
    name AS DatabaseName,
    recovery_model_desc AS RecoveryModel
FROM sys.databases
WHERE name = 'AdventureWorksLT2022';
GO
