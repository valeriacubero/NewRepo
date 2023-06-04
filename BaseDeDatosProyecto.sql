--CREATE DATABASE Lenguajes_Proyecto_VJE

--USE Lenguajes_Proyecto_VJE
--GO

---------------------------------------------------
-------------------TABLES--------------------------
---------------------------------------------------

--DROP TABLE ACCOUNT
CREATE TABLE ACCOUNT
(
 idAccount INT IDENTITY(1000,1) NOT NULL PRIMARY KEY, 
 name VARCHAR(70) NOT NULL,
 email VARCHAR(50) NOT NULL,
 roll VARCHAR(10) DEFAULT 'user',
 userName VARCHAR(20) NOT NULL,
 password VARCHAR(20) NOT NULL
)

--DROP TABLE MOVIE
CREATE TABLE MOVIE
(
 idMovie INT IDENTITY(2000,1) NOT NULL PRIMARY KEY, 
 name VARCHAR(50) NOT NULL,
 duration VARCHAR(30) NOT NULL,
 year DATE NOT NULL,
 director VARCHAR(50) NOT NULL,
 distributor VARCHAR(50) NULL,
 img VARCHAR(100) NOT NULL,
 description VARCHAR(2000) NULL
)

--DROP TABLE SERIE
CREATE TABLE SERIE
(
 idSerie INT IDENTITY(3000,1) NOT NULL PRIMARY KEY, 
 name VARCHAR(50) NOT NULL,
 seasons INT NOT NULL,
 year DATE NOT NULL,
 director VARCHAR(50) NOT NULL,
 distributor VARCHAR(50) NULL,
 img VARCHAR(100) NOT NULL,
 description VARCHAR(2000) NULL
)

--DROP TABLE CHAPTER
CREATE TABLE CHAPTER
(
 idChapter INT IDENTITY(4000,1) NOT NULL PRIMARY KEY,
 numChapter INT NOT NULL,
 name VARCHAR(50) NOT NULL,
 duration VARCHAR(30) NOT NULL,
 season INT NOT NULL,
 idSerie INT NOT NULL,
 img VARCHAR(100) NOT NULL,
 description VARCHAR(2000) NULL,
 CONSTRAINT fk_idSerie FOREIGN KEY (idSerie) REFERENCES SERIE (idSerie) ON DELETE CASCADE
)

--DROP TABLE GENDER
CREATE TABLE GENDER
(
 idGender INT IDENTITY(5000,1) NOT NULL PRIMARY KEY,
 typeG VARCHAR(30) NOT NULL,
)

--DROP TABLE ACTOR
CREATE TABLE ACTOR
(
 idActor INT IDENTITY(6000,1) NOT NULL PRIMARY KEY, 
 name VARCHAR(50) NOT NULL,
 lastName VARCHAR(50) NOT NULL,
 birth DATE NOT NULL
)

--DROP TABLE AUDIT
CREATE TABLE AUDIT
(--TABLA QUE GUARDA REGISTRO --SE LLENA CON UNA TABLA TEMPORAL
 idAudit INT IDENTITY(1,1) NOT NULL PRIMARY KEY, 
 action VARCHAR(10) NOT NULL, --Elimin� --Vi� --Guard� --A�adi� --Actualiz�
 date DATETIME DEFAULT GETDATE(),
 tableName VARCHAR(20) NOT NULL,
 nameOf VARCHAR(50) NOT NULL,
 idOf INT NOT NULL,
 description VARCHAR(1000) NULL,
 idUser INT NOT NULL
)

---------------------------------------------------
------------------RELATIONS------------------------
---------------------------------------------------

--DROP TABLE UserMovie
CREATE TABLE UserMovie
(--ESTA TABLA SE LLENA CUANDO EL USER CIERRA LA PESTA�A DE VER PELICULA Y DEJ� SU RESE�A Y VALORACI�N
 idUser INT NOT NULL,
 idMovie INT NOT NULL,
 times DATETIME DEFAULT GETDATE(),--Hora en que puso su rese�a
 stars INT NOT NULL,
 review VARCHAR(8000) NULL,
 CONSTRAINT fk_idUserM FOREIGN KEY (idUser) REFERENCES ACCOUNT (idAccount),
 CONSTRAINT fk_idMovieU FOREIGN KEY (idMovie) REFERENCES MOVIE (idMovie) ON DELETE CASCADE
)

--DROP TABLE UserChapter
CREATE TABLE UserChapter
(--ESTA TABLA SE LLENA CUANDO EL USER CIERRA LA PESTA�A DE VER CAPITULO Y DEJ� SU RESE�A Y VALORACI�N
 idUser INT NOT NULL,
 idChapter INT NOT NULL,
 times DATETIME DEFAULT GETDATE(),--Hora en que puso su rese�a
 stars INT NOT NULL,
 review VARCHAR(8000) NULL,
 CONSTRAINT fk_idUserC FOREIGN KEY (idUser) REFERENCES ACCOUNT (idAccount),
 CONSTRAINT fk_idChapterU FOREIGN KEY (idChapter) REFERENCES CHAPTER (idChapter) ON DELETE CASCADE
)

--DROP TABLE GenderMovie
CREATE TABLE GenderMovie
(
 idGender INT NOT NULL,
 idMovie INT NOT NULL,
 CONSTRAINT fk_idGenderM FOREIGN KEY (idGender) REFERENCES GENDER (idGender) ON DELETE CASCADE,
 CONSTRAINT fk_idMovieG FOREIGN KEY (idMovie) REFERENCES MOVIE (idMovie) ON DELETE CASCADE
)

--DROP TABLE GenderSerie
CREATE TABLE GenderSerie
(
 idGender INT NOT NULL,
 idSerie INT NOT NULL,
 CONSTRAINT fk_idGenderS FOREIGN KEY (idGender) REFERENCES GENDER (idGender) ON DELETE CASCADE,
 CONSTRAINT fk_idSerieG FOREIGN KEY (idSerie) REFERENCES SERIE (idSerie) ON DELETE CASCADE
)

--DROP TABLE ActorMovie
CREATE TABLE ActorMovie
(
 idActor INT NOT NULL,
 idMovie INT NOT NULL,
 CONSTRAINT fk_idActorM FOREIGN KEY (idActor) REFERENCES ACTOR (idActor) ON DELETE CASCADE,
 CONSTRAINT fk_idMovieA FOREIGN KEY (idMovie) REFERENCES MOVIE (idMovie) ON DELETE CASCADE
)

--DROP TABLE ActorSerie
CREATE TABLE ActorSerie
(
 idActor INT NOT NULL,
 idSerie INT NOT NULL,
 CONSTRAINT fk_idActorS FOREIGN KEY (idActor) REFERENCES ACTOR (idActor) ON DELETE CASCADE,
 CONSTRAINT fk_idSerieA FOREIGN KEY (idSerie) REFERENCES SERIE (idSerie) ON DELETE CASCADE
)

------------------------------------------------------------------------
-----------------------------DROP TABLES--------------------------------
------------------------------------------------------------------------
--DROP TABLE ActorSerie
--DROP TABLE ActorMovie
--DROP TABLE GenderSerie
--DROP TABLE GenderMovie
--DROP TABLE UserChapter
--DROP TABLE UserMovie
--DROP TABLE AUDIT
--DROP TABLE ACTOR
--DROP TABLE GENDER
--DROP TABLE CHAPTER
--DROP TABLE SERIE
--DROP TABLE MOVIE
--DROP TABLE ACCOUNT