CREATE TABLE [dbo].[ExternalLogin] (
    [Id] INT IDENTITY NOT NULL,
    [LoginProvider]       NVARCHAR (450) NOT NULL,
    [ProviderKey]         NVARCHAR (450) NOT NULL,
    [ProviderDisplayName] NVARCHAR (450) NOT NULL,
    [Created]             DATETIME       NOT NULL,
    [UserID]              INT            NOT NULL,

    CONSTRAINT [PK_ExternalLogin] PRIMARY KEY ([Id])
);
