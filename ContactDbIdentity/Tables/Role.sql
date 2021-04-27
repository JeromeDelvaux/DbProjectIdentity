CREATE TABLE [dbo].[Role] (
    [Id] INT IDENTITY NOT NULL,
    [Name] NVARCHAR (100) NOT NULL,
    [Description] NVARCHAR (500) NOT NULL,
    [Created] DATETIME2 NOT NULL,
    CONSTRAINT [PK_Role] PRIMARY KEY ([Id])
);
