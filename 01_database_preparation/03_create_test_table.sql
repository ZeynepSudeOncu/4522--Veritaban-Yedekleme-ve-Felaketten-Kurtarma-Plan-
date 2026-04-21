USE AdventureWorksLT2022;
GO

IF OBJECT_ID('dbo.BackupRecoveryTest', 'U') IS NOT NULL
    DROP TABLE dbo.BackupRecoveryTest;
GO

CREATE TABLE dbo.BackupRecoveryTest
(
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Description NVARCHAR(200) NOT NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE()
);
GO

INSERT INTO dbo.BackupRecoveryTest (Description)
VALUES
('Tam yedekten önce eklenen kayıt 1'),
('Tam yedekten önce eklenen kayıt 2'),
('Tam yedekten önce eklenen kayıt 3');
GO

SELECT * FROM dbo.BackupRecoveryTest;
GO
