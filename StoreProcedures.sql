--USE [ProyLenguP]
--GO
USE Lenguajes_Proyecto_VJE
GO

--PROCEDIMIENTOS ALMACENADOS

--DROP PROCEDURE GetPersons
CREATE PROCEDURE GetPersons
AS
BEGIN

SELECT * FROM [dbo].[ACCOUNT]

END
GO

exec GetPersons GO

--DROP PROCEDURE InsertAccounts
CREATE PROCEDURE InsertAccounts--PROCEDIMIENTO QUE INSERTA CUENTAS Y EL REGISTRO
(
	@userID VARCHAR(10), --TENER CUIDADO CON EL USUARIO QUE PASA POR PARAMETROS
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

		SET @userID = TRY_CAST(@userID AS INT)

		IF EXISTS(SELECT [idAccount] FROM [dbo].[ACCOUNT]
				  WHERE [idAccount] = @userID AND dbo.HasNumbers(@name) = 0)
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
		END
		ELSE
		BEGIN
			ROLLBACK TRANSACTION
		END

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION

		SET @ErrorMessage = 'Error: ' + ERROR_MESSAGE() + ' or repeated data'
	END CATCH
SELECT @ErrorMessage AS ErrorMessage
END
GO

exec InsertAccounts 1000, 'User_Account', 'User@gmail.com', 'user', 'User_VJE', 'UserA2023*'

select * from [dbo].[ACCOUNT]
select * from [dbo].[AUDIT]
--GO
---------------------------------------------------------
--DROP PROCEDURE InsertMovie
CREATE PROCEDURE InsertMovie --MOVIE, ACTOR, ActorMovie, GenderMovie, AUDIT
(
	@userID VARCHAR(10),
	@nameM VARCHAR(50),
	@duration VARCHAR(30),
	@year DATE,
	@director VARCHAR(50),
	@distributor VARCHAR(50),
	@img VARCHAR(100),
	@description VARCHAR(2000),
	@actors ActorList READONLY, --Actors List
	@genders GenderList READONLY --Gender List
)
AS
BEGIN
DECLARE @ErrorMessage VARCHAR(200)
	BEGIN TRY
		BEGIN TRANSACTION

		SET @userID = TRY_CAST(@userID AS INT)

		IF EXISTS(SELECT [idAccount] FROM [dbo].[ACCOUNT]--if account exists
				  WHERE [idAccount] = @userID)
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
			           ,[description])
			     VALUES
			           (@nameM
			           ,@duration
			           ,@year
			           ,@director
			           ,@distributor
			           ,@img
			           ,@description)
			
			DECLARE @idMovie INT
			   SET @idMovie = SCOPE_IDENTITY() --To get the generated auto-id
			
			IF NOT EXISTS(SELECT name, lastName, birth FROM ACTOR
					  WHERE name IN (SELECT DISTINCT nameT FROM @actors)
					  AND lastName IN (SELECT DISTINCT lastNameT FROM @actors))
				BEGIN
					INSERT INTO ACTOR (name, lastName, birth)
					    SELECT nameT, lastNameT, birthT FROM @actors --To insert the actor list into the actor table
				END
			DECLARE @newActors TABLE (idActor INT)
			INSERT INTO @newActors (idActor)
			SELECT idActor --To get all new actor ids
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
		END
		END
		ELSE
		BEGIN
			ROLLBACK TRANSACTION
		END
			COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION

		SET @ErrorMessage = 'Error: ' + ERROR_MESSAGE() + ' or repeated data'
	END CATCH
SELECT @ErrorMessage AS ErrorMessage --if == null, successful
END
GO

--------------------------------------------------------PRUEBAS----------------------------------------------------------------
--DECLARE @actors ActorList;

--INSERT INTO @actors (nameT, lastNameT, birthT)
--VALUES ('John', 'Doe', '2012-12-12'), ('Jane', 'Mae', '1963-05-30'), ('Bob', 'Smith', '2000-04-05');

--DECLARE @genders GenderList;

--INSERT INTO @genders (typeG)
--VALUES ('Terror'), ('Comedy');

--EXEC InsertMovie 1000, 'Robot', '1h 45m', '2020-02-02', 'Pablo M', 'Warner Bros', 'xxx', 'Peli muy buena', @actors, @genders;
--------------------------------------------------------------------------------------------------------------------------------
 
 --INSERT INTO [dbo].[GENDER]
 --          ([typeG])
 --    VALUES
 --          --('Terror')
	--	   --('Comedy')
	--	   ('Drama')

select * from GENDER
select * from MOVIE
select * from ACTOR
select * from ActorMovie
select * from GenderMovie
select * from AUDIT


