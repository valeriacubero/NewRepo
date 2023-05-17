--USE [ProyLenguP]
--GO
USE Lenguajes_Proyecto_VJE
GO

--Insert SuperAdmin
INSERT INTO [dbo].[ACCOUNT]
           ([name]
           ,[email]
           ,[roll]
           ,[userName]
           ,[password])
     VALUES
           ('Super-Admin'
           ,'SuperA@gmail.com'
           ,'superA'
           ,'Super_A_VJE'
           ,'SuperA2023*')

select * from [dbo].[ACCOUNT]
GO

--DROP FUNCTION HasNumbers
--Function to search numbers
CREATE FUNCTION HasNumbers(@String VARCHAR(100))
RETURNS BIT
AS
BEGIN
    RETURN PATINDEX('%[0-9]%', @String)
END
GO

--DROP TYPE ActorList
--Table TYPE to actor list
CREATE TYPE ActorList AS TABLE 
(
    nameT VARCHAR(50) NOT NULL,
	lastNameT VARCHAR(50) NOT NULL,
	birthT DATE NOT NULL
) go
--DROP TYPE GenderList
--Table TYPE to gender list
CREATE TYPE GenderList AS TABLE 
(
    typeG VARCHAR(30) NOT NULL
)
