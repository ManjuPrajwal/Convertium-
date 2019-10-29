
-------------------------Table-----------------Blog poast------------
CREATE TABLE [dbo].[BlogPostDetails](  
    [BlogID] [int] IDENTITY(1,1) NOT NULL,  
    [Title] [varchar](50) NULL,  
    [Description] [varchar](50) NULL,  
	[Rolid] int,
	[Status] int,
    [ImagePath] [varchar](500) NULL)


-------------------------insert-----------------Blog poast------------

Create PROCEDURE InsertBlogPost

@Title	varchar(max),
@Description  [varchar](50) NULL,  
@ImagePath varchar(max)

AS 
BEGIN

INSERT INTO [dbo].BlogPostDetails
           (Title,
			Description,
			ImagePath,			
			Rolid,
			Status)
     VALUES
           (@Title
           ,@Description
           ,@ImagePath
           ,1
           ,1)

END


-------------------------Fetch-----------------Blog poast------------


create PROCEDURE GetBlogpostDetails



AS 
BEGIN

select * from BlogPostDetails

END

