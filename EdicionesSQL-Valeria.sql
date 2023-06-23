USE Lenguajes_Proyecto_VJE

ALTER TABLE MOVIE ADD trailer varchar(5000)
ALTER TABLE MOVIE ALTER COLUMN img varchar(2000)
ALTER TABLE MOVIE ADD punctuation float
ALTER TABLE SERIE ADD punctuation float


--procedimientos para obtener peliculas por genero
ALTER PROCEDURE GetMoviesByGender (
	@typeG varchar(30))
AS
BEGIN
	SELECT M.* FROM MOVIE M, GENDER, GenderMovie WHERE GENDER.typeG = @typeG AND
	GenderMovie.idGender = GENDER.idGender AND M.idMovie = GenderMovie.idMovie
END
GO

CREATE PROCEDURE GetSeriesByGender (
	@typeG varchar(30))
AS
BEGIN
	SELECT S.* FROM SERIE S, GENDER, GenderSerie WHERE GENDER.typeG = @typeG AND
	GenderSerie.idGender = GENDER.idGender AND S.idSerie = GenderSerie.idSerie
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

CREATE PROCEDURE GetMoviesInfo (
 @id int
)
AS
BEGIN
	SELECT * FROM MOVIE WHERE idMovie = @id
END

ALTER PROCEDURE GetMovieCast(
 @id int
)
AS
BEGIN
	SELECT A.* FROM ACTOR A, ActorMovie WHERE  ActorMovie.idMovie = @id AND ActorMovie.idActor= A.idActor
END



CREATE PROCEDURE GetSerieCast(
 @id int
)
AS
BEGIN
	SELECT A.* FROM ACTOR A, ActorSerie WHERE  ActorSerie.idSerie = @id AND ActorSerie.idActor= A.idActor
END

ALTER PROCEDURE GetMovieReviews(
 @id int
)
AS
BEGIN
	SELECT top 10 R.* FROM UserMovie R WHERE  R.idMovie = @id ORDER BY r.reviewTime
END

CREATE PROCEDURE GetSerieReviews(
 @id int
)
AS
BEGIN
	SELECT top 10 R.* FROM UserSerie R WHERE  R.idSerie = @id ORDER BY R.times
END

CREATE PROCEDURE GetSerieChapters (
	@id int
)
AS 
BEGIN
	SELECT C.* FROM CHAPTER C WHERE C.idSerie = @id
END

EXEC GetSerieChapters 3000


ALTER PROCEDURE CommentMovie (
	@idAccount varchar(20),
	@idMovie int,
	@review varchar(8000),
	@stars int
)
AS
BEGIN
	DECLARE @userID INT
	SET @userID = (SELECT idAccount FROM ACCOUNT WHERE userName like @idAccount)
	INSERT INTO UserMovie VALUES (@userID, @idMovie, GETDATE(), @stars, @review)
END

CREATE PROCEDURE CalculateMoviePunctuation (
	@idMovie int
)
AS 
BEGIN
	DECLARE @punctuation float

	SELECT @punctuation = AVG(stars) FROM UserMovie WHERE idMovie = @idMovie

	UPDATE MOVIE SET punctuation = @punctuation WHERE idMovie = @idMovie
END



EXEC CalculateMoviePunctuation 2000

CREATE PROCEDURE CalculateSeriePunctuation (
	@idSerie int
)
AS 
BEGIN
	DECLARE @punctuation float

	SELECT @punctuation = AVG(stars) FROM UserSerie WHERE idSerie = @idSerie

	UPDATE SERIE SET punctuation = @punctuation WHERE idSerie = @idSerie
END

CREATE PROCEDURE GetAllMovies 
AS 
BEGIN
	SELECT * FROM MOVIE 
END

CREATE PROCEDURE GetAllSeries
AS 
BEGIN
	SELECT * FROM SERIE 
END

CREATE PROCEDURE GetAllGenders
AS
BEGIN
	SELECT * FROM GENDER
END

CREATE PROCEDURE GetMoviesByName (
	@name varchar(50)
)
AS
BEGIN
	SELECT * FROM MOVIE WHERE name = @name
END

CREATE PROCEDURE GetSeriesByName (
	@name varchar(50)
)
AS
BEGIN
	SELECT * FROM SERIE WHERE name = @name
END

--
UPDATE SERIE SET trailer = 
	'https://www.youtube.com/embed/xCwwxNbtK6Y' 
	WHERE name = 'Cobra Kai'


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

--ACTORS
ALTER TABLE ACTOR ADD img varchar(2000)

UPDATE ACTOR SET img = 'https://static.vecteezy.com/system/resources/previews/009/477/246/non_2x/los-angeles-jun-9-lauren-lapkus-at-the-jurassic-world-world-premiere-at-the-dolby-theater-hollywood-and-highland-on-june-9-2015-in-los-angeles-ca-free-photo.jpg' WHERE idActor = '6000'
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/S/pv-target-images/516fbb83086782613c9d31218a7b6f514109c389f2065aae7ab64d4a90d6f1e3.jpg' WHERE idActor = '6001';
UPDATE ACTOR SET img = 'https://images.mubicdn.net/images/cast_member/39576/cache-110306-1541487054/image-w856.jpg?size=800x' WHERE idActor = '6002';
UPDATE ACTOR SET img = 'https://media.vogue.mx/photos/6419da908041e1cc9fc61b73/master/pass/GettyImages-1474006521.jpg' WHERE idActor = '6003';
UPDATE ACTOR SET img = 'https://t2.gstatic.com/licensed-image?q=tbn:ANd9GcTRHWjke1sw0PWsNto-hN9x_tvNv6LZYTqoriaIkPyXwH7ZIv5Z1KXpD4LMlYAiy_VX' WHERE idActor = '6004';
UPDATE ACTOR SET img = 'https://magarticles.magzter.com/articles/12423/365868/5d57945b9f7b8/Jason-Sudeikis.jpg' WHERE idActor = '6005';
UPDATE ACTOR SET img = 'https://t1.gstatic.com/licensed-image?q=tbn:ANd9GcQqxMaKOGL2x4tVbs5JGg9dcOQKhadQvAA-brushdxaF5b5-t5IFxUl45wjaH3viwe1' WHERE idActor = '6006';
UPDATE ACTOR SET img = 'https://t3.gstatic.com/licensed-image?q=tbn:ANd9GcRpRZkuSbatHow9F3n2nBhIpMA1TMLsKo3v6C_Bcgo4PTtHpV1JGMyAt9jnAaYX5eoH' WHERE idActor = '6007';
UPDATE ACTOR SET img = 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQf8GkPbSVCWujtr1EckBMpxPxO-MUVEUfMZidPrnsZX6pSFjII' WHERE idActor = '6008';
UPDATE ACTOR SET img = 'https://t3.gstatic.com/licensed-image?q=tbn:ANd9GcRgcY4Rg-oVG8TNLVYCPzaxzj-Dy2zCrGpla4gpD2OhOQyFooXrQHSh542AuNSWscQO' WHERE idActor = '6009';

UPDATE ACTOR SET img = 'https://t0.gstatic.com/licensed-image?q=tbn:ANd9GcQRfM0wuh0T8lDjL_aach0A1_sabPeHCUkJsaddw6Q-fhZKOju_JVkYOMS9JljF1cnf' WHERE idActor = '6010'
UPDATE ACTOR SET img = 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSXBdqVNbeiO7HaBLUTsIPb9gR0rrXihmxY5flHGDaB6diGWU1F' WHERE idActor = '6011';
UPDATE ACTOR SET img = 'https://t3.gstatic.com/licensed-image?q=tbn:ANd9GcR5MiyHgeVUZUQL14T1TmLHp5Aw0Xd64bpQNmssoA1V7k4HPTqATeNH95uqE1YxiaT8' WHERE idActor = '6012';
UPDATE ACTOR SET img = 'https://t3.gstatic.com/licensed-image?q=tbn:ANd9GcS6BGdWLTZZwOtLk753B66n05U6f62iuF3IGvACUt4F_PRMu2a1fSwoKUKhyXZvMdjQ' WHERE idActor = '6013';
UPDATE ACTOR SET img = 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRacTbUKIeEZnN-tu6NoCZjexAOXTSa9eQBQ5BuhBskJOcgqHIK' WHERE idActor = '6014';
UPDATE ACTOR SET img = 'https://t3.gstatic.com/licensed-image?q=tbn:ANd9GcRRoTXDMHvDULIKjitDu5Kc9pbDbw5cBJxtMf6DTYiL__huPHPKEz4AsTUhBFf5c48g' WHERE idActor = '6015';
UPDATE ACTOR SET img = 'https://cdn.britannica.com/52/243652-050-FEE0A5E4/Actor-Adam-Sandler-2019.jpg' WHERE idActor = '6016';
UPDATE ACTOR SET img = 'https://static.wikia.nocookie.net/doblaje/images/f/f9/Johnny_Knoxville_en_2021.jpg/revision/latest?cb=20220701185552&path-prefix=es' WHERE idActor = '6017';
UPDATE ACTOR SET img = 'https://t2.gstatic.com/licensed-image?q=tbn:ANd9GcSVa6qGaRs-8ARfWyO1S_XoLXpnOJkzl05b3ZRDCHxrQcVmykKThL_wrCP2uTIeOule' WHERE idActor = '6018';
UPDATE ACTOR SET img = 'https://t3.gstatic.com/licensed-image?q=tbn:ANd9GcRbOOMDNqWcO6ubgCC6sfZJ6R0fsbXsWFxmOj-yR4KeFm-vXmjhLGP2LUmEfMMxjOOa' WHERE idActor = '6019';
UPDATE ACTOR SET img = 'https://t2.gstatic.com/licensed-image?q=tbn:ANd9GcTD03xK9zTBTtxgi1tTh7kyM1viy1_gxcsmSkrEbFOcz1005tIzRX8Akqn9TrzJijs9' WHERE idActor = '6020'

UPDATE ACTOR SET img = 'https://t3.gstatic.com/licensed-image?q=tbn:ANd9GcT_sbUP9s_K8E1gRdbrwuFz1mIfzuF0vyan2ph9kYAYT2L26B77d15u4nEsou26KIhF' WHERE idActor = '6021';
UPDATE ACTOR SET img = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRM0gTIRIHXSoP67jw1sSFb5NK08L67HiU_i3ahm7Y5WTfL8mVq' WHERE idActor = '6022';
UPDATE ACTOR SET img = 'https://t1.gstatic.com/licensed-image?q=tbn:ANd9GcQn3F17Xih9YtVYsGvw3gzrgkrH7hLZ3Nf42l7V9k0HAXQSGB-qwJ7zoGFf6hn4HVQn' WHERE idActor = '6023';
UPDATE ACTOR SET img = 'https://t3.gstatic.com/licensed-image?q=tbn:ANd9GcRk5OGTyxh3_qrmrqm9vr8XnmUbKMU2l6QMQa0eAyt72SBkX1amPtBR0a3KCKmfJBkw' WHERE idActor = '6024';
UPDATE ACTOR SET img = 'https://t1.gstatic.com/licensed-image?q=tbn:ANd9GcRExG_luSq41_mmkaPEa4antEYb7fxh0fXB41lGWatAghxv5RuudPD-x_7X6-6rGdD8' WHERE idActor = '6025';
UPDATE ACTOR SET img = 'https://t0.gstatic.com/licensed-image?q=tbn:ANd9GcSZ9Um14jPio9yWyJGUmgcw0J8oGpKZbHiLbVk2Er60lstnmPcR1pEbn-YKCEuunw3X' WHERE idActor = '6026';
UPDATE ACTOR SET img = 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQbuF86tSHODHWHJRusio04zBWZHRNgFJdu-jyiWgkIbBC4-tuT' WHERE idActor = '6027';
UPDATE ACTOR SET img = 'https://t3.gstatic.com/licensed-image?q=tbn:ANd9GcTDYclwa3lgNFRgpLuNTUc0EnKelImWx6prkcj1Cj6YCk3WXhm4n2Gzq8DdIQ2DKqcc' WHERE idActor = '6028';
UPDATE ACTOR SET img = 'https://t0.gstatic.com/licensed-image?q=tbn:ANd9GcRzAD3pXwQEAh2DsxofDN3fX29Z_b7GgGgLuZWeIQh4EtDyCMo0z_Meb4hiQrUSdXQh' WHERE idActor = '6029';
UPDATE ACTOR SET img = 'https://t0.gstatic.com/licensed-image?q=tbn:ANd9GcTycUZnLgEDvEgsrp0TqNsXUc7YqAJ3iu7wrrOj1vQFcRFgSIoXvM-4L9vUS9k_oFf6' WHERE idActor = '6030';

UPDATE ACTOR SET img = 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRavYk_oUq6WtNgMoTJeN2UyqQfFDkdJvKTxjkE0_2YeF1mb2BV' WHERE idActor = '6031';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/Thomas_Mann_%2830703712211%29_%28cropped%29.jpg/1200px-Thomas_Mann_%2830703712211%29_%28cropped%29.jpg' WHERE idActor = '6032';
UPDATE ACTOR SET img = 'https://t1.gstatic.com/licensed-image?q=tbn:ANd9GcSole7wV8pKvSbITHnuzycyMngH8I2P0E_uUY-rtXquwZhru7mB-ttN4PpKUpgBOSuA' WHERE idActor = '6033';
UPDATE ACTOR SET img = 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRN14McKqAqG90xHXVQniQdrq4wZfk5RAI4qzC0GjPda8FTb8PH' WHERE idActor = '6034';
UPDATE ACTOR SET img = 'https://t2.gstatic.com/licensed-image?q=tbn:ANd9GcT-lwFfmiF6_lSnP--nR_zPHJ7yzulYMX59I7IYJ6yet9afBmrI1W0n38M1TmnNKzFh' WHERE idActor = '6035';
UPDATE ACTOR SET img = 'https://t2.gstatic.com/licensed-image?q=tbn:ANd9GcRmkASLeQG0D2S3mH81YpUnyF31qrTWVtuSlyWUGx-yrIHBEBqhuYINJrMXPyJHSFaO' WHERE idActor = '6036';
UPDATE ACTOR SET img = 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcR860HtM8kix3GsUjF-cIXPI7blypVRORVG6Z6UHdzvPnOT6p44' WHERE idActor = '6037';
UPDATE ACTOR SET img = 'https://images.mubicdn.net/images/cast_member/23731/cache-111014-1430919799/image-w856.jpg' WHERE idActor = '6038';
UPDATE ACTOR SET img = 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSb0dKksAaaSmtxkTNrXPxYmzIIzHCyIEj0Aznrv7OHKvtpYTaK' WHERE idActor = '6039';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/S/amzn-author-media-prod/4237evohdno3t2rsouqb5med7r.jpg' WHERE idActor = '6040';

UPDATE ACTOR SET img = 'https://media.npr.org/assets/img/2022/07/13/gettyimages-1393076914_custom-52b3dc2bf143a8d6a2903e92c1a70a0c74fffcc1-s1100-c50.jpg' WHERE idActor = '6041';
UPDATE ACTOR SET img = 'https://t3.gstatic.com/licensed-image?q=tbn:ANd9GcQkrzVa80AnzW4yGmJ4jDvl2r6t_wKAeEfUvuz1Cx4k0Z26mXgisv01ZL9TSM5x06-w' WHERE idActor = '6042';
UPDATE ACTOR SET img = 'https://t3.gstatic.com/licensed-image?q=tbn:ANd9GcRIAI575StuKKExHPr_BaMDtnBOryU9qoElKVf8ABRv8bxLUYFD4Ki50r0DlLIpdlzy' WHERE idActor = '6043';
UPDATE ACTOR SET img = 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQumHEUJVoIyJKqDPfM8HeA6-gWnayj-RdzueUbhDpvCdrkri5_' WHERE idActor = '6044';
UPDATE ACTOR SET img = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgKOtRXZrhhl0SkZPMAY0PfuTSw9zrSXc22iWz4QDUMaWMkPQo' WHERE idActor = '6045';
UPDATE ACTOR SET img = 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcT0v_IDVJvc-hJDiQc3jy5-ZbiBnkCvzQ_hserPzd14eCY5pc9Y' WHERE idActor = '6046';
UPDATE ACTOR SET img = 'https://t1.gstatic.com/licensed-image?q=tbn:ANd9GcQHIAdNSrlEVWFNI7LH5-58bejB2-2XjgqXEfCnK63QLWmYhSP7smyDjXDct7P2cLnY' WHERE idActor = '6047';
UPDATE ACTOR SET img = 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSd-esrjxo1GFHJK9MN-0U8ano2DUKkv1WrfRT5eqt9FwblcRPH' WHERE idActor = '6048';
UPDATE ACTOR SET img = 'https://t0.gstatic.com/licensed-image?q=tbn:ANd9GcT6y9buAOWxcGgQJvsmprYfAvcG3zIr8pn676kR7T72qmpEbcioUD0ZNAo4a8k4E4DF' WHERE idActor = '6049';
UPDATE ACTOR SET img = 'https://musicimage.xboxlive.com/catalog/video.contributor.540f6500-0200-11db-89ca-0019b92a3933/image?locale=gl-es&target=circle' WHERE idActor = '6050';

UPDATE ACTOR SET img = 'https://t3.gstatic.com/licensed-image?q=tbn:ANd9GcQcxo7DvW4o82wPp6giyX5bjr9d-JfhbisBGvSZnmMv3r9OHjbhTRhVdkfsvBoEJEgQ' WHERE idActor = '6051';
UPDATE ACTOR SET img = 'https://static.wikia.nocookie.net/doblaje/images/f/f5/Ben_Burtt.jpg/revision/latest?cb=20210831235051&path-prefix=es' WHERE idActor = '6052';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/S/pv-target-images/8af8ca46526c4b35136b07e7ed265799202a9f90d407cfb3e982fa253407f59b.jpg' WHERE idActor = '6053';
UPDATE ACTOR SET img = 'https://t1.gstatic.com/licensed-image?q=tbn:ANd9GcS851rv5RfSNfxrUEsCXc2qGAK8WoGGAa185LvrNtay6bvBFDiTPoKbCS2enr_SGbVo' WHERE idActor = '6054';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/Stephen_Hillenburg_by_Carlos_Cazurro.jpg/1200px-Stephen_Hillenburg_by_Carlos_Cazurro.jpg' WHERE idActor = '6055';
UPDATE ACTOR SET img = 'https://t0.gstatic.com/licensed-image?q=tbn:ANd9GcSMmEcMIArL52L-scq9BbVQHDcfeF14FDT1OxUVqwpY4FF8KzzIinHeTPBOp5uJSpmK' WHERE idActor = '6056';
UPDATE ACTOR SET img = 'https://static.wikia.nocookie.net/disney/images/7/71/Bill_Fagerbakke.jpg/revision/latest?cb=20180530233108' WHERE idActor = '6057';
UPDATE ACTOR SET img = 'https://t3.gstatic.com/licensed-image?q=tbn:ANd9GcROZj83lWhccy8VYdDRLLd4b0pOcZppghlwRrTvfITKta67BDNuzR1TdpQqf_WmK9wl' WHERE idActor = '6058';
UPDATE ACTOR SET img = 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTvnd3wMRt9f_RIiLtibjvGJenDS6Abw4yKlEA5BAH2hF6bk8fc' WHERE idActor = '6059';
UPDATE ACTOR SET img = 'https://t3.gstatic.com/licensed-image?q=tbn:ANd9GcTY0AOXnWyEFQ2xmGQF9qtEgGwpHumgV2ROP_Q6DtMbJmi2UlissHRUlEm0ATBAp1rq' WHERE idActor = '6060';

UPDATE ACTOR SET img = 'https://cdn.britannica.com/60/137460-050-29AA37EF/Gerard-Butler.jpg' WHERE idActor = '6061';
UPDATE ACTOR SET img = 'https://flxt.tmsimg.com/assets/71804_v9_bb.jpg' WHERE idActor = '6062';
UPDATE ACTOR SET img = 'https://flxt.tmsimg.com/assets/28555_v9_bc.jpg' WHERE idActor = '6063';
UPDATE ACTOR SET img = 'https://deadline.com/wp-content/uploads/2018/07/james-hong-1a.jpg?w=1024' WHERE idActor = '6064';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/f/fd/Pete_Docter_cropped_2009.jpg' WHERE idActor = '6065';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BMTk0MDI4ODk5NF5BMl5BanBnXkFtZTcwMzg3ODQ3MQ@@._V1_FMjpg_UX1000_.jpg' WHERE idActor = '6066';
UPDATE ACTOR SET img = 'https://static.wikia.nocookie.net/disney/images/1/10/Bob_Peterson.jpg/revision/latest?cb=20180413021711' WHERE idActor = '6067';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/Mindy_Kaling_by_Claire_Leahy_%28cropped%29.jpg/1200px-Mindy_Kaling_by_Claire_Leahy_%28cropped%29.jpg' WHERE idActor = '6068';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/e/e8/Amy_Poehler_%288894155873%29_%28cropped%29.jpg' WHERE idActor = '6069';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/7/73/Dakota_Fanning_SAG_AWARDS_2020.jpg' WHERE idActor = '6070';

UPDATE ACTOR SET img = 'https://cdn.britannica.com/22/217722-050-4BC7EA81/British-actress-Jennifer-Saunders-2017.jpg' WHERE idActor = '6071';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3d/Teri_Hatcher-_World_of_Color_Premiere_21.jpg/640px-Teri_Hatcher-_World_of_Color_Premiere_21.jpg' WHERE idActor = '6072';
UPDATE ACTOR SET img = 'https://cdn.britannica.com/63/215263-050-6C78005B/American-actor-Joaquin-Phoenix-2020.jpg' WHERE idActor = '6073';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BYTY1NjU3OWItM2Q5NS00ZWMyLTg1MDAtMDJlODI3ZDBhMWNhXkEyXkFqcGdeQXVyOTExNDkxMjk@._V1_.jpg' WHERE idActor = '6074';
UPDATE ACTOR SET img = 'https://flxt.tmsimg.com/assets/54616_v9_ba.jpg' WHERE idActor = '6075';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BMjExMjk0NTA5MF5BMl5BanBnXkFtZTcwMjM4MzU1Mw@@._V1_FMjpg_UX1000_.jpg' WHERE idActor = '6076';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/c/cb/William_Zabka_Photo_Op_GalaxyCon_Richmond_2019.jpg' WHERE idActor = '6077';
UPDATE ACTOR SET img = 'https://flxt.tmsimg.com/assets/271536_v9_bb.jpg' WHERE idActor = '6078';
UPDATE ACTOR SET img = 'https://flxt.tmsimg.com/assets/522797_v9_bb.jpg' WHERE idActor = '6079';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BMWIyNWU3NTQtNDNiYy00NGU4LWFhYmUtMDAwNjA1NjM4MTRlXkEyXkFqcGdeQXVyMjQwMDg0Ng@@._V1_.jpg' WHERE idActor = '6080';

UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BMTcxOTc0MDgzNV5BMl5BanBnXkFtZTcwODUyNDU5Ng@@._V1_.jpg' WHERE idActor = '6081';
UPDATE ACTOR SET img = 'https://flxt.tmsimg.com/assets/171423_v9_bb.jpg' WHERE idActor = '6082';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BODEyN2Y4YjEtNjUyOC00N2QzLTk0NmEtMDMxYjY3YjI1YWJiXkEyXkFqcGdeQXVyNTg0ODkzOTA@._V1_.jpg' WHERE idActor = '6083';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/8/83/BrittLower.jpg' WHERE idActor = '6084';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BMTg3NDUzOTc3MV5BMl5BanBnXkFtZTcwNjcxMDkxNw@@._V1_FMjpg_UX1000_.jpg' WHERE idActor = '6085';
UPDATE ACTOR SET img = 'https://static.wikia.nocookie.net/powerrangers/images/6/6a/Mamoru_Miyano.jpg/revision/latest?cb=20200720173305' WHERE idActor = '6086';
UPDATE ACTOR SET img = 'https://static.wikia.nocookie.net/dubbing9585/images/4/47/Asami_Imai.jpg/revision/latest?cb=20210613125544' WHERE idActor = '6087';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/0/09/Kana_Hanazawa_at_the_Tokyo_International_Film_Festival_-_2019_%2849013086453%29_%28cropped%29.jpg' WHERE idActor = '6088';
UPDATE ACTOR SET img = 'https://flxt.tmsimg.com/assets/587180_v9_bb.jpg' WHERE idActor = '6089';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/3/33/Mark_Kassen%2C_Tony_C%C3%A1rdenas_and_Chris_Evans_%28cropped%29.jpg' WHERE idActor = '6090';

UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BYTVmZWQyYjItMGJhZS00NjhiLTg4ZWEtNzhkMjMzMjY0M2QyXkEyXkFqcGdeQXVyMjQwMDg0Ng@@._V1_.jpg' WHERE idActor = '6091';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0d/Avatar_The_Way_of_Water_Tokyo_Press_Conference_Zoe_Salda%C3%B1a_%2852563431865%29_%28cropped2%29.jpg/800px-Avatar_The_Way_of_Water_Tokyo_Press_Conference_Zoe_Salda%C3%B1a_%2852563431865%29_%28cropped2%29.jpg' WHERE idActor = '6092';
UPDATE ACTOR SET img = 'https://flxt.tmsimg.com/assets/219616_v9_bb.jpg' WHERE idActor = '6093';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BZjRiZjA1NjMtZDMyZC00MDE4LTg1MDctYzdiNDU5N2RjZjE3XkEyXkFqcGdeQXVyMTM2MzgyOTU@._V1_.jpg' WHERE idActor = '6094';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/Jessie_Buckley_2019.jpg/1200px-Jessie_Buckley_2019.jpg' WHERE idActor = '6095';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/b/b5/Jared_Harris_2014.jpg' WHERE idActor = '6096';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/0/0a/Stellan_Skarsg%C3%A5rd_at_the_2017_Berlinalevds.jpg' WHERE idActor = '6097';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BMTkzNzcxNzcxMF5BMl5BanBnXkFtZTgwOTM1ODUzMTE@._V1_FMjpg_UX1000_.jpg' WHERE idActor = '6098';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/56/Halle_Berry_by_Gage_Skidmore_2.jpg/800px-Halle_Berry_by_Gage_Skidmore_2.jpg' WHERE idActor = '6099';
UPDATE ACTOR SET img = 'https://www.nme.com/wp-content/uploads/2022/02/John_Bradley_Portrait_Press.jpg' WHERE idActor = '6100';

UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BMTkyNDQ3NzAxM15BMl5BanBnXkFtZTgwODIwMTQ0NTE@._V1_FMjpg_UX1000_.jpg' WHERE idActor = '6101';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b2/Sarah_Shahi.jpg/800px-Sarah_Shahi.jpg' WHERE idActor = '6102';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/3/30/Henry_Cavill_%2848417913146%29_%28cropped%29.jpg' WHERE idActor = '6103';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Paul_Rudd_%28cropped%29_2.jpg/800px-Paul_Rudd_%28cropped%29_2.jpg' WHERE idActor = '6104';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/Evangeline_Lilly_Photo_Op_GalaxyCon_Richmond_2022.jpg/800px-Evangeline_Lilly_Photo_Op_GalaxyCon_Richmond_2022.jpg' WHERE idActor = '6105';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BMTQ3NzMzOTQ3MF5BMl5BanBnXkFtZTcwOTE0MzY1Mw@@._V1_FMjpg_UX1000_.jpg' WHERE idActor = '6106';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/8/8a/Hailee_Steinfeld_by_Gage_Skidmore.jpg' WHERE idActor = '6107';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/b/b8/Ella_Purnell_Serpentine_Summer_Party_2017_%28cropped%29.png' WHERE idActor = '6108';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BMTA0NDkyNzI0MTBeQTJeQWpwZ15BbWU4MDI4ODUxODUx._V1_.jpg' WHERE idActor = '6109';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BMTM3OTUwMDYwNl5BMl5BanBnXkFtZTcwNTUyNzc3Nw@@._V1_FMjpg_UX1000_.jpg' WHERE idActor = '6110';

UPDATE ACTOR SET img = 'https://cdn.britannica.com/34/218334-050-759D83D7/American-actor-Jeremy-Renner-2017.jpg' WHERE idActor = '6111';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BMTczMjUwNDUzMF5BMl5BanBnXkFtZTgwNDA4OTAzMTE@._V1_FMjpg_UX1000_.jpg' WHERE idActor = '6112';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b3/SDCC_2015_-_Matt_Smith.jpg/1200px-SDCC_2015_-_Matt_Smith.jpg' WHERE idActor = '6113';
UPDATE ACTOR SET img = 'https://static.wikia.nocookie.net/good-omens/images/1/1c/Adria_Arjona.jpg/revision/latest?cb=20181002165628' WHERE idActor = '6114';
UPDATE ACTOR SET img = 'https://images.squarespace-cdn.com/content/v1/56464fcde4b0e2033a3a77ef/0f860549-d7fb-4930-a3af-04a2e9994e92/Leeza+blue.jpg' WHERE idActor = '6115';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/b/be/Peter_Weller_2016.jpg' WHERE idActor = '6116';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BNzU3NTFjZjUtNzE1OS00YTA4LWI3ZmYtNTBiZGY3YmY0YjU5XkEyXkFqcGdeQXVyMjI3NDc1NTU@._V1_FMjpg_UX1000_.jpg' WHERE idActor = '6117';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/Reuni%C3%A3o_com_o_ator_norte-americano_Keanu_Reeves_%2846806576944%29_%28cropped%29.jpg/1200px-Reuni%C3%A3o_com_o_ator_norte-americano_Keanu_Reeves_%2846806576944%29_%28cropped%29.jpg' WHERE idActor = '6118';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/Carrie-Anne_Moss_May_2016.jpg/800px-Carrie-Anne_Moss_May_2016.jpg' WHERE idActor = '6119';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/8/85/National_Memorial_Day_Concert_2017_%2834117818524%29_%28cropped%29.jpg' WHERE idActor = '6120';

UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BMjExNzA4MDYxN15BMl5BanBnXkFtZTcwOTI1MDAxOQ@@._V1_.jpg' WHERE idActor = '6121';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BMjIwODc0OTk2Nl5BMl5BanBnXkFtZTcwOTQ5MDA0Mg@@._V1_FMjpg_UX1000_.jpg' WHERE idActor = '6122';
UPDATE ACTOR SET img = 'https://cdn.britannica.com/47/201647-050-C547C128/Hugh-Jackman-2013.jpg' WHERE idActor = '6123';
UPDATE ACTOR SET img = 'https://flxt.tmsimg.com/assets/877751_v9_bb.jpg' WHERE idActor = '6124';
UPDATE ACTOR SET img = 'https://flxt.tmsimg.com/assets/544905_v9_bb.jpg' WHERE idActor = '6125';
UPDATE ACTOR SET img = 'https://flxt.tmsimg.com/assets/74053_v9_bb.jpg' WHERE idActor = '6126';
UPDATE ACTOR SET img = 'https://image.tmdb.org/t/p/w500/lvQypTfeH2Gn2PTbzq6XkT2PLmn.jpg' WHERE idActor = '6127';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/Al_Pacino_2016_%2830401544240%29.jpg/640px-Al_Pacino_2016_%2830401544240%29.jpg' WHERE idActor = '6128';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Marlon_Brando_publicity_for_One-Eyed_Jacks.png/800px-Marlon_Brando_publicity_for_One-Eyed_Jacks.png' WHERE idActor = '6129';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/d/d7/James_Caan_%281976%29.jpg' WHERE idActor = '6130';

UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/Tom_Berenger_in_2019.jpg/1200px-Tom_Berenger_in_2019.jpg' WHERE idActor = '6131';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BMTI5NzA2NTE0NF5BMl5BanBnXkFtZTcwNzAxMTUxMw@@._V1_FMjpg_UX1000_.jpg' WHERE idActor = '6132';
UPDATE ACTOR SET img = 'https://image.tmdb.org/t/p/w500/y7YoyvmNEJWZZP4UiDzPhz4zaPP.jpg' WHERE idActor = '6133';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/4/4f/Tommy_Lee_Jones_2017.jpg' WHERE idActor = '6134';
UPDATE ACTOR SET img = 'https://flxt.tmsimg.com/assets/63498_v9_bb.jpg' WHERE idActor = '6135';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/Emile_Hirsch_TIFF_2012.jpg/1200px-Emile_Hirsch_TIFF_2012.jpg' WHERE idActor = '6136';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c6/Kristen_Stewart_at_Berlinale_2023.jpg/640px-Kristen_Stewart_at_Berlinale_2023.jpg' WHERE idActor = '6137';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/Vince_Vaughn_in_Los_Angeles%2C_California_%282015%29_-_1.jpg/640px-Vince_Vaughn_in_Los_Angeles%2C_California_%282015%29_-_1.jpg' WHERE idActor = '6138';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/3/33/Nicholas_Braun_2017.jpg' WHERE idActor = '6139';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/2/2d/Brian_Cox_%282016%29_-_01.jpg' WHERE idActor = '6140';

UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BYzZkNzYyNTYtMDY2ZS00YmI4LWI5YzctZjBiN2FkY2NkNWMyXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_.jpg' WHERE idActor = '6141';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BNjIyZTZmNDEtZmQ4Ny00YWFkLWFjOGMtMDFhOTM4ZjliM2Q1XkEyXkFqcGdeQXVyMjAxMDE4NTc@._V1_.jpg' WHERE idActor = '6142';
UPDATE ACTOR SET img = 'https://image.tmdb.org/t/p/w500/3P8YeRaNSB3XMcujL23qzDhJa5s.jpg' WHERE idActor = '6143';
UPDATE ACTOR SET img = 'https://static.wikia.nocookie.net/thegreatestshowman/images/9/93/Rebecca_ferguson.jpg/revision/latest?cb=20170810030337' WHERE idActor = '6144';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BMTI1OTYxNzAxOF5BMl5BanBnXkFtZTYwNTE5ODI4._V1_FMjpg_UX1000_.jpg' WHERE idActor = '6145';
UPDATE ACTOR SET img = 'https://cdn.britannica.com/33/216633-050-805A62FF/American-rapper-Common-2016.jpg' WHERE idActor = '6146';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/Rachel_Brosnahan_July_9%2C_2014_%28cropped%29.jpg/800px-Rachel_Brosnahan_July_9%2C_2014_%28cropped%29.jpg' WHERE idActor = '6147';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5f/Alex_Borstein_by_Gage_Skidmore_4_%28retouched%29.jpg/640px-Alex_Borstein_by_Gage_Skidmore_4_%28retouched%29.jpg' WHERE idActor = '6148';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/1/1b/Michael_Zegen_TIFF_2012.jpg' WHERE idActor = '6149';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/29/Tom_Welling_%2852549470181%29.jpg/640px-Tom_Welling_%2852549470181%29.jpg' WHERE idActor = '6150';

UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/7/7a/Michael_Rosenbaum_Photo_Op_GalaxyCon_Columbus_2022.jpg' WHERE idActor = '6151';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/43/Allison_Mack_%282018_crop%29.jpg/800px-Allison_Mack_%282018_crop%29.jpg' WHERE idActor = '6152';
UPDATE ACTOR SET img = 'https://flxt.tmsimg.com/assets/965881_v9_bb.jpg' WHERE idActor = '6153';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/The_Weeknd_Portrait_by_Brian_Ziff.jpg/1200px-The_Weeknd_Portrait_by_Brian_Ziff.jpg' WHERE idActor = '6154';
UPDATE ACTOR SET img = 'https://ca-times.brightspotcdn.com/dims4/default/9f37a21/2147483647/strip/true/crop/4480x6720+0+0/resize/2000x3000!/quality/80/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F55%2F8e%2Fdf61dd1d4ffd853e267863d89399%2F877945-la-times-sloman-suzanna-son-20211128-2.jpg' WHERE idActor = '6155';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BMTY1ODkwMTQxOF5BMl5BanBnXkFtZTcwNzkwNDcyMw@@._V1_FMjpg_UX1000_.jpg' WHERE idActor = '6156';
UPDATE ACTOR SET img = 'https://images.mubicdn.net/images/cast_member/108718/cache-161402-1470305337/image-w856.jpg' WHERE idActor = '6157';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/e/e1/Kelly_Reilly_2013.jpg' WHERE idActor = '6158';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BMTA2NjEyMTY4MTVeQTJeQWpwZ15BbWU3MDQ5NDAzNDc@._V1_.jpg' WHERE idActor = '6159';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BMTY1OTY5NjI5NV5BMl5BanBnXkFtZTcwODA4MjM0OA@@._V1_FMjpg_UX1000_.jpg' WHERE idActor = '6160';

UPDATE ACTOR SET img = 'https://flxt.tmsimg.com/assets/219586_v9_bb.jpg' WHERE idActor = '6161';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f0/Freddie_Highmore_2013_%28Straighten_Crop%29.jpg/1200px-Freddie_Highmore_2013_%28Straighten_Crop%29.jpg' WHERE idActor = '6162';
UPDATE ACTOR SET img = 'https://ntvb.tmsimg.com/assets/assets/81276_v9_bc.jpg?w=270&h=360' WHERE idActor = '6163';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/0/05/Richard_Schiff_2012_Shankbone.JPG' WHERE idActor = '6164';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BMTkxODM3ODY2Nl5BMl5BanBnXkFtZTgwMzAyMjU2NzE@._V1_FMjpg_UX1000_.jpg' WHERE idActor = '6165';
UPDATE ACTOR SET img = 'https://image.tmdb.org/t/p/w500/nUWjDdSvhcTX25CuheDFhCGEWqk.jpg' WHERE idActor = '6166';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BMTIwNTk3MzU0Ml5BMl5BanBnXkFtZTYwMDIwMzIz._V1_FMjpg_UX1000_.jpg' WHERE idActor = '6167';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Bob_Odenkirk_by_Gage_Skidmore_2.jpg/800px-Bob_Odenkirk_by_Gage_Skidmore_2.jpg' WHERE idActor = '6168';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/0/0c/Rhea_Seehorn_by_Gage_Skidmore.jpg' WHERE idActor = '6169';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/f/f7/Jonathan_Banks_2012_2.jpg' WHERE idActor = '6170';

UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BMTQ3MTQ5NjY5Ml5BMl5BanBnXkFtZTgwMTY0NzU5MDE@._V1_FMjpg_UX1000_.jpg' WHERE idActor = '6171';
UPDATE ACTOR SET img = 'https://flxt.tmsimg.com/assets/521774_v9_bb.jpg' WHERE idActor = '6172';
UPDATE ACTOR SET img = 'https://static.wikia.nocookie.net/homelandtv/images/7/78/Diego_Klattenhoff.jpg/revision/latest?cb=20190910102343' WHERE idActor = '6173';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/2/28/Zendaya_-_2019_by_Glenn_Francis.jpg' WHERE idActor = '6174';
UPDATE ACTOR SET img = 'https://static.wikia.nocookie.net/euphoria-hbo/images/2/20/Hunter_Schafer.jpg/revision/latest?cb=20201024094135' WHERE idActor = '6175';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BMTg3MTAzYWQtOTc1MS00MzcxLTkxYzUtOGU3NmJkODZjMWY2XkEyXkFqcGdeQXVyMjQwMDg0Ng@@._V1_.jpg' WHERE idActor = '6176';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bf/Gabriel_Macht_3241.jpg/640px-Gabriel_Macht_3241.jpg' WHERE idActor = '6177';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/57/Patrick_J_Adams_3486.jpg/1200px-Patrick_J_Adams_3486.jpg' WHERE idActor = '6178';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e4/Meghan%2C_The_Duchess_of_Sussex_%282022%29.JPG/800px-Meghan%2C_The_Duchess_of_Sussex_%282022%29.JPG' WHERE idActor = '6179';
UPDATE ACTOR SET img = 'https://flxt.tmsimg.com/assets/1027657_v9_bb.jpg' WHERE idActor = '6180';

UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BMjM4ZWU0YjItMjA4Yi00NTlkLWE0ODktMWMyNGEzMTc2NTA3XkEyXkFqcGdeQXVyMjQwMDg0Ng@@._V1_.jpg' WHERE idActor = '6181';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BMjI4MjcwMDIxMF5BMl5BanBnXkFtZTgwMzg3NTEwMjE@._V1_.jpg' WHERE idActor = '6182';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BNWIwZjYzYWUtNWRlZC00NjA5LWJhNjQtNTlmNTk3ZTJmZGQ0XkEyXkFqcGdeQXVyMjQwMDg0Ng@@._V1_.jpg' WHERE idActor = '6183';
UPDATE ACTOR SET img = 'https://iti.edu.sg/assets/Alumni/Yann-Yann-Photo-Credit-Wilfred-Weegee-resized.jpg' WHERE idActor = '6184';
UPDATE ACTOR SET img = 'https://static.wikia.nocookie.net/marvelcinematicuniverse/images/d/d4/Chin_Han.jpg/revision/latest?cb=20170116151018' WHERE idActor = '6185';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/James_Marsden_by_Gage_Skidmore.jpg/1200px-James_Marsden_by_Gage_Skidmore.jpg' WHERE idActor = '6186';
UPDATE ACTOR SET img = 'https://www.leplaw.com/wp-content/uploads/2019/05/IMG_4233-2-1024x1012.jpg' WHERE idActor = '6187';
UPDATE ACTOR SET img = 'https://smoda.elpais.com/wp-content/uploads/images/201417/rose_byrne_7889.jpg' WHERE idActor = '6188';
UPDATE ACTOR SET img = 'https://publish.purewow.net/wp-content/uploads/sites/2/2023/03/Quinta-Brunson-ICG-Publicists-Award-Carpet-CAT.jpg?fit=680%2C800' WHERE idActor = '6189';
UPDATE ACTOR SET img = 'https://dxbhsrqyrr690.cloudfront.net/sidearm.nextgen.sites/csun.sidearmsports.com/images/2020/6/17/Hale_Edmerson_Tre_13.jpg' WHERE idActor = '6190';

UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BNjE4YmU2MTItMjE0ZC00Y2YxLWJkYWMtOTNiMTc0MDFjNjJlXkEyXkFqcGdeQXVyMjQwMDg0Ng@@._V1_.jpg' WHERE idActor = '6191';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/68/Ali_Wong%2C_2013_%28cropped%29.jpg/826px-Ali_Wong%2C_2013_%28cropped%29.jpg' WHERE idActor = '6192';
UPDATE ACTOR SET img = 'https://image.tmdb.org/t/p/w500/77OZFr81qHDJl9JE9xAnsMj7Iuo.jpg' WHERE idActor = '6193';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/f/f3/Emmy_Rossum_cropped.jpg' WHERE idActor = '6194';
UPDATE ACTOR SET img = 'https://flxt.tmsimg.com/assets/66104_v9_bc.jpg' WHERE idActor = '6195';
UPDATE ACTOR SET img = 'https://flxt.tmsimg.com/assets/534861_v9_bc.jpg' WHERE idActor = '6196';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/9/96/Steve_Carell_November_2014.jpg' WHERE idActor = '6197';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BMTMyOTYzODQ5MF5BMl5BanBnXkFtZTcwMjE3MDgzMQ@@._V1_FMjpg_UX1000_.jpg' WHERE idActor = '6198';
UPDATE ACTOR SET img = 'https://flxt.tmsimg.com/assets/308909_v9_bb.jpg' WHERE idActor = '6199';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BMTI3NjYyMzgxNl5BMl5BanBnXkFtZTcwMjgyMzM0Mg@@._V1_.jpg' WHERE idActor = '6200';

UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/b/b3/Jon_Gries_by_Gage_Skidmore.jpg' WHERE idActor = '6201';
UPDATE ACTOR SET img = 'https://cdn.britannica.com/04/237304-050-4D1F8A65/Actor-F-Murray-Abraham-22nd-Annual-Screen-Actors-Guild-Awards.jpg' WHERE idActor = '6202';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BNTI2NjcyODk0NV5BMl5BanBnXkFtZTgwNTMxODc4NzE@._V1_.jpg' WHERE idActor = '6203';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/1/14/Sof%C3%ADa_Vergara_2019_by_Glenn_Francis.jpg' WHERE idActor = '6204';
UPDATE ACTOR SET img = 'https://flxt.tmsimg.com/assets/80632_v9_bb.jpg' WHERE idActor = '6205';
UPDATE ACTOR SET img = 'https://flxt.tmsimg.com/assets/33631_v9_bb.jpg' WHERE idActor = '6206';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/9/9b/Jim_Parsons_2016.jpg' WHERE idActor = '6207';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/b/ba/Kaley_Cuoco_by_Gage_Skidmore.jpg' WHERE idActor = '6208';
UPDATE ACTOR SET img = 'https://flxt.tmsimg.com/assets/13912_v9_bb.jpg' WHERE idActor = '6209';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/3/3f/Lisa_Kudrow_crop.jpg' WHERE idActor = '6210';

UPDATE ACTOR SET img = 'https://cdn.britannica.com/56/243656-050-2E4A5036/Jenna-Ortega-2023.jpg' WHERE idActor = '6211';
UPDATE ACTOR SET img = 'https://1883magazine.com/wp-content/uploads/2021/01/IMG_9799-WEB-scaled.jpg' WHERE idActor = '6212';
UPDATE ACTOR SET img = 'https://www.voici.fr/imgre/fit/~1~voi~2022~12~14~7abcb690-0005-4543-8f65-1449c8512959.jpeg/3841x4801/quality/80/percy-hynes-white.jpeg' WHERE idActor = '6213';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/38/Jeremy_Allen_White%2C_AT%26T_Center%2C_2013.jpg/640px-Jeremy_Allen_White%2C_AT%26T_Center%2C_2013.jpg' WHERE idActor = '6214';
UPDATE ACTOR SET img = 'https://flxt.tmsimg.com/assets/252022_v9_bc.jpg' WHERE idActor = '6215';
UPDATE ACTOR SET img = 'https://pyxis.nymag.com/v1/imgs/acd/19e/4af120fc39210c98a8f8beb5be6bb2ee25-ayo-edebiri-.jpg' WHERE idActor = '6216';
UPDATE ACTOR SET img = 'https://cdn.britannica.com/70/211670-050-69254076/Jerry-Seinfeld-2019.jpg' WHERE idActor = '6217';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BMTYzMDM2MTg2Nl5BMl5BanBnXkFtZTcwODQ0OTA1Mg@@._V1_FMjpg_UX1000_.jpg' WHERE idActor = '6218';
UPDATE ACTOR SET img = 'https://flxt.tmsimg.com/assets/45707_v9_ba.jpg' WHERE idActor = '6219';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BNDYxNGM5MDktMGRjOC00ZTRlLTllNDgtMDkyMTUzZWQ4Y2U3XkEyXkFqcGdeQXVyNDQxNjcxNQ@@._V1_.jpg' WHERE idActor = '6220';

UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/9/98/Zach_Aguilar_by_Gage_Skidmore.jpg' WHERE idActor = '6221';
UPDATE ACTOR SET img = 'https://animefagos.com/wp-content/uploads/2021/01/akarikito01.jpg' WHERE idActor = '6222';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d8/Josh_Grelle_%2823178965050%29.jpg/843px-Josh_Grelle_%2823178965050%29.jpg' WHERE idActor = '6223';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BZGE2MWNmYzAtNzllMy00NTk0LTk2ZjItYjcxNTE1OTNlNWJkXkEyXkFqcGdeQXVyMTExNDQ2MTI@._V1_.jpg' WHERE idActor = '6224';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BYjY5NWQ4NmItNzhkYS00OWUzLTlmNDQtNjdhZmI2ZDRkNWU1XkEyXkFqcGdeQXVyMTExNDQ2MTI@._V1_FMjpg_UX1000_.jpg' WHERE idActor = '6225';
UPDATE ACTOR SET img = 'https://media.npr.org/assets/img/2015/05/14/harry-shearer_vert-b0192af0209b8e5174b46f53d3a47b7073a89dc9.jpg' WHERE idActor = '6226';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/a/a0/Justin_Roiland_%2836434635662%29.jpg' WHERE idActor = '6227';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/0/02/Chris_Parnell_by_Gage_Skidmore.jpg' WHERE idActor = '6228';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BMTkxNjE0NzAxMF5BMl5BanBnXkFtZTcwNjQyMjQ4Mg@@._V1_FMjpg_UX1000_.jpg' WHERE idActor = '6229';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/0/0b/Trey_Parker_by_Gage_Skidmore.jpg' WHERE idActor = '6230';

UPDATE ACTOR SET img = 'https://flxt.tmsimg.com/assets/74354_v9_bb.jpg' WHERE idActor = '6231';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/0/07/Issac_Hayes_1998.jpg' WHERE idActor = '6232';
UPDATE ACTOR SET img = 'https://cdn.britannica.com/39/161839-050-43327C9F/Seth-MacFarlane.jpg' WHERE idActor = '6233';
UPDATE ACTOR SET img = 'https://static.wikia.nocookie.net/prowrestling/images/8/8d/Seth_Green.jpg/revision/latest?cb=20150913165708' WHERE idActor = '6234';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/6/6c/Tom_Kane_Magic_City_Con_2015.jpg' WHERE idActor = '6235';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/1/1f/Dee_Bradley_Baker_by_Gage_Skidmore.jpg' WHERE idActor = '6236';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/4/49/Matt_Lanter_%2852549148702%29.jpg' WHERE idActor = '6237';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BMTc5NjY4NjE0NF5BMl5BanBnXkFtZTcwODQ4ODUwOA@@._V1_.jpg' WHERE idActor = '6238';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BNTY3NDE5NTEyMl5BMl5BanBnXkFtZTgwNTUxMjg0NDE@._V1_.jpg' WHERE idActor = '6239';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c5/Nolan_North_by_Gage_Skidmore.jpg/1200px-Nolan_North_by_Gage_Skidmore.jpg' WHERE idActor = '6240';

UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Billy_West_Photo_Op_Animate%21_Columbus_2023.jpg/800px-Billy_West_Photo_Op_Animate%21_Columbus_2023.jpg' WHERE idActor = '6241';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BMzI2NTk1MzYxOV5BMl5BanBnXkFtZTcwMDE2MDQ4Nw@@._V1_FMjpg_UX1000_.jpg' WHERE idActor = '6242';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/a/a3/Katey_Sagal_Comic-Con_2011.jpg' WHERE idActor = '6243';
UPDATE ACTOR SET img = 'https://static.wikia.nocookie.net/avatar/images/d/d4/Zach_Tyler_Eisen.png/revision/latest?cb=20210515183014' WHERE idActor = '6244';
UPDATE ACTOR SET img = 'https://static.wikia.nocookie.net/disney/images/d/db/Mae_Whitman.jpg/revision/latest?cb=20190708192114' WHERE idActor = '6245';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0d/JK_Simmons_2009.jpg/640px-JK_Simmons_2009.jpg' WHERE idActor = '6246';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BMTMyNzYyNDE4MV5BMl5BanBnXkFtZTcwOTkxMDQ2NA@@._V1_FMjpg_UX1000_.jpg' WHERE idActor = '6247';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/5/51/DaveFiloni2016.jpg' WHERE idActor = '6248';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/2/27/Taylor_Gray_%2845710583344%29.jpg' WHERE idActor = '6249';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/Freddie_Prinze%2C_Jr._%2827600088526%29_%28cropped%29.jpg/640px-Freddie_Prinze%2C_Jr._%2827600088526%29_%28cropped%29.jpg' WHERE idActor = '6250';

UPDATE ACTOR SET img = 'https://static.wikia.nocookie.net/spongebob/images/c/c6/Rodger_Bumpass_Pic.jpg/revision/latest?cb=20200309215249' WHERE idActor = '6251';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/a/af/Arnold_Schwarzenegger_by_Gage_Skidmore_4.jpg' WHERE idActor = '6252';
UPDATE ACTOR SET img = 'https://ntvb.tmsimg.com/assets/assets/884255_v9_bb.jpg?w=270&h=360' WHERE idActor = '6253';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BY2RkYjYzNDItYjQyNy00ODgxLWFkMzItN2NiN2ZlOWVmZDgzXkEyXkFqcGdeQXVyODQ0NjQxNTI@._V1_.jpg' WHERE idActor = '6254';
UPDATE ACTOR SET img = 'https://flxt.tmsimg.com/assets/600563_v9_bb.jpg' WHERE idActor = '6255';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/6/6c/Priyanka-chopra-gesf-2018-7565.jpg' WHERE idActor = '6256';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/1/13/Stanley_Tucci_2017_Berlinale.jpg' WHERE idActor = '6257';
UPDATE ACTOR SET img = 'https://static.wikia.nocookie.net/arrow/images/7/70/Grant_Gustin.png/revision/latest?cb=20221226161959' WHERE idActor = '6258';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BNjMyZWNhMjYtOTFlYi00ZDVhLTk4MDctNTU1NGZhYzJmMDA2XkEyXkFqcGdeQXVyMzM4MjM0Nzg@._V1_FMjpg_UX1000_.jpg' WHERE idActor = '6259';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/3/3f/Danielle_Panabaker_at_H%26V_Fan_Fest_2016.jpg' WHERE idActor = '6260';

UPDATE ACTOR SET img = 'https://flxt.tmsimg.com/assets/559209_v9_bb.jpg' WHERE idActor = '6261';
UPDATE ACTOR SET img = 'https://www.nzherald.co.nz/resizer/e5qbOupHjusaMfQho7aponVIIlk=/576x864/smart/filters:quality(70)/cloudfront-ap-southeast-2.images.arcpublishing.com/nzme/SRLR6HQUL5ALHJIQBKH7LFUKIQ.JPG' WHERE idActor = '6262';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BMTg4NTM2OTgzOV5BMl5BanBnXkFtZTgwMjc4NzQwOTE@._V1_.jpg' WHERE idActor = '6263';
UPDATE ACTOR SET img = 'https://static.wikia.nocookie.net/amazons-the-boys/images/e/ee/Karl-Urban.jpg/revision/latest?cb=20180927212058' WHERE idActor = '6264';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/Jack_Quaid_by_Gage_Skidmore.jpg/1200px-Jack_Quaid_by_Gage_Skidmore.jpg' WHERE idActor = '6265';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/6/63/Antony_Starr_%28cropped%29.jpg' WHERE idActor = '6266';
UPDATE ACTOR SET img = 'https://flxt.tmsimg.com/assets/67480_v9_bd.jpg' WHERE idActor = '6267';
UPDATE ACTOR SET img = 'https://static.wikia.nocookie.net/swatcbs/images/e/e4/Alex_Russell.jpg/revision/latest?cb=20190208105806' WHERE idActor = '6268';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/a/aa/Kennyjohnson.jpg' WHERE idActor = '6269';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/b/bc/Chris_ODonnell_Max_Payne_2008.jpg' WHERE idActor = '6270';

UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/e/ee/Daniela_Ruah_-_Monte-Carlo_Television_Festival.jpg' WHERE idActor = '6271';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/67/LL_Cool_J_in_2017.jpg/640px-LL_Cool_J_in_2017.jpg' WHERE idActor = '6272';
UPDATE ACTOR SET img = 'https://flxt.tmsimg.com/assets/494435_v9_bb.jpg' WHERE idActor = '6273';
UPDATE ACTOR SET img = 'https://static.wikia.nocookie.net/thedescendants/images/f/f7/Christian_Convery_IMDB.jpg/revision/latest?cb=20181014061826' WHERE idActor = '6274';
UPDATE ACTOR SET img = 'https://flxt.tmsimg.com/assets/524733_v9_bb.jpg' WHERE idActor = '6275';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/68/Angela_Bassett_by_Gage_Skidmoe.jpg/800px-Angela_Bassett_by_Gage_Skidmoe.jpg' WHERE idActor = '6276';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BNzk4NjA5NDY5MV5BMl5BanBnXkFtZTcwMjU4MjgxNQ@@._V1_.jpg' WHERE idActor = '6277';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Oliver_Stark%2C_headshot_colour.jpg/1200px-Oliver_Stark%2C_headshot_colour.jpg' WHERE idActor = '6278';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/5/5d/Stuttgart_-Comic_Con_Germany_2019-_d90_by-RaBoe_143_%28cropped%29.jpg' WHERE idActor = '6279';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BOTRmZTJmOWItZTNkNy00ZTcwLWIwYTctMzU0MGYyZmVkYWY5XkEyXkFqcGdeQXVyNzM3MDAzMTI@._V1_.jpg' WHERE idActor = '6280';

UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BZDc2NWVkYzYtYjM2Yi00MGM2LWJkOTUtNTAxNWI0ZjllOTcyXkEyXkFqcGdeQXVyMjI0MTcxMDg@._V1_.jpg' WHERE idActor = '6281';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/9/90/Lazer_Team_premiere_-_Alan_Ritchson_%2827161983270%29_%28cropped%29.jpg' WHERE idActor = '6282';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BYTQzNzZhOTItYTJhZC00MjQzLWIxYjktZWQ1ZjAyYTAyMjk5XkEyXkFqcGdeQXVyMzU5MjI1NQ@@._V1_.jpg' WHERE idActor = '6283';
UPDATE ACTOR SET img = 'https://image.tmdb.org/t/p/w500/l2xGZi2091DxdCSNEu9xbJ0XRYK.jpg' WHERE idActor = '6284';
UPDATE ACTOR SET img = 'https://static.wikia.nocookie.net/doblaje/images/0/02/Ivana_Milicevic2.jpg/revision/latest?cb=20200802095229&path-prefix=es' WHERE idActor = '6285';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/b/b1/Ulrich_Thomsen_o.jpg' WHERE idActor = '6286';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BMTM5NjUxNTQ3OV5BMl5BanBnXkFtZTcwOTg4Mjc5Nw@@._V1_FMjpg_UX1000_.jpg' WHERE idActor = '6287';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/60/Ray_Stevenson_March_18%2C_2014_%28cropped%29.jpg/1200px-Ray_Stevenson_March_18%2C_2014_%28cropped%29.jpg' WHERE idActor = '6288';
UPDATE ACTOR SET img = 'https://flxt.tmsimg.com/assets/52302_v9_bb.jpg' WHERE idActor = '6289';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/c/cd/Brenton_Thwaites.jpg' WHERE idActor = '6290';

UPDATE ACTOR SET img = 'https://static.wikia.nocookie.net/quantico/images/4/4e/Anna_Diop2.png/revision/latest/thumbnail/width/360/height/450?cb=20160827224321' WHERE idActor = '6291';
UPDATE ACTOR SET img = 'https://static.wikia.nocookie.net/disney/images/2/27/Ryan_Potter.jpg/revision/latest?cb=20181112174418' WHERE idActor = '6292';
UPDATE ACTOR SET img = 'https://flxt.tmsimg.com/assets/613075_v9_bb.jpg' WHERE idActor = '6293';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/6/65/Peter_Dinklage-68257.jpg' WHERE idActor = '6294';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BMTA2NTI0NjYxMTBeQTJeQWpwZ15BbWU3MDIxMjgyNzY@._V1_.jpg' WHERE idActor = '6295';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c5/Pedro_Pascal_by_Gage_Skidmore.jpg/1200px-Pedro_Pascal_by_Gage_Skidmore.jpg' WHERE idActor = '6296';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BMWJkZWEyMWYtYWI1MS00ZTY0LTg2MTAtYjUzMWIwZDhjNmViXkEyXkFqcGdeQXVyNzI5MjUxNjE@._V1_FMjpg_UX1000_.jpg' WHERE idActor = '6297';
UPDATE ACTOR SET img = 'https://flxt.tmsimg.com/assets/520268_v9_bb.jpg' WHERE idActor = '6298';
UPDATE ACTOR SET img = 'https://static.wikia.nocookie.net/starwars/images/9/9c/ChristopherBartlett.png/revision/latest?cb=20210209023159' WHERE idActor = '6299';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/Katee_Sackhoff_%2852260655302%29_%28cropped%29.jpg/1200px-Katee_Sackhoff_%2852260655302%29_%28cropped%29.jpg' WHERE idActor = '6300';

UPDATE ACTOR SET img = 'https://www.unitedagents.co.uk/sites/default/files/thumbnails/image/katheryn-winnick-headshot-2.jpg' WHERE idActor = '6301';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/e/e9/Gustaf_Skarsg%C3%A5rd_2013_%28cropped%29.jpg' WHERE idActor = '6302';
UPDATE ACTOR SET img = 'https://flxt.tmsimg.com/assets/503860_v9_bc.jpg' WHERE idActor = '6303';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/5/52/Graham_McTavish_Photo_Op_GalaxyCon_Raleigh_2019.jpg' WHERE idActor = '6304';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BZWRiYjYzZDItMzc0YS00YzYxLWE0OWEtYmI2NjdhZTI0NmE0XkEyXkFqcGdeQXVyMzc2NDU0NQ@@._V1_.jpg' WHERE idActor = '6305';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BMTUyNTkxODIxN15BMl5BanBnXkFtZTgwOTU2MDAwMTE@._V1_.jpg' WHERE idActor = '6306';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BMTk5NTQ2NjMzNl5BMl5BanBnXkFtZTYwOTExMzY1._V1_.jpg' WHERE idActor = '6307';
UPDATE ACTOR SET img = 'https://www.tvguide.com/a/img/resize/7a86313f0da5a0e9d797e7f86f7d53f042126192/catalog/provider/10/9/10-BF1DFEAB-3558-4629-8B6C-FB4692A8FF8C.png?auto=webp&fit=crop&height=300&width=200' WHERE idActor = '6308';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/87/Patrick_Stewart_by_Gage_Skidmore_2.jpg/1200px-Patrick_Stewart_by_Gage_Skidmore_2.jpg' WHERE idActor = '6309';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/1/1c/Michelle_Hurd_by_Gage_Skidmore.jpg' WHERE idActor = '6310';

UPDATE ACTOR SET img = 'https://images.mubicdn.net/images/cast_member/47087/cache-301903-1516237715/image-w856.jpg?size=800x' WHERE idActor = '6311';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/Freya_Allan_by_Gage_Skidmore.jpg/1200px-Freya_Allan_by_Gage_Skidmore.jpg' WHERE idActor = '6312';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/8/88/Anya_Chalotra_by_Gage_Skidmore.jpg' WHERE idActor = '6313';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c6/Diego_Luna_Berlinale_2017.jpg/800px-Diego_Luna_Berlinale_2017.jpg' WHERE idActor = '6314';
UPDATE ACTOR SET img = 'https://d27o7y1r7mnbwc.cloudfront.net/media/uploads/clients/kyle-soller/images/gallery/2022-07-22_164615_Kyle_Soller.jpg' WHERE idActor = '6315';
UPDATE ACTOR SET img = 'https://flxt.tmsimg.com/assets/286678_v9_bc.jpg' WHERE idActor = '6316';
UPDATE ACTOR SET img = 'https://static.wikia.nocookie.net/disney/images/b/b6/Eugene_Cordero.png/revision/latest?cb=20210611051309' WHERE idActor = '6317';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BMTc4OTMyNzMxNF5BMl5BanBnXkFtZTgwODUzMDExMzE@._V1_.jpg' WHERE idActor = '6318';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BNTcxNzkxNzc5MV5BMl5BanBnXkFtZTgwODc2MjA0NzM@._V1_.jpg' WHERE idActor = '6319';
UPDATE ACTOR SET img = 'https://static.wikia.nocookie.net/lotr/images/9/9a/Charlie_Vickers.jpg/revision/latest?cb=20200120151043' WHERE idActor = '6320';

UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8f/Ginnifer_Goodwin_by_David_Shankbone_2.jpg/205px-Ginnifer_Goodwin_by_David_Shankbone_2.jpg' WHERE idActor = '6321';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/Jennifer_Morrison_SDCC_2014.jpg/1200px-Jennifer_Morrison_SDCC_2014.jpg' WHERE idActor = '6322';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/45/Lana_Parrilla_Photo_Op_GalaxyCon_Richmond_2022_%28cropped%29.jpg/1200px-Lana_Parrilla_Photo_Op_GalaxyCon_Richmond_2022_%28cropped%29.jpg' WHERE idActor = '6323';
UPDATE ACTOR SET img = 'https://resizing.flixster.com/CbqVJ1ytK31FEiKPnndNscCvYTo=/218x280/v2/https://flxt.tmsimg.com/assets/487578_v9_ba.jpg' WHERE idActor = '6324';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/9/94/Danielle_Brooks_2014.jpg' WHERE idActor = '6325';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BNzg3ZTI0NjYtN2Q4Zi00ZmY4LWFmZjgtYThmN2Q3OTNhNGQ0XkEyXkFqcGdeQXVyMTI2Nzk3NzI4._V1_.jpg' WHERE idActor = '6326';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/39/Elliot_Page_2021_%28cropped%29.png/640px-Elliot_Page_2021_%28cropped%29.png' WHERE idActor = '6327';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/54/Aidan_Gallagher_-_2018_%28cropped%29.jpg/800px-Aidan_Gallagher_-_2018_%28cropped%29.jpg' WHERE idActor = '6328';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/b/bf/Tom_Hopper_Brussels_Comiccon_2022_%28cropped%29.jpg' WHERE idActor = '6329';
UPDATE ACTOR SET img = 'https://flxt.tmsimg.com/assets/515489_v9_bc.jpg' WHERE idActor = '6330';

UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BYjdjZDQyMjAtMjcwNC00MDEzLWI1NTktYWZlZTE5MjU0NWMxXkEyXkFqcGdeQXVyMjUxOTk2Mzg@._V1_FMjpg_UX1000_.jpg' WHERE idActor = '6331';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BYTZmYjQxMjYtMDNhNS00NmUyLTg4NjEtOGMxMDRkZWU4MDQxXkEyXkFqcGdeQXVyMTAxOTYyMDk@._V1_.jpg' WHERE idActor = '6332';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/c/ca/Kim_Dickens_by_Gage_Skidmore_2.jpg' WHERE idActor = '6333';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/3/3b/Frank_Dillane_by_Gage_Skidmore_3.jpg' WHERE idActor = '6334';
UPDATE ACTOR SET img = 'https://static.wikia.nocookie.net/walkingdead/images/e/e6/CliffCurtisAwesome.jpg/revision/latest?cb=20190622052101' WHERE idActor = '6335';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BMzViYjU4YjEtNWM1OC00MTk4LTk2ODMtOGM4NmM5ZDA3ZWI3XkEyXkFqcGdeQXVyMjUwMDQ4MTk@._V1_FMjpg_UX1000_.jpg' WHERE idActor = '6336';
UPDATE ACTOR SET img = 'https://static.wikia.nocookie.net/starwars/images/1/14/Christina_Chong.jpg/revision/latest?cb=20161214191318' WHERE idActor = '6337';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/b/b9/Anson_Mount_by_Gage_Skidmore_2.jpg' WHERE idActor = '6338';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/5/56/Jodie_Whittaker_%2852553050691%29.jpg' WHERE idActor = '6339';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BMjA0NTE0NDQ3OV5BMl5BanBnXkFtZTcwMjkwMjkxOA@@._V1_FMjpg_UX1000_.jpg' WHERE idActor = '6340';

UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/e/e5/Pearl_Mackie_by_Gage_Skidmore.jpg' WHERE idActor = '6341';
UPDATE ACTOR SET img = 'https://flxt.tmsimg.com/assets/797525_v9_ba.jpg' WHERE idActor = '6342';
UPDATE ACTOR SET img = 'https://flxt.tmsimg.com/assets/531100_v9_bb.jpg' WHERE idActor = '6343';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d5/JR_Ramirez-cropped.jpg/1200px-JR_Ramirez-cropped.jpg' WHERE idActor = '6344';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/b/bb/David_Duchovny_by_Gage_Skidmore.jpg' WHERE idActor = '6345';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/55/Gillian_Anderson_Berlinale_2017.jpg/1200px-Gillian_Anderson_Berlinale_2017.jpg' WHERE idActor = '6346';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/c/cb/Mitch_Pileggi_Wellington_2013.jpg' WHERE idActor = '6347';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BMTQ4MjM4OTA2OF5BMl5BanBnXkFtZTcwNDM3NzIzOQ@@._V1_FMjpg_UX1000_.jpg' WHERE idActor = '6348';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BMTU2NTAwNDU2M15BMl5BanBnXkFtZTcwOTc5MTQyNg@@._V1_.jpg' WHERE idActor = '6349';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Eliza_Taylor_New_2021.jpg' WHERE idActor = '6350';

UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e1/Bob_Morley_%2827468730956%29_%28cropped%29.jpg/1200px-Bob_Morley_%2827468730956%29_%28cropped%29.jpg' WHERE idActor = '6351';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BNTIzOGEzYzQtMzVkYy00Y2JiLThmZDUtODFkODJjNmUxZGM3XkEyXkFqcGdeQXVyOTYwOTMwNjk@._V1_FMjpg_UX1000_.jpg' WHERE idActor = '6352';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/EvanRachelWood.jpg/1200px-EvanRachelWood.jpg' WHERE idActor = '6353';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Jeffrey_Wright_by_Gage_Skidmore_3.jpg/1200px-Jeffrey_Wright_by_Gage_Skidmore_3.jpg' WHERE idActor = '6354';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BMjE4NDM4ODc2OV5BMl5BanBnXkFtZTcwNzA5NjQ5MQ@@._V1_FMjpg_UX1000_.jpg' WHERE idActor = '6355';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/MKr23820_Alexander_Karim_%28Der_Schwarm%2C_Berlinale_2023%29.jpg/640px-MKr23820_Alexander_Karim_%28Der_Schwarm%2C_Berlinale_2023%29.jpg' WHERE idActor = '6356';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/C%C3%A9cile_de_France_Cannes_2018.jpg/640px-C%C3%A9cile_de_France_Cannes_2018.jpg' WHERE idActor = '6357';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/75/MKr21540_Leonie_Benesch_%28Das_Lehrerzimmer%2C_Berlinale_2023%29.jpg/640px-MKr21540_Leonie_Benesch_%28Das_Lehrerzimmer%2C_Berlinale_2023%29.jpg' WHERE idActor = '6358';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/5/5a/Chloe_Moretz_2018_2.jpg' WHERE idActor = '6359';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BM2FhZGM5ZjItZmQwMC00Y2NmLTk3YTgtNTI4NDE4ZjQ5OTNhXkEyXkFqcGdeQXVyNjI2Njg2OTY@._V1_.jpg' WHERE idActor = '6360';

UPDATE ACTOR SET img = 'https://i.pinimg.com/originals/f3/6c/9d/f36c9d2ec87c660376f7b2e9a4e2038f.jpg' WHERE idActor = '6361';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/2/22/Jason_Momoa_%2843055621224%29_%28cropped%29.jpg' WHERE idActor = '6362';
UPDATE ACTOR SET img = 'https://image.tmdb.org/t/p/w500/wKC9LgqgJRCXuzs1kUKaK7Uicv.jpg' WHERE idActor = '6363';
UPDATE ACTOR SET img = 'https://flxt.tmsimg.com/assets/679284_v9_bb.jpg' WHERE idActor = '6364';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BMTg1MjQ0MDg0Nl5BMl5BanBnXkFtZTcwNjYyNjI5Mg@@._V1_FMjpg_UX1000_.jpg' WHERE idActor = '6365';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BM2IyZGU5ODUtZDdiOS00NmRjLWJjMDAtZGYyMGFmMDdiNmQ0XkEyXkFqcGdeQXVyODcyOTMxMTc@._V1_.jpg' WHERE idActor = '6366';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BNjkwODExOTUtY2RjNC00ZWIyLTgzNTgtODM3OTQ4NGZmZmVkXkEyXkFqcGdeQXVyNzA3OTc5NzQ@._V1_.jpg' WHERE idActor = '6367';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/3/32/Pablo_Schreiber_in_2018.jpg' WHERE idActor = '6368';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/0/06/Shabana_Azmi_SFU_honorary_degree_%28cropped%29.jpg' WHERE idActor = '6369';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BYTA3MGFiZDQtOTg2OC00MGZjLTgzOTgtNGJhZjhlMjJlM2Y0XkEyXkFqcGdeQXVyMjQwMDg0Ng@@._V1_.jpg' WHERE idActor = '6370';

UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/f/f6/Andrew_Lincoln_%2842749683025%29_%28cropped%29.jpg' WHERE idActor = '6371';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BMTQ5ODE4NTgzMl5BMl5BanBnXkFtZTcwODI0MjAwMw@@._V1_FMjpg_UX1000_.jpg' WHERE idActor = '6372';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/0/0c/Melissa_McBride_by_Gage_Skidmore_2.jpg' WHERE idActor = '6373';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/9/99/Millie_Bobby_Brown_-_MBB_-_Portrait_1_-_SFM5_-_July_10%2C_2022_at_Stranger_Fan_Meet_5_People_Convention_%28cropped%29.jpg' WHERE idActor = '6374';
UPDATE ACTOR SET img = 'https://image.tmdb.org/t/p/w500/5OVmquAk0W5BIsRlVKslEP497JD.jpg' WHERE idActor = '6375';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/89/Winona_Ryder_2010_TIFF.jpg/800px-Winona_Ryder_2010_TIFF.jpg' WHERE idActor = '6376';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Jared_Padalecki_%2835444305903%29.jpg/1200px-Jared_Padalecki_%2835444305903%29.jpg' WHERE idActor = '6377';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/b/bc/Jensen_Ackles_%2848478244212%29_%28cropped%29.jpg' WHERE idActor = '6378';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BMjExMjgzMzYtMjYzNy00MzBiLTg4ZjctNGZiNDI3MTk5NDRiXkEyXkFqcGdeQXVyNjUxMjc1OTM@._V1_FMjpg_UX1000_.jpg' WHERE idActor = '6379';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/0/0e/Lady_Gaga_at_Joe_Biden%27s_inauguration_%28cropped_5%29.jpg' WHERE idActor = '6380';

UPDATE ACTOR SET img = 'https://cdn.britannica.com/36/157036-050-866B604C/Kathy-Bates-2011.jpg' WHERE idActor = '6381';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BMzliNzA0OTktMTE3Ny00OWY2LTllY2ItY2UwZmI2OGRmYTI2XkEyXkFqcGdeQXVyMTM5NDMzMjY@._V1_.jpg' WHERE idActor = '6382';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BM2UwMDg3OTQtMDcyOC00YmE0LWFhMjktMzg5MDUzZWNjOWQxXkEyXkFqcGdeQXVyMjU1MzE0NQ@@._V1_.jpg' WHERE idActor = '6383';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Ian_Somerhalder_Cannes_2015.jpg' WHERE idActor = '6384';
UPDATE ACTOR SET img = 'https://flxt.tmsimg.com/assets/449852_v9_bc.jpg' WHERE idActor = '6385';
UPDATE ACTOR SET img = 'https://image.tmdb.org/t/p/w500/ljQvjbPmcIAl205Lb2Mu4CW8WO7.jpg' WHERE idActor = '6386';
UPDATE ACTOR SET img = 'https://flxt.tmsimg.com/assets/74113_v9_bb.jpg' WHERE idActor = '6387';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BMjQxODQ1NjQxNl5BMl5BanBnXkFtZTgwNzEwMjk1MDI@._V1_.jpg' WHERE idActor = '6388';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BMDUxMTRlZGItNmE0Ni00MWI5LTk3MWUtYjZhOTA4NTRkMzMzXkEyXkFqcGdeQXVyODg2NDgzMTc@._V1_.jpg' WHERE idActor = '6389';
UPDATE ACTOR SET img = 'https://www.tvguide.com/a/img/resize/109a38543851accfdbf82e8666a4965fc8a24ca2/catalog/provider/10/9/10-81162FBD-FEAC-4009-AFFF-8DF6BE459BE6.png?auto=webp&fit=crop&height=300&width=200' WHERE idActor = '6390';

UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BMTgzMjQ0NTc5Nl5BMl5BanBnXkFtZTcwMDc0MDYwOA@@._V1_FMjpg_UX1000_.jpg' WHERE idActor = '6391';
UPDATE ACTOR SET img = 'https://images.fandango.com/ImageRenderer/300/0/redesign/static/img/default_poster.png/0/images/masterrepository/performer%20images/163822/NatasiaDemetriou-2019.jpg' WHERE idActor = '6392';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/1/1e/Hugh_Dancy_at_the_36th_Toronto_International_Film_Festival%2C_September_2011_%2801%29.jpg' WHERE idActor = '6393';
UPDATE ACTOR SET img = 'https://flxt.tmsimg.com/assets/85363_v9_bc.jpg' WHERE idActor = '6394';
UPDATE ACTOR SET img = 'https://flxt.tmsimg.com/assets/181910_v9_bc.jpg' WHERE idActor = '6395';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/S/pv-target-images/9fd94a7faed12e81c87d3269a1c4e2cb522545b7314860f1730be98d28f6f3af.jpg' WHERE idActor = '6396';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BNThjOTUwYjMtZTRhZS00ZTY4LTg4NDYtN2NlODQ2ODk0OWJjXkEyXkFqcGdeQXVyMTAzNjE1NTgx._V1_.jpg' WHERE idActor = '6397';
UPDATE ACTOR SET img = 'https://static.wikia.nocookie.net/bakugan/images/a/a9/Joannevannicola.jpg/revision/latest?cb=20110503194447' WHERE idActor = '6398';
UPDATE ACTOR SET img = 'https://image.tmdb.org/t/p/w500/jJJGmVKvMFHMJEwyfiHgxXEFePO.jpg' WHERE idActor = '6399';
UPDATE ACTOR SET img = 'https://image.tmdb.org/t/p/w500/z7PA2poYtjl9KSy4S0IgW6d5Y9.jpg' WHERE idActor = '6400';

UPDATE ACTOR SET img = 'https://static.wikia.nocookie.net/altered-carbon/images/f/f4/Kristin_Lehman.jpg/revision/latest?cb=20180206132134' WHERE idActor = '6401';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/3/36/Ben_Mendelsohn_by_Gage_Skidmore.jpg' WHERE idActor = '6402';
UPDATE ACTOR SET img = 'https://flxt.tmsimg.com/assets/281686_v9_bb.jpg' WHERE idActor = '6403';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/6/66/Jeremy_Bobb_2015.jpg' WHERE idActor = '6404';
UPDATE ACTOR SET img = 'https://static.wikia.nocookie.net/scandal/images/1/1f/2020_Locke_and_Key_-_Darby_Stanchfield_01.jpg/revision/latest?cb=20200226205916' WHERE idActor = '6405';
UPDATE ACTOR SET img = 'https://resizing.flixster.com/dMjhj9uvMvrgjSvKR15fdc0mZFA=/218x280/v2/https://flxt.tmsimg.com/assets/622224_v9_bb.jpg' WHERE idActor = '6406';
UPDATE ACTOR SET img = 'https://upload.wikimedia.org/wikipedia/commons/c/cb/Emilia_jones_2022_1.jpg' WHERE idActor = '6407';
UPDATE ACTOR SET img = 'https://static.wikia.nocookie.net/the-owl-house/images/3/3a/Sarah_Nicole-Robles.jpg/revision/latest?cb=20200721014045' WHERE idActor = '6408';
UPDATE ACTOR SET img = 'https://static.wikia.nocookie.net/gravityfalls/images/e/e8/Alex_Hirsch_Pic.jpg/revision/latest?cb=20210925192709' WHERE idActor = '6409';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BOTZiZWJlNjktNmEzMC00Mjg2LWE3ZTEtMmE0NDA3M2IzN2Q2XkEyXkFqcGdeQXVyMjIwMDY1NDg@._V1_.jpg' WHERE idActor = '6410';

UPDATE ACTOR SET img = 'https://static.wikia.nocookie.net/batesmotel/images/0/00/Vera_Farmiga_2.jpg/revision/latest?cb=20150411101208' WHERE idActor = '6411';
UPDATE ACTOR SET img = 'https://flxt.tmsimg.com/assets/295124_v9_bb.jpg' WHERE idActor = '6412';

UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BMTYxNzMxMTMwMV5BMl5BanBnXkFtZTYwODM3MTI0._V1_FMjpg_UX1000_.jpg' WHERE idActor = '6426';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BMTU4MjYxMDc3MF5BMl5BanBnXkFtZTYwNzU3MDIz._V1_FMjpg_UX1000_.jpg' WHERE idActor = '6427';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BMTg0ODMzODM5N15BMl5BanBnXkFtZTcwMDIxNTUwOA@@._V1_.jpg' WHERE idActor = '6428';
UPDATE ACTOR SET img = 'https://res.cloudinary.com/dibsl9ebc/image/upload/v1443741600/hvd2p39dqpebzsv71rfd.jpg' WHERE idActor = '6429';
UPDATE ACTOR SET img = 'https://image.tmdb.org/t/p/w500/kC2Movbs6uEF8DdDhvyHizQHuru.jpg' WHERE idActor = '6430';
UPDATE ACTOR SET img = 'https://media.glamour.com/photos/5695b93716d0dc3747edc07f/master/w_1600%2Cc_limit/weddings-2013-11-1-isabelle-fuhrman-catching-fire-premiere-headband-1119-main.jpg' WHERE idActor = '6431';
UPDATE ACTOR SET img = 'https://images.mubicdn.net/images/cast_member/141888/cache-299501-1515769021/image-w856.jpg' WHERE idActor = '6432';
UPDATE ACTOR SET img = 'https://flxt.tmsimg.com/assets/497592_v9_bb.jpg' WHERE idActor = '6433';
UPDATE ACTOR SET img = 'https://fwcdn.pl/ppo/95/68/1269568/413151.3.jpg' WHERE idActor = '6434';
UPDATE ACTOR SET img = 'https://m.media-amazon.com/images/M/MV5BNGE5NmJhMWMtMzM4NC00ZGQ2LWE0OTEtNmFhMDczNzIzZjJmXkEyXkFqcGdeQXVyMjQwMDg0Ng@@._V1_.jpg' WHERE idActor = '6435';

