USE master;
GO

SELECT
    name AS DatabaseName,
    recovery_model_desc AS RecoveryModel,
    state_desc AS DatabaseState,
    create_date AS CreateDate
FROM sys.databases
WHERE name = 'AdventureWorksLT2022';
GO

/*
Point-in-time restore yapabilmek için veritabanı FULL recovery modelde olmalıdır.
*/
