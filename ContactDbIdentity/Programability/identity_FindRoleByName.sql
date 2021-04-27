CREATE PROCEDURE [dbo].[identity_FindRoleByName]
(
@NormalizedRoleName nvarchar(100)
)
AS
BEGIN
SELECT TOP 1 * FROM [dbo].[Role]
WHERE [Name] = @NormalizedRoleName
END
