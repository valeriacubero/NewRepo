USE Lenguajes_Proyecto_VJE

ALTER TABLE MOVIE ADD trailer varchar(5000)
ALTER TABLE MOVIE ALTER COLUMN img varchar(2000)


--procedimientos para obtener peliculas por genero
CREATE PROCEDURE GetComedyMovies 
AS
BEGIN
	SELECT M.[idMovie]
      ,M.[name]
      ,M.[duration]
      ,M.[year]
      ,M.[director]
      ,M.[distributor]
      ,M.[img]
      ,M.[description]
      ,M.[trailer]
  FROM MOVIE M, GenderMovie G
  WHERE M.idMovie = G.idMovie and G.idGender = 5001
END
GO

CREATE PROCEDURE GetAnimatedMovies 
AS
BEGIN
	SELECT M.[idMovie]
      ,M.[name]
      ,M.[duration]
      ,M.[year]
      ,M.[director]
      ,M.[distributor]
      ,M.[img]
      ,M.[description]
      ,M.[trailer]
  FROM MOVIE M, GenderMovie G
  WHERE M.idMovie = G.idMovie and G.idGender = 5003
END
GO



CREATE PROCEDURE GetActionMovies 
AS
BEGIN
	SELECT M.[idMovie]
      ,M.[name]
      ,M.[duration]
      ,M.[year]
      ,M.[director]
      ,M.[distributor]
      ,M.[img]
      ,M.[description]
      ,M.[trailer]
  FROM MOVIE M, GenderMovie G
  WHERE M.idMovie = G.idMovie and G.idGender = 5004
END
GO

CREATE PROCEDURE GetDramaMovies 
AS
BEGIN
	SELECT M.[idMovie]
      ,M.[name]
      ,M.[duration]
      ,M.[year]
      ,M.[director]
      ,M.[distributor]
      ,M.[img]
      ,M.[description]
      ,M.[trailer]
  FROM MOVIE M, GenderMovie G
  WHERE M.idMovie = G.idMovie and G.idGender = 5000
END
GO


CREATE PROCEDURE GetSuspenseMovies 
AS
BEGIN
	SELECT M.[idMovie]
      ,M.[name]
      ,M.[duration]
      ,M.[year]
      ,M.[director]
      ,M.[distributor]
      ,M.[img]
      ,M.[description]
      ,M.[trailer]
  FROM MOVIE M, GenderMovie G
  WHERE M.idMovie = G.idMovie and G.idGender = 5005
END
GO

CREATE PROCEDURE GetRomanceMovies 
AS
BEGIN
	SELECT M.[idMovie]
      ,M.[name]
      ,M.[duration]
      ,M.[year]
      ,M.[director]
      ,M.[distributor]
      ,M.[img]
      ,M.[description]
      ,M.[trailer]
  FROM MOVIE M, GenderMovie G
  WHERE M.idMovie = G.idMovie and G.idGender = 5006
END
GO

CREATE PROCEDURE GetAdventureMovies 
AS
BEGIN
	SELECT M.[idMovie]
      ,M.[name]
      ,M.[duration]
      ,M.[year]
      ,M.[director]
      ,M.[distributor]
      ,M.[img]
      ,M.[description]
      ,M.[trailer]
  FROM MOVIE M, GenderMovie G
  WHERE M.idMovie = G.idMovie and G.idGender = 5007
END
GO

CREATE PROCEDURE GetScienceMovies 
AS
BEGIN
	SELECT M.[idMovie]
      ,M.[name]
      ,M.[duration]
      ,M.[year]
      ,M.[director]
      ,M.[distributor]
      ,M.[img]
      ,M.[description]
      ,M.[trailer]
  FROM MOVIE M, GenderMovie G
  WHERE M.idMovie = G.idMovie and G.idGender = 5009
END
GO

CREATE PROCEDURE GetHorrorMovies 
AS
BEGIN
	SELECT M.[idMovie]
      ,M.[name]
      ,M.[duration]
      ,M.[year]
      ,M.[director]
      ,M.[distributor]
      ,M.[img]
      ,M.[description]
      ,M.[trailer]
  FROM MOVIE M, GenderMovie G
  WHERE M.idMovie = G.idMovie and G.idGender = 5011
END
GO

CREATE PROCEDURE GetMovie(
	@id int
)
AS
BEGIN
	SELECT M.[idMovie]
      ,M.[name]
      ,M.[duration]
      ,M.[year]
      ,M.[director]
      ,M.[distributor]
      ,M.[img]
      ,M.[description]
      ,M.[trailer]
  FROM MOVIE M
  WHERE M.idMovie = @id
END
GO

EXEC GetMovies

--UPDATES COMEDY
UPDATE MOVIE SET img = 
	'https://m.media-amazon.com/images/M/MV5BY2QwZWJlZjMtNzU5NC00NTA0LWI1MjQtYWQ1ZTg4NWZmNjdkXkEyXkFqcGdeQXVyMTEyMjM2NDc2._V1_QL75_UX190_CR0,0,190,281_.jpg' 
	WHERE name = 'Wrong Missy'
UPDATE MOVIE SET trailer = 
	'https://www.youtube.com/embed/2Cwaneq2w-4' 
	WHERE name = 'Wrong Missy'

UPDATE MOVIE SET img = 
	'https://m.media-amazon.com/images/I/51AMyXw-IHL._AC_UF894,1000_QL80_.jpg' 
	WHERE name = 'Grown Ups'
UPDATE MOVIE SET trailer = 
	'https://www.youtube.com/embed/e01NVCveGkg' 
	WHERE name = 'Grown Ups'

UPDATE MOVIE SET img = 
	'https://m.media-amazon.com/images/I/91VV7XgZEoL._AC_UF894,1000_QL80_.jpg' 
	WHERE name = 'We are the Millers'
UPDATE MOVIE SET trailer = 
	'https://www.youtube.com/embed/0Vsy5KzsieQ' 
	WHERE name = 'We are the Millers'

UPDATE MOVIE SET img = 
	'https://guilfordfreelibrary.org/wp-content/uploads/2016/03/THE-INTERN-Movie-Poster.jpg' 
	WHERE name = 'The Intern'
UPDATE MOVIE SET trailer = 
	'https://www.youtube.com/embed/ZU3Xban0Y6A' 
	WHERE name = 'The Intern'

UPDATE MOVIE SET img = 
	'https://m.media-amazon.com/images/I/811IcpNS05L.jpg' 
	WHERE name = 'Cars'
UPDATE MOVIE SET trailer = 
	'https://www.youtube.com/embed/SbXIj2T-_uk' 
	WHERE name = 'Cars'

UPDATE MOVIE SET img = 
	'https://m.media-amazon.com/images/I/71iFCkaLTfL._AC_UF1000,1000_QL80_.jpg' 
	WHERE name = 'The Smurfs'
UPDATE MOVIE SET trailer = 
	'https://www.youtube.com/embed/yhBpgqXwrt8' 
	WHERE name = 'The Smurfs'

UPDATE MOVIE SET img = 
	'https://lumiere-a.akamaihd.net/v1/images/p_brotherbear_herobanner_19881_78856a54.jpeg' 
	WHERE name = 'Brother Bear'
UPDATE MOVIE SET trailer = 
	'https://www.youtube.com/watch?v=N1yzvz2gKz0' 
	WHERE name = 'Brother Bear'

UPDATE MOVIE SET img = 
	'https://m.media-amazon.com/images/I/51Y3UST2tBL._AC_UF894,1000_QL80_.jpg' 
	WHERE name = 'Monsters, Inc.'
UPDATE MOVIE SET trailer = 
	'https://www.youtube.com/embed/CGbgaHoapFM' 
	WHERE name = 'Monsters, Inc.'

UPDATE MOVIE SET img = 
	'https://m.media-amazon.com/images/I/71Tfcbik0sL.jpg' 
	WHERE name = 'The Simpsons Movie'
UPDATE MOVIE SET trailer = 
	'https://www.youtube.com/embed/XPG0MqIcby8' 
	WHERE name = 'The Simpsons Movie'

UPDATE MOVIE SET img = 
	'https://image.tmdb.org/t/p/original/gs6AnQy7ZfOCgz0wsl7yjQOxF6K.jpg' 
	WHERE name = 'Little Man'
UPDATE MOVIE SET trailer = 
	'https://www.youtube.com/embed/n6ir-qPI2PU' 
	WHERE name = 'Little Man'

UPDATE MOVIE SET img = 
	'https://m.media-amazon.com/images/I/51Sf-ZhkcHL._AC_UF894,1000_QL80_.jpg' 
	WHERE name = 'Jackass: The Movie'
UPDATE MOVIE SET trailer = 
	'https://www.youtube.com/embed/FNq-QT2Jpng' 
	WHERE name = 'Jackass: The Movie'

UPDATE MOVIE SET img = 
	'https://m.media-amazon.com/images/M/MV5BY2VkMDg4ZTYtN2M3Yy00NWZiLWE2ODEtZjU5MjZkYWNkNGIzXkEyXkFqcGdeQXVyODY5Njk4Njc@._V1_.jpg' 
	WHERE name = 'Super Bad'
UPDATE MOVIE SET trailer = 
	'https://www.youtube.com/embed/4eaZ_48ZYog' 
	WHERE name = 'Super Bad'

UPDATE MOVIE SET img = 
	'https://m.media-amazon.com/images/I/51JM5CyGAVL._AC_UF894,1000_QL80_.jpg' 
	WHERE name = 'Click'
UPDATE MOVIE SET trailer = 
	'https://www.youtube.com/embed/3-VfwPpbNg4' 
	WHERE name = 'Click'

UPDATE MOVIE SET img = 
	'https://upload.wikimedia.org/wikipedia/en/b/b8/Just_Go_with_It_Poster.jpg' 
	WHERE name = 'Just Go with It'
UPDATE MOVIE SET trailer = 
	'https://www.youtube.com/embed/fpj7i2CPt8M' 
	WHERE name = 'Just Go with It'

UPDATE MOVIE SET img = 
	'https://image.tmdb.org/t/p/original/mWrVAXmmC2iZVDyGXlLJOF09KnN.jpg' 
	WHERE name = 'American Pie'
UPDATE MOVIE SET trailer = 
	'https://www.youtube.com/embed/FfnLX1kXvCo' 
	WHERE name = 'American Pie'

UPDATE MOVIE SET img = 
	'https://m.media-amazon.com/images/M/MV5BMWU0MGYwZWQtMzcwYS00NWVhLTlkZTAtYWVjOTYwZTBhZTBiXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_.jpg' 
	WHERE name = 'Bad boys'
UPDATE MOVIE SET trailer = 
	'https://www.youtube.com/embed/Amzj7xll3Aw' 
	WHERE name = 'Bad boys'

UPDATE MOVIE SET img = 
	'https://m.media-amazon.com/images/I/51Kkswv-kjL._AC_UF894,1000_QL80_.jpg' 
	WHERE name = 'Project X'
UPDATE MOVIE SET trailer = 
	'https://www.youtube.com/embed/fMJ4IBnU0Ks' 
	WHERE name = 'Project X'

UPDATE MOVIE SET img = 
	'https://m.media-amazon.com/images/M/MV5BZmM4YjAyODktOWM0YS00MmVjLWI0YzMtYTBhYzczZGU5YzBiXkEyXkFqcGdeQXVyNTIzOTk5ODM@._V1_.jpg' 
	WHERE name = 'Paul'
UPDATE MOVIE SET trailer = 
	'https://www.youtube.com/embed/ZIlrPjJeW3k' 
	WHERE name = 'Paul'

UPDATE MOVIE SET img = 
	'https://m.media-amazon.com/images/I/510DyT3-DHL._AC_UF894,1000_QL80_.jpg' 
	WHERE name = 'Norbit'
UPDATE MOVIE SET trailer = 
	'https://www.youtube.com/embed/HFIdZpc2L6w' 
	WHERE name = 'Norbit'

UPDATE MOVIE SET img = 
	'https://cdn.shopify.com/s/files/1/1057/4964/products/Shrek-Vintage-Movie-Poster-Original-1-Sheet-27x41.jpg?v=1665732097' 
	WHERE name = 'Shrek'
UPDATE MOVIE SET trailer = 
	'https://www.youtube.com/embed/CwXOrWvPBPk' 
	WHERE name = 'Shrek'

UPDATE MOVIE SET img = 
	'https://upload.wikimedia.org/wikipedia/en/6/64/The_Secret_Life_of_Pets_poster.jpg' 
	WHERE name = 'The Secret Life of Pets'
UPDATE MOVIE SET trailer = 
	'https://www.youtube.com/embed/i-80SGWfEjM' 
	WHERE name = 'The Secret Life of Pets'

UPDATE MOVIE SET img = 
	'https://m.media-amazon.com/images/I/71aBLaC4TzL.jpg' 
	WHERE name = 'Toy Story'
UPDATE MOVIE SET trailer = 
	'https://www.youtube.com/embed/v-PjgYDrg70' 
	WHERE name = 'Toy Story'

--UPDATE ANIMATED
UPDATE MOVIE SET img = 
	'https://m.media-amazon.com/images/I/51RoZRgIHtL._AC_.jpg' 
	WHERE name = 'Wall-e'
UPDATE MOVIE SET trailer = 
	'https://www.youtube.com/embed/CZ1CATNbXg0' 
	WHERE name = 'Wall-e'

UPDATE MOVIE SET img = 
	'https://upload.wikimedia.org/wikipedia/en/3/31/The_SpongeBob_SquarePants_Movie_poster.jpg' 
	WHERE name = 'The SpongeBob SquarePants Movie'
UPDATE MOVIE SET trailer = 
	'https://www.youtube.com/embed/47ceXAEr2Oo' 
	WHERE name = 'The SpongeBob SquarePants Movie'

UPDATE MOVIE SET img = 
	'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPAtHBlBIGMneLbLDrVoApdphULZophDS61ic2G1Cegg&s' 
	WHERE name = 'Cloudy with a Chance of Meatballs'
UPDATE MOVIE SET trailer = 
	'https://www.youtube.com/embed/pUaKcFI4BZY' 
	WHERE name = 'Cloudy with a Chance of Meatballs'

UPDATE MOVIE SET img = 
	'https://m.media-amazon.com/images/I/51uJGH71GsL._AC_.jpg' 
	WHERE name = 'How to Train Your Dragon'
UPDATE MOVIE SET trailer = 
	'https://www.youtube.com/embed/2AKsAxrhqgM' 
	WHERE name = 'How to Train Your Dragon'

UPDATE MOVIE SET img = 
	'https://m.media-amazon.com/images/I/51qboNmFw3L._AC_.jpg' 
	WHERE name = 'Kung Fu Panda'
UPDATE MOVIE SET trailer = 
	'https://www.youtube.com/embed/PXi3Mv6KMzY' 
	WHERE name = 'Kung Fu Panda'

UPDATE MOVIE SET img = 
	'https://m.media-amazon.com/images/I/51P0k-lIAxL._AC_UF894,1000_QL80_.jpg' 
	WHERE name = 'Up'
UPDATE MOVIE SET trailer = 
	'https://www.youtube.com/embed/ORFWdXl_zJ4' 
	WHERE name = 'Up'

UPDATE MOVIE SET img = 
	'https://m.media-amazon.com/images/I/71HcBGXaICL._AC_UF894,1000_QL80_.jpg' 
	WHERE name = 'Inside Out'
UPDATE MOVIE SET trailer = 
	'https://www.youtube.com/embed/yRUAzGQ3nSY' 
	WHERE name = 'Inside Out'

UPDATE MOVIE SET img = 
	'https://m.media-amazon.com/images/I/61CzwX3jXCL._AC_.jpg' 
	WHERE name = 'Coraline'
UPDATE MOVIE SET trailer = 
	'https://www.youtube.com/embed/HnAVh-eWgTU' 
	WHERE name = 'Coraline'

UPDATE MOVIE SET img = 
	'https://m.media-amazon.com/images/I/61CzwX3jXCL._AC_.jpg' 
	WHERE name = 'Brother Bear'
UPDATE MOVIE SET trailer = 
	'https://www.youtube.com/embed/HnAVh-eWgTU' 
	WHERE name = 'Brother Bear'

--UPDATES ACTION
UPDATE MOVIE SET trailer = 
	'https://www.youtube.com/embed/IAdCsNtEuBU' 
	WHERE name = 'Ghosted'

UPDATE MOVIE SET trailer = 
	'https://www.youtube.com/embed/5PSNL1qE6VY' 
	WHERE name = 'Avatar'

UPDATE MOVIE SET img = 
	'https://image.tmdb.org/t/p/original/5uahQvjeF2cRbIuX65UgBednPUu.jpg' 
	WHERE name = 'Moonfall'
UPDATE MOVIE SET trailer = 
	'https://www.youtube.com/embed/xx97DuHGr2o' 
	WHERE name = 'Moonfall'

UPDATE MOVIE SET img = 
	'https://m.media-amazon.com/images/I/61TIuVrWBvL.jpg' 
	WHERE name = 'Black Adam'
UPDATE MOVIE SET trailer = 
	'https://www.youtube.com/embed/X0tOpBuYasI' 
	WHERE name = 'Black Adam'

UPDATE MOVIE SET trailer = 
	'https://www.youtube.com/embed/ZlNFpri-Y40' 
	WHERE name = 'Ant-Man'

UPDATE MOVIE SET trailer = 
	'https://www.youtube.com/embed/eOrNdBpGMv8' 
	WHERE name = 'Avengers'

UPDATE MOVIE SET trailer = 
	'https://www.youtube.com/embed/oZ6iiRrz1SY' 
	WHERE name = 'Morbius'

UPDATE MOVIE SET trailer = 
	'https://www.youtube.com/embed/IqvRDhW-XVA' 
	WHERE name = 'RoboCop'

UPDATE MOVIE SET trailer = 
	'https://www.youtube.com/embed/vKQi3bBA1y8' 
	WHERE name = 'Matrix'

UPDATE MOVIE SET trailer = 
	'https://www.youtube.com/embed/2TAOizOnNPo' 
	WHERE name = 'The Fast and the Furious'

UPDATE MOVIE SET trailer = 
	'https://www.youtube.com/embed/LSHKMroK9aU' 
	WHERE name = 'Logan'

UPDATE MOVIE SET trailer = 
	'https://www.youtube.com/embed/Div0iP65aZo' 
	WHERE name = 'Gladiator'

UPDATE MOVIE SET img = 
	'https://m.media-amazon.com/images/I/41YabeSI9NL._AC_UF894,1000_QL80_.jpg' 
	WHERE name = 'The Godfather'
UPDATE MOVIE SET trailer = 
	'https://www.youtube.com/embed/UaVTIH8mujA' 
	WHERE name = 'The Godfather'

UPDATE MOVIE SET img = 
	'https://m.media-amazon.com/images/M/MV5BZWUzOGNjMzItZmM5MC00NTQzLTk3YjQtZWMwZmRhOGJhZDczXkEyXkFqcGdeQXVyNzc5MjA3OA@@._V1_.jpg' 
	WHERE name = 'Sniper'
UPDATE MOVIE SET trailer = 
	'https://www.youtube.com/embed/QZ4au55F2mQ' 
	WHERE name = 'Sniper'

UPDATE MOVIE SET trailer = 
	'https://www.youtube.com/embed/1Q4mhYF9aQQ' 
	WHERE name = 'Men in Black'

UPDATE MOVIE SET trailer = 
	'https://www.youtube.com/embed/XZG1FzyB8DI' 
	WHERE name = 'Into the Wild'