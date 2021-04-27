CREATE PROCEDURE [dbo].[identity_FindByEmail]
(
	@Email nvarchar(384)
)
AS
BEGIN
	
SELECT * FROM [dbo].[Utilisateurs]
WHERE [Email] = @Email
END