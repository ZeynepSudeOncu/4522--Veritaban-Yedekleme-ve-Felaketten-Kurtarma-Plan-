USE AdventureWorksLT2022;
GO

SELECT GETDATE() AS SafeTimeBeforeDelete;
GO

INSERT INTO dbo.BackupRecoveryTest (Description)
VALUES ('Silme işleminden önce eklenen güvenli kayıt');
GO

SELECT * FROM dbo.BackupRecoveryTest;
GO

/*
Bu ekrandaki zamanı not alın.
STOPAT için bu zamana yakın bir değer kullanılacaktır.
*/
