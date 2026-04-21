USE AdventureWorksLT2022;
GO

CREATE USER backup_user WITHOUT LOGIN;
GO

ALTER ROLE db_backupoperator ADD MEMBER backup_user;
GO

SELECT
    dp1.name AS DatabaseRole,
    dp2.name AS DatabaseUser
FROM sys.database_role_members drm
JOIN sys.database_principals dp1
    ON drm.role_principal_id = dp1.principal_id
JOIN sys.database_principals dp2
    ON drm.member_principal_id = dp2.principal_id
WHERE dp2.name = 'backup_user';
GO
