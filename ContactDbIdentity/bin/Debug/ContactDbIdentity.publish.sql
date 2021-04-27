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
USE [master];


GO

IF (DB_ID(N'$(DatabaseName)') IS NOT NULL) 
BEGIN
    ALTER DATABASE [$(DatabaseName)]
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [$(DatabaseName)];
END

GO
PRINT N'Création de $(DatabaseName)...'
GO
CREATE DATABASE [$(DatabaseName)]
    ON 
    PRIMARY(NAME = [$(DatabaseName)], FILENAME = N'$(DefaultDataPath)$(DefaultFilePrefix)_Primary.mdf')
    LOG ON (NAME = [$(DatabaseName)_log], FILENAME = N'$(DefaultLogPath)$(DefaultFilePrefix)_Primary.ldf') COLLATE SQL_Latin1_General_CP1_CI_AS
GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CLOSE OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
USE [$(DatabaseName)];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                NUMERIC_ROUNDABORT OFF,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL,
                CURSOR_CLOSE_ON_COMMIT OFF,
                AUTO_CREATE_STATISTICS ON,
                AUTO_SHRINK OFF,
                AUTO_UPDATE_STATISTICS ON,
                RECURSIVE_TRIGGERS OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ALLOW_SNAPSHOT_ISOLATION OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET READ_COMMITTED_SNAPSHOT OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_UPDATE_STATISTICS_ASYNC OFF,
                PAGE_VERIFY NONE,
                DATE_CORRELATION_OPTIMIZATION OFF,
                DISABLE_BROKER,
                PARAMETERIZATION SIMPLE,
                SUPPLEMENTAL_LOGGING OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET TRUSTWORTHY OFF,
        DB_CHAINING OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'Impossible de modifier les paramètres de base de données. Vous devez être administrateur système pour appliquer ces paramètres.';
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET HONOR_BROKER_PRIORITY OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'Impossible de modifier les paramètres de base de données. Vous devez être administrateur système pour appliquer ces paramètres.';
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET FILESTREAM(NON_TRANSACTED_ACCESS = OFF),
                CONTAINMENT = NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CREATE_STATISTICS ON(INCREMENTAL = OFF),
                MEMORY_OPTIMIZED_ELEVATE_TO_SNAPSHOT = OFF,
                DELAYED_DURABILITY = DISABLED 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (QUERY_CAPTURE_MODE = ALL, DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_PLANS_PER_QUERY = 200, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367), MAX_STORAGE_SIZE_MB = 100) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE = OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
    END


GO
IF fulltextserviceproperty(N'IsFulltextInstalled') = 1
    EXECUTE sp_fulltext_database 'enable';


GO
PRINT N'Création de [dbo].[ExternalLogin]...';


GO
CREATE TABLE [dbo].[ExternalLogin] (
    [Id]                  INT            IDENTITY (1, 1) NOT NULL,
    [LoginProvider]       NVARCHAR (450) NOT NULL,
    [ProviderKey]         NVARCHAR (450) NOT NULL,
    [ProviderDisplayName] NVARCHAR (450) NOT NULL,
    [Created]             DATETIME       NOT NULL,
    [UserID]              INT            NOT NULL,
    CONSTRAINT [PK_ExternalLogin] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Création de [dbo].[MappingRoles]...';


GO
CREATE TABLE [dbo].[MappingRoles] (
    [UserId] INT NOT NULL,
    [RoleId] INT NOT NULL,
    CONSTRAINT [PK_MappingRoles] PRIMARY KEY CLUSTERED ([UserId] ASC)
);


GO
PRINT N'Création de [dbo].[Role]...';


GO
CREATE TABLE [dbo].[Role] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [Name]        NVARCHAR (100) NOT NULL,
    [Description] NVARCHAR (500) NOT NULL,
    [Created]     DATETIME       NOT NULL,
    CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Création de [dbo].[Utilisateurs]...';


GO
CREATE TABLE [dbo].[Utilisateurs] (
    [Id]               INT            IDENTITY (1, 1) NOT NULL,
    [LastName]         NVARCHAR (50)  NOT NULL,
    [Firstname]        NVARCHAR (50)  NOT NULL,
    [Email]            NVARCHAR (384) NOT NULL,
    [Passwd]           BINARY (64)    NOT NULL,
    [IsValid]          BIT            NULL,
    [IsAdmin]          BIT            NULL,
    [Genre]            CHAR (1)       NOT NULL,
    [CreationDate]     DATETIME2 (7)  NULL,
    [TwoFactorEnabled] BIT            NOT NULL,
    CONSTRAINT [PK_Utilisateurs] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [UK_UniqueEmail] UNIQUE NONCLUSTERED ([Email] ASC)
);


GO
PRINT N'Création de contrainte sans nom sur [dbo].[Utilisateurs]...';


GO
ALTER TABLE [dbo].[Utilisateurs]
    ADD DEFAULT 1 FOR [IsValid];


GO
PRINT N'Création de contrainte sans nom sur [dbo].[Utilisateurs]...';


GO
ALTER TABLE [dbo].[Utilisateurs]
    ADD DEFAULT 0 FOR [IsAdmin];


GO
PRINT N'Création de contrainte sans nom sur [dbo].[Utilisateurs]...';


GO
ALTER TABLE [dbo].[Utilisateurs]
    ADD DEFAULT SYSDATETIME() FOR [CreationDate];


GO
PRINT N'Création de contrainte sans nom sur [dbo].[Utilisateurs]...';


GO
ALTER TABLE [dbo].[Utilisateurs]
    ADD DEFAULT 0 FOR [TwoFactorEnabled];


GO
PRINT N'Création de [dbo].[FK_MappingRole_Role]...';


GO
ALTER TABLE [dbo].[MappingRoles]
    ADD CONSTRAINT [FK_MappingRole_Role] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[Role] ([Id]);


GO
PRINT N'Création de [dbo].[FK_MappingRole_Utilisateurs]...';


GO
ALTER TABLE [dbo].[MappingRoles]
    ADD CONSTRAINT [FK_MappingRole_Utilisateurs] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Utilisateurs] ([Id]);


GO
PRINT N'Création de [dbo].[identity_AddUserToRole]...';


GO
CREATE PROCEDURE [dbo].[identity_AddUserToRole]
	
@RoleId int,
@UserId int

AS
BEGIN

IF NOT EXISTS
(
	SELECT 1 FROM MappingRoles 
	WHERE [UserId] = @UserId
	AND [RoleId] = @RoleId
)

INSERT INTO MappingRoles
(
	[UserId], 
	[RoleId]
) 
VALUES
(
	@UserId,
	@RoleId
)

 END
GO
PRINT N'Création de [dbo].[identity_FindById]...';


GO
CREATE PROCEDURE [dbo].[identity_FindById]
	(
@Id int
)
AS
BEGIN
	
SELECT * FROM [dbo].Utilisateurs
WHERE Id = @Id

END
GO
PRINT N'Création de [dbo].[identity_GetAllUsers]...';


GO
CREATE PROCEDURE [dbo].[identity_GetAllUsers]
	
AS
BEGIN

SELECT * FROM [dbo].[Utilisateurs]

END
GO
PRINT N'Création de [dbo].[identity_InsertRole]...';


GO

CREATE PROCEDURE [dbo].[identity_InsertRole]
	
@Name nvarchar(256),
@NormalizedName nvarchar(256),
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
PRINT N'Création de [dbo].[identity_InsertUser]...';


GO
CREATE PROCEDURE [dbo].[identity_InsertUser]
	
@LastName NVARCHAR(50),
	@FirstName NVARCHAR(50),
	@Email NVARCHAR(384),
	@Passwd NVARCHAR(20),
	@Genre CHAR(1)
AS
BEGIN
	DECLARE @IsAdmin BIT = 0;
	IF(NOT EXISTS(SELECT TOP 1 * FROM Utilisateurs))
		BEGIN
		SET @IsAdmin = 1
		END
	INSERT INTO [Utilisateurs] ([Lastname], [FirstName], [Email], [Passwd],[IsAdmin], [Genre]) VALUES (@LastName, @FirstName, @Email, @Passwd , @IsAdmin, @Genre)

 SELECT CAST(SCOPE_IDENTITY() as int)

END
GO
EXEC Identity_InsertUser @LastName = 'Mathieu', @FirstName = 'Julien', @Email = 'jul.mathieu1986@gmail.com', @passwd = 'Test1234=', @Genre = 'M'
GO

GO
DECLARE @VarDecimalSupported AS BIT;

SELECT @VarDecimalSupported = 0;

IF ((ServerProperty(N'EngineEdition') = 3)
    AND (((@@microsoftversion / power(2, 24) = 9)
          AND (@@microsoftversion & 0xffff >= 3024))
         OR ((@@microsoftversion / power(2, 24) = 10)
             AND (@@microsoftversion & 0xffff >= 1600))))
    SELECT @VarDecimalSupported = 1;

IF (@VarDecimalSupported > 0)
    BEGIN
        EXECUTE sp_db_vardecimal_storage_format N'$(DatabaseName)', 'ON';
    END


GO
PRINT N'Mise à jour terminée.';


GO
