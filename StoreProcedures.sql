USE Lenguajes_Proyecto_VJE
GO
--PROCEDIMIENTOS ALMACENADOS

--SP TO GET ALL ACCOUNTS
--DROP PROCEDURE GetAllAccounts
CREATE PROCEDURE GetAllAccounts
AS
BEGIN
	DECLARE @ErrorMessage VARCHAR(200)
	
	IF EXISTS(SELECT * FROM ACCOUNT)
		BEGIN
			SELECT * FROM ACCOUNT
		END
	ELSE
		BEGIN
			SET @ErrorMessage = 'There is not accounts in the data base'
			SELECT @ErrorMessage
		END
END
GO
--SP TO GET ALL ACCOUNTS
--DROP PROCEDURE GetAdminsAccounts
CREATE PROCEDURE GetAdminsAccounts
AS
BEGIN
	DECLARE @ErrorMessage VARCHAR(200)
	
	IF EXISTS(SELECT * FROM ACCOUNT WHERE roll = 'admin')
		BEGIN
			SELECT * FROM ACCOUNT WHERE roll = 'admin'
		END
	ELSE
		BEGIN
			SET @ErrorMessage = 'There is not admins accounts in the data base'
			SELECT @ErrorMessage
		END
END
GO
--SP TO GET ALL ACCOUNTS
--DROP PROCEDURE GetUsersAccounts
CREATE PROCEDURE GetUsersAccounts
AS
BEGIN
	DECLARE @ErrorMessage VARCHAR(200)
	
	IF EXISTS(SELECT * FROM ACCOUNT WHERE roll = 'user')
		BEGIN
			SELECT * FROM ACCOUNT WHERE roll = 'user'
		END
	ELSE
		BEGIN
			SET @ErrorMessage = 'There is not users accounts in the data base'
			SELECT @ErrorMessage
		END
END
GO
--SP TO DELETE ACCOUNTS
--DROP PROCEDURE DeleteAccount
CREATE PROCEDURE DeleteAccount
(
	@userAccount VARCHAR(50),
	@idAccount VARCHAR(50)
)
AS
BEGIN
DECLARE @ErrorMessage VARCHAR(200)
	BEGIN TRY
		BEGIN TRANSACTION

		DECLARE @userID INT, @role VARCHAR(20), @name VARCHAR(50)

		SET @userID = (SELECT idAccount FROM ACCOUNT WHERE userName like @userAccount)
		SET @idAccount = CAST(@idAccount AS INT)
		SET @role = (SELECT roll FROM ACCOUNT WHERE idAccount = @idAccount)
		SET @name = (SELECT name FROM ACCOUNT WHERE idAccount = @idAccount)

		IF EXISTS(SELECT [idAccount] FROM [dbo].[ACCOUNT]
				  WHERE [idAccount] = @idAccount)
		   BEGIN
				IF EXISTS(SELECT [idAccount] FROM [dbo].[ACCOUNT]
						  WHERE [idAccount] = @userID AND [roll] = 'superA')
				   BEGIN
						DELETE FROM ACCOUNT WHERE idAccount = @idAccount

						INSERT INTO [dbo].[AUDIT]
					           ([action]
					           ,[tableName]
					           ,[nameOf]
					           ,[idOf]
					           ,[description]
					           ,[idUser])
					     VALUES
					           ('DELETE'
					           ,'ACCOUNT'
					           ,@name
					           ,@idAccount
					           ,'Permanently deleting account.'
					           ,@userID)
				   END
				ELSE
				IF EXISTS(SELECT [idAccount] FROM [dbo].[ACCOUNT]
						  WHERE [idAccount] = @userID AND [roll] = 'admin' AND @role = 'user')
				   BEGIN
						DELETE FROM ACCOUNT WHERE idAccount = @idAccount

						INSERT INTO [dbo].[AUDIT]
					           ([action]
					           ,[tableName]
					           ,[nameOf]
					           ,[idOf]
					           ,[description]
					           ,[idUser])
					     VALUES
					           ('DELETE'
					           ,'ACCOUNT'
					           ,@name
					           ,@idAccount
					           ,'Permanently deleting account.'
					           ,@userID)
				   END
				ELSE
					BEGIN
						 SET @ErrorMessage = 'Error: You do not have permission to perform this action'
						 ROLLBACK TRANSACTION
					END
		END
		ELSE 
			BEGIN
				 SET @ErrorMessage = 'Error: The account does not exist'
				 ROLLBACK TRANSACTION
			END
	COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		IF (@ErrorMessage != 'NULL')
			BEGIN
				SET @ErrorMessage = @ErrorMessage + ' ' +ERROR_MESSAGE()
			END
		ELSE 
			BEGIN
				SET @ErrorMessage = ERROR_MESSAGE()
			END
		IF @@TRANCOUNT > 0
			BEGIN
				ROLLBACK TRANSACTION
			END
	END CATCH
SELECT @ErrorMessage AS ErrorMessage
END
GO
--SP TO UPDATE ACCOUNTS
--DROP PROCEDURE UpdateAccount
CREATE PROCEDURE UpdateAccount
(
	@userAccount VARCHAR(50),
	@idAccount VARCHAR(50),
	@name VARCHAR(70),
	@email VARCHAR(50),
	@username VARCHAR(20),
	@password VARCHAR(20),
	@img VARCHAR(2000)
)
AS
BEGIN
DECLARE @ErrorMessage VARCHAR(200)
	BEGIN TRY
		BEGIN TRANSACTION

		DECLARE @userID INT, @role VARCHAR(20)

		SET @userID = (SELECT idAccount FROM ACCOUNT WHERE userName like @userAccount)
		SET @idAccount = CAST(@idAccount AS INT)
		SET @role = (SELECT roll FROM ACCOUNT WHERE idAccount = @idAccount)

		IF EXISTS(SELECT [idAccount] FROM [dbo].[ACCOUNT]
				  WHERE [idAccount] = @idAccount AND dbo.HasNumbers(@name) = 0)
		   BEGIN
				IF EXISTS(SELECT [idAccount] FROM [dbo].[ACCOUNT]
						  WHERE [idAccount] = @userID AND [roll] = 'superA')
				   BEGIN
						UPDATE ACCOUNT SET name = @name WHERE idAccount = @idAccount
						UPDATE ACCOUNT SET email = @email WHERE idAccount = @idAccount
						UPDATE ACCOUNT SET username = @username WHERE idAccount = @idAccount
						UPDATE ACCOUNT SET password = @password WHERE idAccount = @idAccount
						UPDATE ACCOUNT SET img = @img WHERE idAccount = @idAccount

						INSERT INTO [dbo].[AUDIT]
					           ([action]
					           ,[tableName]
					           ,[nameOf]
					           ,[idOf]
					           ,[description]
					           ,[idUser])
					     VALUES
					           ('UPDATE'
					           ,'ACCOUNT'
					           ,@name
					           ,@idAccount
					           ,'Updated account.'
					           ,@userID)
				   END
				ELSE
				IF EXISTS(SELECT [idAccount] FROM [dbo].[ACCOUNT]
						  WHERE [idAccount] = @userID AND [roll] = 'admin' AND @role = 'user')
				   BEGIN
						UPDATE ACCOUNT SET name = @name WHERE idAccount = @idAccount
						UPDATE ACCOUNT SET email = @email WHERE idAccount = @idAccount
						UPDATE ACCOUNT SET username = @username WHERE idAccount = @idAccount
						UPDATE ACCOUNT SET password = @password WHERE idAccount = @idAccount
						UPDATE ACCOUNT SET img = @img WHERE idAccount = @idAccount

						INSERT INTO [dbo].[AUDIT]
					           ([action]
					           ,[tableName]
					           ,[nameOf]
					           ,[idOf]
					           ,[description]
					           ,[idUser])
					     VALUES
					           ('UPDATE'
					           ,'ACCOUNT'
					           ,@name
					           ,@idAccount
					           ,'Updated account.'
					           ,@userID)
				   END
				ELSE
					BEGIN
						 SET @ErrorMessage = 'Error: You do not have permission to perform this action'
						 ROLLBACK TRANSACTION
					END
		END
		ELSE 
			BEGIN
				 SET @ErrorMessage = 'Error: The account does not exist or the name it is not correct'
				 ROLLBACK TRANSACTION
			END
	COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		IF (@ErrorMessage != 'NULL')
			BEGIN
				SET @ErrorMessage = @ErrorMessage + ' ' +ERROR_MESSAGE()
			END
		ELSE 
			BEGIN
				SET @ErrorMessage = ERROR_MESSAGE()
			END
		IF @@TRANCOUNT > 0
			BEGIN
				ROLLBACK TRANSACTION
			END
	END CATCH
SELECT @ErrorMessage AS ErrorMessage
END
GO
--SP TO UPDATE ACCOUNTS
--DROP PROCEDURE UpdateMyAccount
CREATE PROCEDURE UpdateMyAccount
(
	@userAccount VARCHAR(50),
	@idAccount VARCHAR(50),
	@name VARCHAR(70),
	@email VARCHAR(50),
	@username VARCHAR(20),
	@password VARCHAR(20),
	@img VARCHAR(2000)
)
AS
BEGIN
DECLARE @ErrorMessage VARCHAR(200)
	BEGIN TRY
		BEGIN TRANSACTION

		DECLARE @userID INT, @role VARCHAR(20)

		SET @userID = (SELECT idAccount FROM ACCOUNT WHERE userName like @userAccount)
		SET @idAccount = CAST(@idAccount AS INT)

		IF EXISTS(SELECT [idAccount] FROM [dbo].[ACCOUNT]
				  WHERE [idAccount] = @idAccount AND dbo.HasNumbers(@name) = 0)
			BEGIN
						UPDATE ACCOUNT SET name = @name WHERE idAccount = @idAccount
						UPDATE ACCOUNT SET email = @email WHERE idAccount = @idAccount
						UPDATE ACCOUNT SET username = @username WHERE idAccount = @idAccount
						UPDATE ACCOUNT SET password = @password WHERE idAccount = @idAccount
						UPDATE ACCOUNT SET img = @img WHERE idAccount = @idAccount

						INSERT INTO [dbo].[AUDIT]
					           ([action]
					           ,[tableName]
					           ,[nameOf]
					           ,[idOf]
					           ,[description]
					           ,[idUser])
					     VALUES
					           ('UPDATE'
					           ,'ACCOUNT'
					           ,@name
					           ,@idAccount
					           ,'Update my account.'
					           ,@userID)
			END
		ELSE 
			BEGIN
				 SET @ErrorMessage = 'Error: The account does not exist or the name it is not correct'
				 ROLLBACK TRANSACTION
			END
	COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		IF (@ErrorMessage != 'NULL')
			BEGIN
				SET @ErrorMessage = @ErrorMessage + ' ' +ERROR_MESSAGE()
			END
		ELSE 
			BEGIN
				SET @ErrorMessage = ERROR_MESSAGE()
			END
		IF @@TRANCOUNT > 0
			BEGIN
				ROLLBACK TRANSACTION
			END
	END CATCH
SELECT @ErrorMessage AS ErrorMessage
END
GO
--SP TO ADD ACCOUNTS
--DROP PROCEDURE InsertAccounts
CREATE PROCEDURE InsertAccounts
(
	@userAccount VARCHAR(50),
	@name VARCHAR(70),
	@email VARCHAR(50),
	@roll VARCHAR(10),
	@userName VARCHAR(20),
	@password VARCHAR(20)
)
AS
BEGIN
DECLARE @ErrorMessage VARCHAR(200)
	BEGIN TRY
		BEGIN TRANSACTION

		DECLARE @userID INT
		SET @userID = (SELECT idAccount FROM ACCOUNT WHERE userName like @userAccount)

		IF EXISTS(SELECT [idAccount] FROM [dbo].[ACCOUNT]
				  WHERE [idAccount] = @userID AND [roll] != 'user' AND dbo.HasNumbers(@name) = 0)
			BEGIN
				IF NOT EXISTS(SELECT [email], [userName], [password]
						  FROM [dbo].[ACCOUNT]
						  WHERE email = @email OR userName = @userName OR [password] = @password)
				BEGIN					
					INSERT INTO [dbo].[ACCOUNT]
					           ([name]
					           ,[email]
					           ,[roll]
					           ,[userName]
					           ,[password])
					     VALUES
					           (@name
					           ,@email
					           ,@roll
					           ,@userName
					           ,@password)
					
					INSERT INTO [dbo].[AUDIT]
					           ([action]
					           ,[tableName]
					           ,[nameOf]
					           ,[idOf]
					           ,[description]
					           ,[idUser])
					     VALUES
					           ('Insert'
					           ,'ACCOUNT'
					           ,@name
					           ,SCOPE_IDENTITY()
					           ,'Adding a new account'
					           ,@userID)
				END
				ELSE
				BEGIN
					SET @ErrorMessage = 'Error: email, username or password already exist'
					ROLLBACK TRANSACTION
				END
			END
			ELSE
			BEGIN
				SET @ErrorMessage = 'Error: superadmin or admin account does not exist or does not have permission or the name has numbers'
				ROLLBACK TRANSACTION
			END
	COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		IF (@ErrorMessage != 'NULL')
			BEGIN
				SET @ErrorMessage = @ErrorMessage + ' ' +ERROR_MESSAGE()
			END
		ELSE 
			BEGIN
				SET @ErrorMessage = ERROR_MESSAGE()
			END
		IF @@TRANCOUNT > 0
			BEGIN
				ROLLBACK TRANSACTION
			END
	END CATCH
SELECT @ErrorMessage AS ErrorMessage
END
GO
--SP TO ADD MOVIES
--DROP PROCEDURE InsertMovie
CREATE PROCEDURE InsertMovie 
(
	@userID VARCHAR(10),
	@nameM VARCHAR(50),
	@duration VARCHAR(30),
	@year DATE,
	@director VARCHAR(50),
	@distributor VARCHAR(50),
	@img VARCHAR(100),
	@description VARCHAR(2000),
	@trailer VARCHAR(5000),
	@actors ActorList READONLY, --Actors List
	@genders GenderList READONLY --Gender List
)
AS
BEGIN
DECLARE @ErrorMessage VARCHAR(200)
	BEGIN TRY
		BEGIN TRANSACTION;
		SET @userID = CAST(@userID AS INT)

		IF EXISTS(SELECT [idAccount] FROM [dbo].[ACCOUNT]--if account exists
				  WHERE [idAccount] = @userID AND [roll] = 'admin')
		BEGIN
			IF EXISTS(SELECT [typeG] FROM [dbo].[GENDER] --if gender exists
						  WHERE [typeG] IN (SELECT DISTINCT typeG FROM @genders))
			BEGIN
				IF NOT EXISTS(SELECT [name], [img]
						  FROM [dbo].[MOVIE]
						  WHERE [name] = @nameM OR [img] = @img)
				BEGIN
					INSERT INTO [dbo].[MOVIE]
					           ([name]
					           ,[duration]
					           ,[year]
					           ,[director]
					           ,[distributor]
					           ,[img]
					           ,[description]
							   ,[trailer])
					     VALUES
					           (@nameM
					           ,@duration
					           ,@year
					           ,@director
					           ,@distributor
					           ,@img
					           ,@description
							   ,@trailer)
					DECLARE @idMovie INT
					SET @idMovie = SCOPE_IDENTITY() --To get the generated auto-id
					
					INSERT INTO ACTOR (name, lastName, birth, img)
					SELECT nameT, lastNameT, birthT, imgT
					FROM @actors a
					WHERE NOT EXISTS (
					    SELECT 1
					    FROM ACTOR ac
					    WHERE ac.name = a.nameT AND ac.lastName = a.lastNameT
					)
					DECLARE @newActors TABLE (idActor INT)
					INSERT INTO @newActors (idActor)
					SELECT idActor --To get all actor ids
					FROM ACTOR
					WHERE name IN (SELECT DISTINCT nameT FROM @actors)
					AND lastName IN (SELECT DISTINCT lastNameT FROM @actors)

					INSERT INTO ActorMovie(idMovie, idActor)
					SELECT @idMovie, idActor
					FROM @newActors --We fill the table ActorMovie

					DECLARE @genderIDs TABLE (idGender INT)--Temp table

					INSERT INTO @genderIDs (idGender)
					SELECT g.idGender
					FROM [dbo].[GENDER] g
					INNER JOIN @genders t 
						ON g.typeG = t.typeG

					INSERT INTO GenderMovie (idGender, idMovie)
					SELECT idGender, @idMovie
					FROM @genderIDs

					INSERT INTO [dbo].[AUDIT]
						           ([action]
						           ,[tableName]
						           ,[nameOf]
						           ,[idOf]
						           ,[description]
						           ,[idUser])
						     VALUES
						           ('Insert'
						           ,'MOVIE'
						           ,@nameM
						           ,@idMovie
						           ,'Adding a movie with its actors and its relationships: GenderMovie and ActorsMovie'
						           ,@userID)
				END
				ELSE
				BEGIN
					SET @ErrorMessage = 'Error: it is the same name or img.'
					ROLLBACK TRANSACTION
				END
			END
			ELSE
			BEGIN
				SET @ErrorMessage = 'Error: the gender does not exist.'
				ROLLBACK TRANSACTION
			END
		END
		ELSE
		BEGIN
			SET @ErrorMessage = 'Error: the admin account does not exist or does not have permissions for this action.'
			ROLLBACK TRANSACTION
		END
			COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		IF (@ErrorMessage != 'NULL')
			BEGIN
				SET @ErrorMessage = @ErrorMessage + ' ' +ERROR_MESSAGE()
			END
		ELSE 
			BEGIN
				SET @ErrorMessage = ERROR_MESSAGE()
			END
		IF @@TRANCOUNT > 0
			BEGIN
				ROLLBACK TRANSACTION
			END
	END CATCH
SELECT @ErrorMessage AS ErrorMessage --if == null, successful
END
GO
--SP TO ADD SERIES
--DROP PROCEDURE InsertSerie
CREATE PROCEDURE InsertSerie --SERIE, ACTOR, ActorSerie, GenderSerie, AUDIT
(
	@userID VARCHAR(10),
	@nameS VARCHAR(50),
	@seasons VARCHAR(10),
	@year DATE,
	@director VARCHAR(50),
	@distributor VARCHAR(50),
	@img VARCHAR(100),
	@description VARCHAR(2000),
	@trailer VARCHAR(5000),
	@actors ActorList READONLY, --Actors List
	@genders GenderList READONLY --Gender List
)
AS
BEGIN
DECLARE @ErrorMessage VARCHAR(200)
	BEGIN TRY
		BEGIN TRANSACTION
		--to catch varchar error
		SET @userID = CAST(@userID AS INT)
		SET @seasons = CAST(@seasons AS INT)

		IF EXISTS(SELECT [idAccount] FROM [dbo].[ACCOUNT]--if account exists
				  WHERE [idAccount] = @userID AND [roll] = 'admin')
		BEGIN
			IF EXISTS(SELECT [typeG] FROM [dbo].[GENDER] --if gender exists
						  WHERE [typeG] IN (SELECT DISTINCT typeG FROM @genders))
			BEGIN
				IF NOT EXISTS(SELECT [name], [img]
						  FROM [dbo].[SERIE]
						  WHERE [name] = @nameS OR [img] = @img)
				BEGIN
					INSERT INTO [dbo].[SERIE]
					           ([name]
					           ,[seasons]
					           ,[year]
					           ,[director]
					           ,[distributor]
					           ,[img]
					           ,[description]
							   ,[trailer])
					     VALUES
					           (@nameS
					           ,@seasons
					           ,@year
					           ,@director
					           ,@distributor
					           ,@img
					           ,@description
							   ,@trailer)					
					DECLARE @idSerie INT
					   SET @idSerie = SCOPE_IDENTITY() --To get the generated auto-id
					
					INSERT INTO ACTOR (name, lastName, birth, img)
					SELECT nameT, lastNameT, birthT, imgT
					FROM @actors a
					WHERE NOT EXISTS (
					    SELECT 1
					    FROM ACTOR ac
					    WHERE ac.name = a.nameT AND ac.lastName = a.lastNameT
					)
					DECLARE @newActors TABLE (idActor INT)
					INSERT INTO @newActors (idActor)
					SELECT idActor --To get all actor ids
					FROM ACTOR
					WHERE name IN (SELECT DISTINCT nameT FROM @actors)
					AND lastName IN (SELECT DISTINCT lastNameT FROM @actors)

					INSERT INTO ActorSerie(idSerie, idActor)
					SELECT @idSerie, idActor
					FROM @newActors --We fill the table ActorMovie

					DECLARE @genderIDs TABLE (idGender INT)--Temp table

					INSERT INTO @genderIDs (idGender)
					SELECT g.idGender
					FROM [dbo].[GENDER] g
					INNER JOIN @genders t 
						ON g.typeG = t.typeG

					INSERT INTO GenderSerie (idGender, idSerie)
					SELECT idGender, @idSerie
					FROM @genderIDs

					INSERT INTO [dbo].[AUDIT]
						           ([action]
						           ,[tableName]
						           ,[nameOf]
						           ,[idOf]
						           ,[description]
						           ,[idUser])
						     VALUES
						           ('Insert'
						           ,'SERIE'
						           ,@nameS
						           ,@idSerie
						           ,'Adding a serie with its actors and its relationships: GenderSerie and ActorsSerie'
						           ,@userID)
				END
				ELSE
				BEGIN
					SET @ErrorMessage = 'Error: it is the same name or img.'
					ROLLBACK TRANSACTION
				END
			END
			ELSE
			BEGIN
				SET @ErrorMessage = 'Error: the gender does not exist.'
				ROLLBACK TRANSACTION
			END
		END
		ELSE
		BEGIN
			SET @ErrorMessage = 'Error: the admin account does not exist or does not have permissions for this action.'
			ROLLBACK TRANSACTION
		END
	COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		IF (@ErrorMessage != 'NULL')
			BEGIN
				SET @ErrorMessage = @ErrorMessage + ' ' +ERROR_MESSAGE()
			END
		ELSE 
			BEGIN
				SET @ErrorMessage = ERROR_MESSAGE()
			END
		IF @@TRANCOUNT > 0
			BEGIN
				ROLLBACK TRANSACTION
			END
	END CATCH
SELECT @ErrorMessage AS ErrorMessage --if == null, successful
END
GO
--SP TO ADD CHAPTERS
--DROP PROCEDURE InsertChapter
CREATE PROCEDURE InsertChapter --Chapter, Serie, AUDIT
(
	@userID VARCHAR(10),
	@numChapter VARCHAR(10),
	@nameC VARCHAR(50),
	@duration VARCHAR(30),
	@season VARCHAR(10),
	@idSerie VARCHAR(10),
	@img VARCHAR(100),
	@description VARCHAR(2000)
)
AS
BEGIN
DECLARE @ErrorMessage VARCHAR(200)
	BEGIN TRY
		BEGIN TRANSACTION
		--to catch varchar error
		SET @userID = CAST(@userID AS INT)
		SET @numChapter = CAST(@numChapter AS INT)
		SET @season = CAST(@season AS INT)
		SET @idSerie = CAST(@idSerie AS INT)

		IF EXISTS(SELECT [idAccount] FROM [dbo].[ACCOUNT]--if account exists
				  WHERE [idAccount] = @userID AND [roll] = 'admin')
		BEGIN
			IF EXISTS(SELECT [idSerie] FROM [dbo].[SERIE]
					  WHERE [idSerie] = @idSerie)
			BEGIN
				IF NOT EXISTS(SELECT [name], [img]
						  FROM [dbo].[CHAPTER]
						  WHERE [name] = @nameC OR [img] = @img)
				BEGIN
					INSERT INTO [dbo].[CHAPTER]
							  ([numChapter]
							  ,[name]
							  ,[duration]
							  ,[season]
							  ,[idSerie]
							  ,[img]
							  ,[description])
					     VALUES
					           (@numChapter
							   ,@nameC
					           ,@duration
					           ,@season
					           ,@idSerie
					           ,@img
					           ,@description)					

					INSERT INTO [dbo].[AUDIT]
						           ([action]
						           ,[tableName]
						           ,[nameOf]
						           ,[idOf]
						           ,[description]
						           ,[idUser])
						     VALUES
						           ('Insert'
						           ,'CHAPTER'
						           ,@nameC
						           ,SCOPE_IDENTITY()
						           ,'Adding a chapter for the serie: '+ @nameC
						           ,@userID)
				END
				ELSE
				BEGIN
					SET @ErrorMessage = 'Error: it is the same name or img.'
					ROLLBACK TRANSACTION
				END
			END
			ELSE
			BEGIN
				SET @ErrorMessage = 'Error: this serie does not exist in our data base.'
				ROLLBACK TRANSACTION
			END
		END
		ELSE
		BEGIN
			SET @ErrorMessage = 'Error: the admin account does not exist or does not have permissions for this action.'
			ROLLBACK TRANSACTION
		END
	COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		IF (@ErrorMessage != 'NULL')
			BEGIN
				SET @ErrorMessage = @ErrorMessage + ' ' +ERROR_MESSAGE()
			END
		ELSE 
			BEGIN
				SET @ErrorMessage = ERROR_MESSAGE()
			END
		IF @@TRANCOUNT > 0
			BEGIN
				ROLLBACK TRANSACTION
			END
	END CATCH
SELECT @ErrorMessage AS ErrorMessage --if == null, successful
END
GO

CREATE PROCEDURE SelectMovies
AS
BEGIN
DECLARE @ErrorMessage VARCHAR(200)
	
	IF EXISTS(SELECT * FROM MOVIE)
		BEGIN
			SELECT * FROM MOVIE
		END
	ELSE
		BEGIN
			SET @ErrorMessage = 'There is not movies in the data base'
			SELECT @ErrorMessage
		END
END