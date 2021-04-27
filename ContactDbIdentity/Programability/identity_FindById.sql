CREATE PROCEDURE [dbo].[identity_FindById]
	(
@Id int
)
AS
BEGIN
	
SELECT * FROM [dbo].Utilisateurs
WHERE Id = @Id

END
