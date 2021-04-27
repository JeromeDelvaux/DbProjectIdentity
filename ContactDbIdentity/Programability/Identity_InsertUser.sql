CREATE PROCEDURE [dbo].[identity_InsertUser]
	
@LastName NVARCHAR(50),
	@FirstName NVARCHAR(50),
	@Email NVARCHAR(384),
	@Passwd NVARCHAR(max),
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
