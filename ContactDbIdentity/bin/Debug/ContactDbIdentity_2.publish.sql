/*
Script de déploiement pour ContactDbIdentity

Ce code a été généré par un outil.
La modification de ce fichier peut provoquer un comportement incorrect et sera perdue si
le code est régénéré.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "ContactDbIdentity"
:setvar DefaultFilePrefix "ContactDbIdentity"
:setvar DefaultDataPath "C:\Users\User\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"
:setvar DefaultLogPath "C:\Users\User\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"

GO
:on error exit
GO
/*
Détectez le mode SQLCMD et désactivez l'exécution du script si le mode SQLCMD n'est pas pris en charge.
Pour réactiver le script une fois le mode SQLCMD activé, exécutez ce qui suit :
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'Le mode SQLCMD doit être activé de manière à pouvoir exécuter ce script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Modification de [dbo].[Role]...';


GO
ALTER TABLE [dbo].[Role] ALTER COLUMN [Created] DATETIME2 (7) NOT NULL;


GO
PRINT N'Modification de [dbo].[identity_InsertRole]...';


GO

ALTER PROCEDURE [dbo].[identity_InsertRole]
	
@Name nvarchar(256),
@Description nvarchar(256),
@Created datetime

AS
BEGIN
	
INSERT INTO Role 
(
	[Name], 
    [Description],
	[Created]
 )
 VALUES
 (
	@Name,
	@Description,
	@Created 
 )


 SELECT CAST(SCOPE_IDENTITY() as int)

 END
GO
PRINT N'Création de [dbo].[identity_FindByEmail]...';


GO
CREATE PROCEDURE [dbo].[identity_FindByEmail]
(
	@Email nvarchar(384)
)
AS
BEGIN
	
SELECT * FROM [dbo].[Utilisateurs]
WHERE [Email] = @Email
END
GO
PRINT N'Création de [dbo].[identity_FindRoleByName]...';


GO
CREATE PROCEDURE [dbo].[identity_FindRoleByName]
(
@NormalizedRoleName nvarchar(100)
)
AS
BEGIN
SELECT TOP 1 * FROM [dbo].[Role]
WHERE [Name] = @NormalizedRoleName
END
GO
EXEC Identity_InsertUser @LastName = 'Mathieu', @FirstName = 'Julien', @Email = 'jul.mathieu1986@gmail.com', @Passwd = 'Test1234=', @Genre = 'M'
GO

GO
PRINT N'Mise à jour terminée.';


GO
