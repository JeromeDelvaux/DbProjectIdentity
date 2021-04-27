CREATE TABLE [dbo].[MappingRoles] (
    [UserId] INT NOT NULL,
    [RoleId] INT NOT NULL,

    CONSTRAINT [PK_MappingRoles] PRIMARY KEY ([UserId]),

    CONSTRAINT [FK_MappingRole_Role] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[Role] ([Id]),
    CONSTRAINT [FK_MappingRole_Utilisateurs] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Utilisateurs] ([Id])
);

