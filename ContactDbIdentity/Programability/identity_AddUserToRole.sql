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