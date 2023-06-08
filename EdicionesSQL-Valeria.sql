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

UPDATE ACTOR SET img = '' WHERE idActor = '6061';
UPDATE ACTOR SET img = '' WHERE idActor = '6062';
UPDATE ACTOR SET img = '' WHERE idActor = '6063';
UPDATE ACTOR SET img = '' WHERE idActor = '6064';
UPDATE ACTOR SET img = '' WHERE idActor = '6065';
UPDATE ACTOR SET img = '' WHERE idActor = '6066';
UPDATE ACTOR SET img = '' WHERE idActor = '6067';
UPDATE ACTOR SET img = '' WHERE idActor = '6068';
UPDATE ACTOR SET img = '' WHERE idActor = '6069';
UPDATE ACTOR SET img = '' WHERE idActor = '6070';
UPDATE ACTOR SET img = '' WHERE idActor = '6071';
UPDATE ACTOR SET img = '' WHERE idActor = '6072';
UPDATE ACTOR SET img = '' WHERE idActor = '6073';
UPDATE ACTOR SET img = '' WHERE idActor = '6074';
UPDATE ACTOR SET img = '' WHERE idActor = '6075';
UPDATE ACTOR SET img = '' WHERE idActor = '6076';
UPDATE ACTOR SET img = '' WHERE idActor = '6077';
UPDATE ACTOR SET img = '' WHERE idActor = '6078';
UPDATE ACTOR SET img = '' WHERE idActor = '6079';
UPDATE ACTOR SET img = '' WHERE idActor = '6080';
UPDATE ACTOR SET img = '' WHERE idActor = '6081';
UPDATE ACTOR SET img = '' WHERE idActor = '6082';
UPDATE ACTOR SET img = '' WHERE idActor = '6083';
UPDATE ACTOR SET img = '' WHERE idActor = '6084';
UPDATE ACTOR SET img = '' WHERE idActor = '6085';
UPDATE ACTOR SET img = '' WHERE idActor = '6086';
UPDATE ACTOR SET img = '' WHERE idActor = '6087';
UPDATE ACTOR SET img = '' WHERE idActor = '6088';
UPDATE ACTOR SET img = '' WHERE idActor = '6089';
UPDATE ACTOR SET img = '' WHERE idActor = '6090';
UPDATE ACTOR SET img = '' WHERE idActor = '6091';
UPDATE ACTOR SET img = '' WHERE idActor = '6092';
UPDATE ACTOR SET img = '' WHERE idActor = '6093';
UPDATE ACTOR SET img = '' WHERE idActor = '6094';
UPDATE ACTOR SET img = '' WHERE idActor = '6095';
UPDATE ACTOR SET img = '' WHERE idActor = '6096';
UPDATE ACTOR SET img = '' WHERE idActor = '6097';
UPDATE ACTOR SET img = '' WHERE idActor = '6098';
UPDATE ACTOR SET img = '' WHERE idActor = '6099';
UPDATE ACTOR SET img = '' WHERE idActor = '6100';
UPDATE ACTOR SET img = '' WHERE idActor = '6101';
UPDATE ACTOR SET img = '' WHERE idActor = '6102';
UPDATE ACTOR SET img = '' WHERE idActor = '6103';
UPDATE ACTOR SET img = '' WHERE idActor = '6104';
UPDATE ACTOR SET img = '' WHERE idActor = '6105';
UPDATE ACTOR SET img = '' WHERE idActor = '6106';
UPDATE ACTOR SET img = '' WHERE idActor = '6107';
UPDATE ACTOR SET img = '' WHERE idActor = '6108';
UPDATE ACTOR SET img = '' WHERE idActor = '6109';
UPDATE ACTOR SET img = '' WHERE idActor = '6110';
UPDATE ACTOR SET img = '' WHERE idActor = '6111';
UPDATE ACTOR SET img = '' WHERE idActor = '6112';
UPDATE ACTOR SET img = '' WHERE idActor = '6113';
UPDATE ACTOR SET img = '' WHERE idActor = '6114';
UPDATE ACTOR SET img = '' WHERE idActor = '6115';
UPDATE ACTOR SET img = '' WHERE idActor = '6116';
UPDATE ACTOR SET img = '' WHERE idActor = '6117';
UPDATE ACTOR SET img = '' WHERE idActor = '6118';
UPDATE ACTOR SET img = '' WHERE idActor = '6119';
UPDATE ACTOR SET img = '' WHERE idActor = '6120';
UPDATE ACTOR SET img = '' WHERE idActor = '6121';
UPDATE ACTOR SET img = '' WHERE idActor = '6122';
UPDATE ACTOR SET img = '' WHERE idActor = '6123';
UPDATE ACTOR SET img = '' WHERE idActor = '6124';
UPDATE ACTOR SET img = '' WHERE idActor = '6125';
UPDATE ACTOR SET img = '' WHERE idActor = '6126';
UPDATE ACTOR SET img = '' WHERE idActor = '6127';
UPDATE ACTOR SET img = '' WHERE idActor = '6128';
UPDATE ACTOR SET img = '' WHERE idActor = '6129';
UPDATE ACTOR SET img = '' WHERE idActor = '6130';
UPDATE ACTOR SET img = '' WHERE idActor = '6131';
UPDATE ACTOR SET img = '' WHERE idActor = '6132';
UPDATE ACTOR SET img = '' WHERE idActor = '6133';
UPDATE ACTOR SET img = '' WHERE idActor = '6134';
UPDATE ACTOR SET img = '' WHERE idActor = '6135';
UPDATE ACTOR SET img = '' WHERE idActor = '6136';
UPDATE ACTOR SET img = '' WHERE idActor = '6137';
UPDATE ACTOR SET img = '' WHERE idActor = '6138';
UPDATE ACTOR SET img = '' WHERE idActor = '6139';
UPDATE ACTOR SET img = '' WHERE idActor = '6140';
UPDATE ACTOR SET img = '' WHERE idActor = '6141';
UPDATE ACTOR SET img = '' WHERE idActor = '6142';
UPDATE ACTOR SET img = '' WHERE idActor = '6143';
UPDATE ACTOR SET img = '' WHERE idActor = '6144';
UPDATE ACTOR SET img = '' WHERE idActor = '6145';
UPDATE ACTOR SET img = '' WHERE idActor = '6146';
UPDATE ACTOR SET img = '' WHERE idActor = '6147';
UPDATE ACTOR SET img = '' WHERE idActor = '6148';

