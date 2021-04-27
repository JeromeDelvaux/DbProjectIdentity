
CREATE PROCEDURE [dbo].[identity_InsertRole]
	
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