



 
 CREATE TABLE [dbo].[Role](    
      [role_id] [int] IDENTITY(1,1) NOT NULL,    
      [role] [nvarchar](max) NOT NULL,    
  CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED     
 (    
      [role_id] ASC    
 )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]    
 ) ON [PRIMARY]    


   
 SET IDENTITY_INSERT [dbo].[Role] ON    
 INSERT [dbo].[Role] ([role_id], [role]) VALUES (1, N'Admin')    
 INSERT [dbo].[Role] ([role_id], [role]) VALUES (2, N'Editor')    
 SET IDENTITY_INSERT [dbo].[Role] OFF 
 
    
 /****** Object: Table [dbo].[Login]  ******/    
 SET ANSI_NULLS ON    
 GO    
 SET QUOTED_IDENTIFIER ON    
 GO    
 SET ANSI_PADDING ON    
 GO    
 IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Login]') AND type in (N'U'))    
 BEGIN    
 CREATE TABLE [dbo].[Login](    
      [id] [int] IDENTITY(1,1) NOT NULL,    
      [username] [varchar](50) NOT NULL,    
      [password] [varchar](50) NOT NULL,    
      [role_id] [int] NOT NULL,    
  CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED     
 (    
      [id] ASC    
 )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]    
 ) ON [PRIMARY]    
 END    
 GO    


 SET ANSI_PADDING OFF    
 GO    
 SET IDENTITY_INSERT [dbo].[Login] ON    
 INSERT [dbo].[Login] ([id], [username], [password], [role_id]) VALUES (1, N'admin', N'admin', 1)    
 INSERT [dbo].[Login] ([id], [username], [password], [role_id]) VALUES (2, N'editor', N'editor', 2)    
 SET IDENTITY_INSERT [dbo].[Login] OFF    



 /****** Object: StoredProcedure [dbo].[LoginByUsernamePassword]  Script Date: 04/30/2016 16:32:59 ******/    
 SET ANSI_NULLS ON    
 GO    
 SET QUOTED_IDENTIFIER ON    
 GO    
 IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LoginByUsernamePassword]') AND type in (N'P', N'PC'))    
 BEGIN    
 EXEC dbo.sp_executesql @statement = N'-- =============================================    
 -- Author:          <Author,,Name>    
 -- Create date: <Create Date,,>    
 -- Description:     <Description,,>    
 -- =============================================    
 CREATE PROCEDURE [dbo].[LoginByUsernamePassword]     
      @username varchar(50),    
      @password varchar(50)    
 AS    
 BEGIN    
      SELECT id, username, password, role_id    
      FROM Login    
      WHERE username = @username    
      AND password = @password    
 END    
 '     
 END    


 ---------------------------------------------
 GO    
 /****** Object: ForeignKey [R_10]  Script Date: 04/30/2016 16:32:55 ******/    
 IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_10]') AND parent_object_id = OBJECT_ID(N'[dbo].[Login]'))    
 ALTER TABLE [dbo].[Login] WITH CHECK ADD CONSTRAINT [R_10] FOREIGN KEY([role_id])    
 REFERENCES [dbo].[Role] ([role_id])    
 ON UPDATE CASCADE    
 ON DELETE CASCADE    
 GO    
 IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_10]') AND parent_object_id = OBJECT_ID(N'[dbo].[Login]'))    
 ALTER TABLE [dbo].[Login] CHECK CONSTRAINT [R_10]    
 GO  


  SELECT * FROM [Login] 
  SELECT * FROM [Role] 