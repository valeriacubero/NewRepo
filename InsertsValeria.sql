
USE Lenguajes_Proyecto_VJE
GO

/*****COMEDY*****/
--1.
DECLARE @actors ActorList;
INSERT INTO @actors (nameT, lastNameT, birthT)
VALUES ('Lauren', 'Lapkus', '1985-09-06'), 
       ('Nick', 'Swardson', '1976-10-09'), 
	   ('David', 'Spade', '1964-07-22');
	   
DECLARE @genders GenderList;
INSERT INTO @genders (typeG)
VALUES ('Comedy');

EXEC InsertMovie --MOVIE, ACTOR, ActorMovie, GenderMovie, AUDIT
	1001,
	'Wrong Missy',
	'1h 20m',
	'2020-05-13',
	'Tyler Spindel',
	'Netflix',
	'x',
	'Tim thinks he is invited the woman of his dreams on a work retreat to Hawaii, realizing too late he mistakenly texted someone from a nightmare blind date.',
	@actors, --Actors List
	@genders --Gender List

--2.
DECLARE @actors ActorList;
INSERT INTO @actors (nameT, lastNameT, birthT)
VALUES ('Adam', 'Sandler', '1966-09-09'), 
       ('Salma', 'Hayek', '1966-09-02'), 
	   ('David', 'Spade', '1964-07-22');
	   
DECLARE @genders GenderList;
INSERT INTO @genders (typeG)
VALUES ('Comedy');

EXEC InsertMovie --MOVIE, ACTOR, ActorMovie, GenderMovie, AUDIT
	1001,
	'Grown Ups',
	'1h 42m',
	'2010-06-25',
	'Dennis Dugan',
	'Sony Pictures',
	'xx',
	'After their high school basketball coach passes away, five good friends and former teammates reunite for a Fourth of July holiday weekend.',
	@actors, --Actors List
	@genders --Gender List

--3.
DECLARE @actors ActorList;
INSERT INTO @actors (nameT, lastNameT, birthT)
VALUES ('Jennifer', 'Aniston', '1969-02-11'), 
       ('Emma', 'Roberts', '1991-02-10'), 
	   ('Jason', 'Sudeikis', '1975-09-18');
	   
DECLARE @genders GenderList;
INSERT INTO @genders (typeG)
VALUES ('Comedy');

EXEC InsertMovie --MOVIE, ACTOR, ActorMovie, GenderMovie, AUDIT
	1001,
	'We are the Millers',
	'1h 50m',
	'2013-08-07',
	'Rawson Marshall Thurber',
	'Warner Bros. Pictures',
	'xxx',
	'A veteran pot dealer creates a fake family as part of his plan to move a huge shipment of weed into the U.S. from Mexico.',
	@actors, --Actors List
	@genders --Gender List

--4.
DECLARE @actors ActorList;
INSERT INTO @actors (nameT, lastNameT, birthT)
VALUES ('Robert', 'De Niro', '1943-08-17'), 
       ('Anne', 'Hathaway', '1982-11-12'), 
	   ('Adam', 'DeVine', '1983-11-07');
	   
DECLARE @genders GenderList;
INSERT INTO @genders (typeG)
VALUES ('Comedy'), ('Drama');

EXEC InsertMovie --MOVIE, ACTOR, ActorMovie, GenderMovie, AUDIT
	1001,
	'The Intern',
	'1h 01m',
	'2015-09-25',
	'Nancy Meyers',
	'Warner Bros. Pictures',
	'xxxx',
	'Seventy-year-old widower Ben Whittaker has discovered that retirement is not all it is cracked up to be. Seizing an opportunity to get back in the game, he becomes a senior intern at an online fashion site, founded and run by Jules Ostin.',
	@actors, --Actors List
	@genders --Gender List

--5.
DECLARE @actors ActorList;
INSERT INTO @actors (nameT, lastNameT, birthT)
VALUES ('Dan', 'Castellaneta', '1957-10-29'), 
       ('Yeardley', 'Smith', '1964-07-03'), 
	   ('Nancy', 'Cartwright', '1957-10-25');
	   
DECLARE @genders GenderList;
INSERT INTO @genders (typeG)
VALUES ('Comedy'), ('Animated');

EXEC InsertMovie --MOVIE, ACTOR, ActorMovie, GenderMovie, AUDIT
	1001,
	'The Simpsons Movie',
	'1h 27m',
	'2007-07-27',
	'David Silverman',
	'20th Century Studios',
	'xxxxx',
	'After Homer pollutes the town''s water supply, Springfield is encased in a gigantic dome by the EPA and the Simpsons are declared fugitives.',
	@actors, --Actors List
	@genders --Gender List

--6.
DECLARE @actors ActorList;
INSERT INTO @actors (nameT, lastNameT, birthT)
VALUES ('Marlon', 'Wayans', '1972-07-23'), 
       ('Shawn', 'Wayans', '1971-01-19'), 
	   ('Kerry', 'Washington', '1977-01-31');
	   
DECLARE @genders GenderList;
INSERT INTO @genders (typeG)
VALUES ('Comedy');

EXEC InsertMovie --MOVIE, ACTOR, ActorMovie, GenderMovie, AUDIT
	1001,
	'Little Man',
	'1h 38m',
	'2006-07-14',
	'Keenen Ivory Wayans',
	'Sony Pictures',
	'xxxxxx',
	'A wannabe-dad mistakes a vertically-challenged criminal on the lam for his newly-adopted son.',
	@actors, --Actors List
	@genders --Gender List

--7.
DECLARE @actors ActorList;
INSERT INTO @actors (nameT, lastNameT, birthT)
VALUES ('Johnny', 'Knoxville', '1971-03-11'), 
       ('Steve', '-O', '1974-06-13'), 
	   ('Bam', 'Margera', '1979-09-28');
	   
DECLARE @genders GenderList;
INSERT INTO @genders (typeG)
VALUES ('Comedy'), ('Action');

EXEC InsertMovie --MOVIE, ACTOR, ActorMovie, GenderMovie, AUDIT
	1001,
	'Jackass: The Movie',
	'1h 37m',
	'2002-10-25',
	'Jeff Tremaine',
	'MTV Films',
	'xxxxxxx',
	'The cast performs various crazy stunts for our amusement.',
	@actors, --Actors List
	@genders --Gender List

--8.
DECLARE @actors ActorList;
INSERT INTO @actors (nameT, lastNameT, birthT)
VALUES ('Jonah', 'Hill', '1983-12-20'), 
       ('Michael', 'Cera', '1988-06-07'), 
	   ('Christopher', 'Mintz-Plasse', '1989-06-20');
	   
DECLARE @genders GenderList;
INSERT INTO @genders (typeG)
VALUES ('Comedy');

EXEC InsertMovie --MOVIE, ACTOR, ActorMovie, GenderMovie, AUDIT
	1001,
	'Super Bad',
	'1h 53m',
	'2007-08-17',
	'Greg Mottola',
	'Sony Pictures',
	'xxxxxxxx',
	'Two co-dependent high school seniors are forced to deal with separation anxiety after their plan to stage a booze-soaked party goes away.',
	@actors, --Actors List
	@genders --Gender List

--9.
DECLARE @actors ActorList;
INSERT INTO @actors (nameT, lastNameT, birthT)
VALUES ('Adam', 'Sandler', '1966-09-09'), 
       ('Jonah', 'Hill', '1983-12-20'), 
	   ('Kate', 'Beckinsale', '1973-07-26');
	   
DECLARE @genders GenderList;
INSERT INTO @genders (typeG)
VALUES ('Comedy'), ('Drama');

EXEC InsertMovie --MOVIE, ACTOR, ActorMovie, GenderMovie, AUDIT
	1001,
	'Click',
	'1h 47m',
	'2006-06-23',
	'Frank Coraci',
	'Sony Pictures',
	'xxxxxxxxx',
	'A workaholic architect finds a universal remote that allows him to fast-forward and rewind to different parts of his life. Complications arise when the remote starts to overrule his choices.',
	@actors, --Actors List
	@genders --Gender List

--10
DECLARE @actors ActorList;
INSERT INTO @actors (nameT, lastNameT, birthT)
VALUES ('Adam', 'Sandler', '1966-09-09'), 
       ('Jennifer', 'Aniston', '1969-02-11'), 
	   ('Nick', 'Swardson', '1976-10-09');
	   
DECLARE @genders GenderList;
INSERT INTO @genders (typeG)
VALUES ('Comedy');

EXEC InsertMovie --MOVIE, ACTOR, ActorMovie, GenderMovie, AUDIT
	1001,
	'Just Go with It',
	'1h 57m',
	'2011-02-11',
	'Dennis Dugan',
	'Sony Pictures',
	'xxxxxxxxxx',
	'On a weekend trip to Hawaii, a plastic surgeon convinces his loyal assistant to pose as his soon-to-be-divorced wife in order to cover up a careless lie he told to his much-younger girlfriend.',
	@actors, --Actors List
	@genders --Gender List

--11.
DECLARE @actors ActorList;
INSERT INTO @actors (nameT, lastNameT, birthT)
VALUES ('Jason', 'Biggs', '1978-05-12'), 
       ('Seann William', 'Scott', '1976-10-03'), 
	   ('Alyson', 'Hannigan', '1974-03-24');
	   
DECLARE @genders GenderList;
INSERT INTO @genders (typeG)
VALUES ('Comedy');

EXEC InsertMovie --MOVIE, ACTOR, ActorMovie, GenderMovie, AUDIT
	1001,
	'American Pie',
	'1h 35m',
	'1999-07-09',
	'Paul Weitz',
	'Universal Studios',
	'xxxxxxxxxxx',
	'Four teenage boys enter a pact to lose their virginity by prom night.',
	@actors, --Actors List
	@genders --Gender List

--12.
DECLARE @actors ActorList;
INSERT INTO @actors (nameT, lastNameT, birthT)
VALUES ('Will', 'Smith', '1968-09-25'), 
       ('Joe', 'Pantoliano', '1951-09-12'), 
	   ('Theresa', 'Randle', '1964-12-27');
	   
DECLARE @genders GenderList;
INSERT INTO @genders (typeG)
VALUES ('Comedy'), ('Action');

EXEC InsertMovie --MOVIE, ACTOR, ActorMovie, GenderMovie, AUDIT
	1001,
	'Bad boys',
	'1h 59m',
	'1995-04-07',
	'Michael Bay',
	'Columbia Pictures',
	'xxxxxxxxxxxx',
	'Two hip detectives protect a witness to a murder while investigating a case of stolen heroin from the evidence storage room from their police precinct.',
	@actors, --Actors List
	@genders --Gender List

--13
DECLARE @actors ActorList;
INSERT INTO @actors (nameT, lastNameT, birthT)
VALUES ('Miles', 'Teller', '1987-02-20'), 
       ('Alexis', 'Knapp', '1989-07-13'), 
	   ('Thomas', 'Mann', '1991-09-27');
	   
DECLARE @genders GenderList;
INSERT INTO @genders (typeG)
VALUES ('Comedy');

EXEC InsertMovie --MOVIE, ACTOR, ActorMovie, GenderMovie, AUDIT
	1001,
	'Project X',
	'1h 28m',
	'2012-03-02',
	'Nima Nourizadeh',
	'Warner Bros. Pictures',
	'xxxxxxxxxxxxx',
	'Three high-school seniors throw a birthday party to make a name for themselves. As the night progresses, things spiral out of control as word of the party spreads.',
	@actors, --Actors List
	@genders --Gender List

--14.
DECLARE @actors ActorList;
INSERT INTO @actors (nameT, lastNameT, birthT)
VALUES ('Simon', 'Pegg', '1970-02-14'), 
       ('Nick', 'Frost', '1972-03-28'), 
	   ('Jason', 'Bateman', '1969-01-14');
	   
DECLARE @genders GenderList;
INSERT INTO @genders (typeG)
VALUES ('Comedy');

EXEC InsertMovie --MOVIE, ACTOR, ActorMovie, GenderMovie, AUDIT
	1001,
	'Paul',
	'1h 50m',
	'2011-02-14',
	'Greg Mottola',
	'Universal Pictures',
	'xxxxxxxxxxxxxx',
	'Two English comic book geeks traveling across the U.S. encounter an alien outside Area 51.',
	@actors, --Actors List
	@genders --Gender List

--15.
DECLARE @actors ActorList;
INSERT INTO @actors (nameT, lastNameT, birthT)
VALUES ('Eddie', 'Murphy', '1961-04-03'), 
       ('Terry', 'Crews', '1968-07-30'), 
	   ('Marlon', 'Wayans', '1972-07-23');
	   
DECLARE @genders GenderList;
INSERT INTO @genders (typeG)
VALUES ('Comedy');

EXEC InsertMovie --MOVIE, ACTOR, ActorMovie, GenderMovie, AUDIT
	1001,
	'Norbit',
	'1h 43m',
	'2007-02-09',
	'Brian Robbins',
	'Universal Pictures',
	'xxxxxxxxxxxxxxx',
	'A mild-mannered guy, who is married to a monstrous woman, meets the woman of his dreams, and schemes to find a way to be with her.',
	@actors, --Actors List
	@genders --Gender List

/*****ANIMATED*****/
--1.
DECLARE @actors ActorList;
INSERT INTO @actors (nameT, lastNameT, birthT)
VALUES ('Eddie', 'Murphy', '1961-04-03'), 
       ('Chris', 'Miller', '1968-01-20'), 
	   ('Mike', 'Myers', '1963-04-25');
	   
DECLARE @genders GenderList;
INSERT INTO @genders (typeG)
VALUES ('Animated'), ('Comedy');

EXEC InsertMovie --MOVIE, ACTOR, ActorMovie, GenderMovie, AUDIT
	1001,
	'Shrek',
	'1h 30m',
	'2001-04-22',
	'Vicky Jenson',
	'Dream Works',
	'y',
	'A mean lord exiles fairytale creatures to the swamp of a grumpy ogre, who must go on a quest and rescue a princess for the lord in order to get his land back.',
	@actors, --Actors List
	@genders --Gender List

--2.
DECLARE @actors ActorList;
INSERT INTO @actors (nameT, lastNameT, birthT)
VALUES ('Kevin', 'Hart', '1979-07-06'), 
       ('Jenny', 'Slate', '1982-03-25'), 
	   ('Lake', 'Bell', '1979-03-24');
	   
DECLARE @genders GenderList;
INSERT INTO @genders (typeG)
VALUES ('Animated'), ('Comedy');

EXEC InsertMovie --MOVIE, ACTOR, ActorMovie, GenderMovie, AUDIT
	1001,
	'The Secret Life of Pets',
	'1h 27m',
	'2016-07-08',
	'Chris Renaud',
	'Dream Works',
	'yy',
	'The quiet life of a terrier named Max is upended when his owner takes in Duke, a stray whom Max instantly dislikes.',
	@actors, --Actors List
	@genders --Gender List

--3.
DECLARE @actors ActorList;
INSERT INTO @actors (nameT, lastNameT, birthT)
VALUES ('Tom', 'Hanks', '1956-07-09'), 
       ('Laurie', 'Metcalf', '1995-06-16'), 
	   ('Donald', 'Reignoux', '1982-05-20');
	   
DECLARE @genders GenderList;
INSERT INTO @genders (typeG)
VALUES ('Animated'), ('Comedy');

EXEC InsertMovie --MOVIE, ACTOR, ActorMovie, GenderMovie, AUDIT
	1001,
	'Toy Story',
	'1h 21m',
	'1995-11-22',
	'John Lasseter',
	'Walt Disney Studios',
	'yyy',
	'A cowboy doll is profoundly threatened and jealous when a new spaceman action figure supplants him as top toy in a boy''s bedroom.',
	@actors, --Actors List
	@genders --Gender List

--4.
DECLARE @actors ActorList;
INSERT INTO @actors (nameT, lastNameT, birthT)
VALUES ('Owen', 'Wilson', '1968-11-18'), 
       ('Paul', 'Newman', '1925-01-26'), 
	   ('Bonnie', 'Hunt', '1961-07-22');
	   
DECLARE @genders GenderList;
INSERT INTO @genders (typeG)
VALUES ('Animated'), ('Comedy');

EXEC InsertMovie --MOVIE, ACTOR, ActorMovie, GenderMovie, AUDIT
	1001,
	'Cars',
	'1h 57m',
	'2006-05-09',
	'John Lasseter',
	'Walt Disney Studios',
	'yyyy',
	'On the way to the biggest race of his life, a hotshot rookie race car gets stranded in a rundown town, and learns that winning isn''t everything in life.',
	@actors, --Actors List
	@genders --Gender List

--5.
DECLARE @actors ActorList;
INSERT INTO @actors (nameT, lastNameT, birthT)
VALUES ('Neil Patrick', 'Harris', '1973-06-15'), 
       ('Jayma', 'Mays', '1979-07-16'), 
	   ('Katy', 'Perry', '1984-10-25');
	   
DECLARE @genders GenderList;
INSERT INTO @genders (typeG)
VALUES ('Animated'), ('Comedy');

EXEC InsertMovie --MOVIE, ACTOR, ActorMovie, GenderMovie, AUDIT
	1001,
	'The Smurfs',
	'1h 43m',
	'2011-08-05',
	'Raja Gosnell',
	'Columbia Pictures',
	'yyyyy',
	'When the evil wizard Gargamel chases the tiny blue Smurfs out of their village, they tumble from their magical world into New York City.',
	@actors, --Actors List
	@genders --Gender List

--6.
DECLARE @actors ActorList;
INSERT INTO @actors (nameT, lastNameT, birthT)
VALUES ('Ben', 'Burtt', '1948-07-12'), 
       ('Andrew', 'Stanton', '1965-12-03'), 
	   ('Elissa', 'Knight', '1975-04-15');
	   
DECLARE @genders GenderList;
INSERT INTO @genders (typeG)
VALUES ('Animated');

EXEC InsertMovie --MOVIE, ACTOR, ActorMovie, GenderMovie, AUDIT
	1001,
	'Wall-e',
	'1h 38m',
	'2008-06-27',
	'Andrew Stanton',
	'Walt Disney Studios',
	'yyyyyy',
	'In the distant future, a small waste-collecting robot inadvertently embarks on a space journey that will ultimately decide the fate of mankind.',
	@actors, --Actors List
	@genders --Gender List

--7.
DECLARE @actors ActorList;
INSERT INTO @actors (nameT, lastNameT, birthT)
VALUES ('Stephen', 'Hillenburg', '1961-08-21'), 
       ('Tom', 'Kenny', '1962-07-13'), 
	   ('Bill', 'Fagerbakke', '1957-10-04');
	   
DECLARE @genders GenderList;
INSERT INTO @genders (typeG)
VALUES ('Animated');

EXEC InsertMovie --MOVIE, ACTOR, ActorMovie, GenderMovie, AUDIT
	1001,
	'The SpongeBob SquarePants Movie',
	'1h 38m',
	'2004-11-19',
	'Stephen Hillenburg',
	'Paramount Pictures',
	'yyyyyyy',
	'SpongeBob SquarePants takes leave from the town of Bikini Bottom in order to track down King Neptune''s stolen crown.',
	@actors, --Actors List
	@genders --Gender List

--8.
DECLARE @actors ActorList;
INSERT INTO @actors (nameT, lastNameT, birthT)
VALUES ('Bill', 'Hader', '1978-06-07'), 
       ('Anna', 'Faris', '1976-11-29'), 
	   ('Neil Patrick', 'Harris', '1973-06-15');
	   
DECLARE @genders GenderList;
INSERT INTO @genders (typeG)
VALUES ('Animated');

EXEC InsertMovie --MOVIE, ACTOR, ActorMovie, GenderMovie, AUDIT
	1001,
	'Cloudy with a Chance of Meatballs',
	'1h 30m',
	'2009-09-18',
	'Phil Lord',
	'Sony Pictures',
	'yyyyyyyy',
	'A local scientist is often regarded as a failure until he invents a machine that can make food fall from the sky. But little does he know that things are about to take a turn for the worst.',
	@actors, --Actors List
	@genders --Gender List

--9.
DECLARE @actors ActorList;
INSERT INTO @actors (nameT, lastNameT, birthT)
VALUES ('Jonah', 'Hill', '1983-12-20'), 
       ('Jay', 'Baruchel', '1982-04-09'), 
	   ('Gerard', 'Butler', '1969-11-13');
	   
DECLARE @genders GenderList;
INSERT INTO @genders (typeG)
VALUES ('Animated'), ('Action');

EXEC InsertMovie --MOVIE, ACTOR, ActorMovie, GenderMovie, AUDIT
	1001,
	'How to Train Your Dragon',
	'1h 38m',
	'2010-03-21',
	'Dean DeBlois',
	'Paramount Pictures',
	'yyyyyyyyy',
	'A hapless young Viking who aspires to hunt dragons becomes the unlikely friend of a young dragon himself, and learns there may be more to the creatures than he assumed.',
	@actors, --Actors List
	@genders --Gender List

--10.
DECLARE @actors ActorList;
INSERT INTO @actors (nameT, lastNameT, birthT)
VALUES ('Jack', 'Black', '1969-08-28'), 
       ('Jackie', 'Chan', '1954-04-07'), 
	   ('James', 'Hong', '1929-02-22');
	   
DECLARE @genders GenderList;
INSERT INTO @genders (typeG)
VALUES ('Animated'), ('Action');

EXEC InsertMovie --MOVIE, ACTOR, ActorMovie, GenderMovie, AUDIT
	1001,
	'Kung Fu Panda',
	'1h 32m',
	'2008-07-06',
	'Jack Black',
	'Paramount Pictures',
	'yyyyyyyyyy',
	'To everyone''s surprise, including his own, Po, an overweight, clumsy panda, is chosen as protector of the Valley of Peace. His suitability will soon be tested as the valley''s arch-enemy is on his way.',
	@actors, --Actors List
	@genders --Gender List

--11.
DECLARE @actors ActorList;
INSERT INTO @actors (nameT, lastNameT, birthT)
VALUES ('Pete', 'Docter', '1968-10-09'), 
       ('Ed', 'Asner', '1929-11-15'), 
	   ('Bob', 'Peterson', '1961-01-18');
	   
DECLARE @genders GenderList;
INSERT INTO @genders (typeG)
VALUES ('Animated'), ('Action');

EXEC InsertMovie --MOVIE, ACTOR, ActorMovie, GenderMovie, AUDIT
	1001,
	'Up',
	'1h 36m',
	'2009-05-29',
	'Pete Docter',
	'Walt Disney Pictures',
	'yyyyyyyyyyy',
	'78-year-old Carl Fredricksen travels to Paradise Falls in his house equipped with balloons, inadvertently taking a young stowaway.',
	@actors, --Actors List
	@genders --Gender List

--12.
DECLARE @actors ActorList;
INSERT INTO @actors (nameT, lastNameT, birthT)
VALUES ('Bill', 'Hader', '1978-06-07'), 
       ('Mindy', 'Kaling', '1979-06-24'), 
	   ('Amy', 'Poehler', '1971-09-16');
	   
DECLARE @genders GenderList;
INSERT INTO @genders (typeG)
VALUES ('Animated'), ('Action');

EXEC InsertMovie --MOVIE, ACTOR, ActorMovie, GenderMovie, AUDIT
	1001,
	'Inside Out',
	'1h 35m',
	'2015-06-19',
	'Pete Docter',
	'Walt Disney Pictures',
	'yyyyyyyyyyyy',
	'After young Riley is uprooted from her Midwest life and moved to San Francisco, her emotions - Joy, Fear, Anger, Disgust and Sadness - conflict on how best to navigate a new city, house, and school.',
	@actors, --Actors List
	@genders --Gender List

--13.
DECLARE @actors ActorList;
INSERT INTO @actors (nameT, lastNameT, birthT)
VALUES ('Dakota', 'Fanning', '1994-02-23'), 
       ('Jennifer', 'Saunders', '1958-07-06'), 
	   ('Teri', 'Hatcher', '1964-12-08');
	   
DECLARE @genders GenderList;
INSERT INTO @genders (typeG)
VALUES ('Animated'), ('Drama');

EXEC InsertMovie --MOVIE, ACTOR, ActorMovie, GenderMovie, AUDIT
	1001,
	'Coraline',
	'1h 40m',
	'2009-02-06',
	'Henry Selick',
	'Focus Features',
	'yyyyyyyyyyyyy',
	'An adventurous 11-year-old girl finds another world that is a strangely idealized version of her frustrating home, but it has sinister secrets.',
	@actors, --Actors List
	@genders --Gender List

--14.
DECLARE @actors ActorList;
INSERT INTO @actors (nameT, lastNameT, birthT)
VALUES ('Joaquin', 'Phoenix', '1974-10-28'), 
       ('Jeremy', 'Suarez', '1990-07-06'), 
	   ('Rick', 'Moranis', '1953-04-18');
	   
DECLARE @genders GenderList;
INSERT INTO @genders (typeG)
VALUES ('Animated'), ('Drama'), ('Comedy');

EXEC InsertMovie --MOVIE, ACTOR, ActorMovie, GenderMovie, AUDIT
	1001,
	'Brother Bear',
	'1h 25m',
	'2003-10-20',
	'Aaron Blaise',
	'Buena Vista Pictures',
	'yyyyyyyyyyyyyy',
	'When a young Inuit hunter needlessly kills a bear, he is magically changed into a bear himself as punishment with a talkative cub being his only guide to changing back.',
	@actors, --Actors List
	@genders --Gender List

--15.
DECLARE @actors ActorList;
INSERT INTO @actors (nameT, lastNameT, birthT)
VALUES ('Pete', 'Docter', '1968-10-09'), 
       ('Bonnie', 'Hunt', '1961-07-22'), 
	   ('Bob', 'Peterson', '1961-01-18');
	   
DECLARE @genders GenderList;
INSERT INTO @genders (typeG)
VALUES ('Animated'), ('Comedy');

EXEC InsertMovie --MOVIE, ACTOR, ActorMovie, GenderMovie, AUDIT
	1001,
	'Monsters, Inc.',
	'1h 32m',
	'2001-11-02',
	'Pete Docter',
	'Walt Disney Pictures',
	'yyyyyyyyyyyyyyy',
	'In order to power the city, monsters have to scare children so that they scream. However, the children are toxic to the monsters, and after a child gets through, two monsters realize things may not be what they think.',
	@actors, --Actors List
	@genders --Gender List

/*****ACTION*****/
--1.
DECLARE @actors ActorList;
INSERT INTO @actors (nameT, lastNameT, birthT)
VALUES ('Ana', 'de Armas', '1988-04-30'), 
       ('Chris', 'Evans', '1981-06-13'), 
	   ('Lizzie', 'Broadway', '1998-02-16');
	   
DECLARE @genders GenderList;
INSERT INTO @genders (typeG)
VALUES ('Comedy'), ('Action');

EXEC InsertMovie --MOVIE, ACTOR, ActorMovie, GenderMovie, AUDIT
	1001,
	'Ghosted',
	'1h 56m',
	'2023-04-21',
	'Dexter Fletcher',
	'Apple Studios Skydance',
	'https://images.thedirect.com/media/photos/ghosted.jpg',
	'Cole, an easygoing guy, falls head over heels for the emigmatic Sadie, who, to his shock, turns out to be a secret agent. Before a second date can arise, the two must embark on an international adventure to save the world.',
	@actors, --Actors List
	@genders --Gender List

--2.
DECLARE @actors ActorList;
INSERT INTO @actors (nameT, lastNameT, birthT)
VALUES ('Zoe', 'Saldaña', '1978-06-19'), 
       ('Michelle', 'Rodriguez', '1978-07-12'), 
	   ('Joel', 'Moore', '1977-09-25');
	   
DECLARE @genders GenderList;
INSERT INTO @genders (typeG)
VALUES ('Action');

EXEC InsertMovie --MOVIE, ACTOR, ActorMovie, GenderMovie, AUDIT
	1001,
	'Avatar',
	'2h 42m',
	'2009-12-17',
	'James Cameron',
	'Twentieth Century Fox',
	'https://m.media-amazon.com/images/I/71Lvqoov42L.jpg',
	'A paraplegic marine sent to the moon Pandora on a unique mission is torn between following his orders and protecting the world he calls home.',
	@actors, --Actors List
	@genders --Gender List

--3.
DECLARE @actors ActorList;
INSERT INTO @actors (nameT, lastNameT, birthT)
VALUES ('Patrick', 'Wilson', '1973-06-03'), 
       ('Haile', 'Berry', '1966-08-14'), 
	   ('John', 'Bradley-West', '1988-09-15');
	   
DECLARE @genders GenderList;
INSERT INTO @genders (typeG)
VALUES ('Action');

EXEC InsertMovie --MOVIE, ACTOR, ActorMovie, GenderMovie, AUDIT
	1001,
	'Moonfall',
	'2h 10m',
	'2022-02-03',
	'Roland Emmerich',
	'Lionsgate Films',
	'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcR-XqVXZ0iIsZhUa4OX9qdJBj11wnKMvuzC7aCeP4I2lmM7iPz5',
	'A mysterious force knocks the Moon out of its orbit around Earth and sends it crashing on a collision course with life as we know it.',
	@actors, --Actors List
	@genders --Gender List

--4.
DECLARE @actors ActorList;
INSERT INTO @actors (nameT, lastNameT, birthT)
VALUES ('Dwayne', 'Johnson', '1972-05-02'), 
       ('Sarah', 'Shahi', '1980-01-10'), 
	   ('Henry', 'Cavill', '1983-05-05');
	   
DECLARE @genders GenderList;
INSERT INTO @genders (typeG)
VALUES ('Action'), ('Adventure');

EXEC InsertMovie --MOVIE, ACTOR, ActorMovie, GenderMovie, AUDIT
	1001,
	'Black Adam',
	'2h 05m',
	'2022-10-21',
	'Jaume Collet-Serra',
	'Warner Bros. Pictures',
	'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRshWaUPfERijlnKVcPYBM4N37_7s4Fgo-o3g055p_H7kgP_JzS',
	'Freed from his grave nearly 5,000 years after being imprisoned and receiving his powers from the old gods, Black Adam is now ready to unleash his unique brand of justice on the world.',
	@actors, --Actors List
	@genders --Gender List

--5.
DECLARE @actors ActorList;
INSERT INTO @actors (nameT, lastNameT, birthT)
VALUES ('Paul', 'Rudd', '1969-04-06'), 
       ('Evangeline', 'Lilly', '1979-08-03'), 
	   ('Michael ', 'Douglas', '1944-09-27');
	   
DECLARE @genders GenderList;
INSERT INTO @genders (typeG)
VALUES ('Action'), ('Comedy'), ('Science fiction');

EXEC InsertMovie --MOVIE, ACTOR, ActorMovie, GenderMovie, AUDIT
	1001,
	'Ant-Man',
	'1h 58m',
	'2015-06-29',
	'Peyton Reed',
	'Walt Disney Studios',
	'https://i3.wp.com/raisingwhasians.com/wp-content/uploads/2017/07/Ant-Man-Avengers-movie-poster.jpg',
	'Armed with a super suit with the amazing ability to reduce the size but increase the strength of its wearer, smart-collar burglar Scott Lang must embrace his inner hero and help his mentor, Dr. Hank Pym, plan and pull off a heist that will save the world.',
	@actors, --Actors List
	@genders --Gender List

--6. 
DECLARE @actors ActorList;
INSERT INTO @actors (nameT, lastNameT, birthT)
VALUES ('Chris', 'Evans', '1981-06-13'), 
       ('Scarlett', 'Johansson', '1984-11-22'), 
	   ('Jeremy', 'Renner', '1971-01-07');
	   
DECLARE @genders GenderList;
INSERT INTO @genders (typeG)
VALUES ('Action'), ('Science fiction');

EXEC InsertMovie --MOVIE, ACTOR, ActorMovie, GenderMovie, AUDIT
	1001,
	'Avengers',
	'2h 23m',
	'2012-04-27',
	'Joss Whedon',
	'Walt Disney Studios',
	'https://image.tmdb.org/t/p/original/qMxAmzGQO722q0UlssCOPhrXmvX.jpg',
	'Earth''s mightiest heroes must come together and learn to fight as a team if they are going to stop the mischievous Loki and his alien army from enslaving humanity.',
	@actors, --Actors List
	@genders --Gender List

--7.
DECLARE @actors ActorList;
INSERT INTO @actors (nameT, lastNameT, birthT)
VALUES ('Jared', 'Leto', '1971-12-26'), 
       ('Matt', 'Smith', '1982-10-28'), 
	   ('Adria', 'Arjona', '1992-04-25');
	   
DECLARE @genders GenderList;
INSERT INTO @genders (typeG)
VALUES ('Action'), ('Adventure'), ('Horror');

EXEC InsertMovie --MOVIE, ACTOR, ActorMovie, GenderMovie, AUDIT
	1001,
	'Morbius',
	'1h 44m',
	'2022-04-01',
	'Daniel Espinosa',
	'Sony Pictures',
	'https://image.tmdb.org/t/p/original/6JjfSchsU6daXk2AKX8EEBjO3Fm.jpg',
	'Biochemist Michael Morbius tries to cure himself of a rare blood disease, but he inadvertently infects himself with a form of vampirism instead.',
	@actors, --Actors List
	@genders --Gender List

--8.
DECLARE @actors ActorList;
INSERT INTO @actors (nameT, lastNameT, birthT)
VALUES ('Leeza', 'Gibbons', '1957-03-26'), 
       ('Peter', 'Weller', '1947-06-24'), 
	   ('Nancy', 'Allen', '1950-06-24');
	   
DECLARE @genders GenderList;
INSERT INTO @genders (typeG)
VALUES ('Action'), ('Science fiction');

EXEC InsertMovie --MOVIE, ACTOR, ActorMovie, GenderMovie, AUDIT
	1001,
	'RoboCop',
	'1h 42m',
	'1987-07-17',
	'Daniel Espinosa',
	'Orion Pictures',
	'https://cdn.europosters.eu/image/750/posters/robocop-1987-one-sheet-i16501.jpg',
	'In a dystopic and crime-ridden Detroit, a terminally wounded cop returns to the force as a powerful cyborg haunted by submerged memories.',
	@actors, --Actors List
	@genders --Gender List

--9.
DECLARE @actors ActorList;
INSERT INTO @actors (nameT, lastNameT, birthT)
VALUES ('Keanu', 'Reeves', '1964-09-02'), 
       ('Carrie-Anne', 'Moss', '1967-08-21'), 
	   ('Laurence', 'Fishburne', '1961-07-30');
	   
DECLARE @genders GenderList;
INSERT INTO @genders (typeG)
VALUES ('Action'), ('Science fiction');

EXEC InsertMovie --MOVIE, ACTOR, ActorMovie, GenderMovie, AUDIT
	1001,
	'Matrix',
	'2h 16m',
	'1999-03-31',
	'Lana Wachowski',
	'Warner Bros',
	'https://m.media-amazon.com/images/I/51unGrb-AAL._AC_.jpg',
	'When a beautiful stranger leads computer hacker Neo to a forbidding underworld, he discovers the shocking truth--the life he knows is the elaborate deception of an evil cyber-intelligence.',
	@actors, --Actors List
	@genders --Gender List

--10.
DECLARE @actors ActorList;
INSERT INTO @actors (nameT, lastNameT, birthT)
VALUES ('Vin', 'Diesel', '1968-07-18'), 
       ('Paul', 'Walker', '1973-09-12'), 
	   ('Michelle', 'Rodriguez', '1978-07-12');
	   
DECLARE @genders GenderList;
INSERT INTO @genders (typeG)
VALUES ('Action');

EXEC InsertMovie --MOVIE, ACTOR, ActorMovie, GenderMovie, AUDIT
	1001,
	'The Fast and the Furious',
	'1h 46m',
	'2001-06-22',
	'Rob Cohen',
	'Universal Pictures',
	'https://m.media-amazon.com/images/I/51vx0VklkZL.jpg',
	'Los Angeles police officer Brian O''Conner must decide where his loyalty really lies when he becomes enamored with the street racing world he has been sent undercover to destroy.',
	@actors, --Actors List
	@genders --Gender List

--11.
DECLARE @actors ActorList;
INSERT INTO @actors (nameT, lastNameT, birthT)
VALUES ('Hugh', 'Jackman', '1968-10-12'), 
       ('Dafne', 'Keen', '2005-01-04'), 
	   ('Boyd', 'Holbrook', '1981-09-01');
	   
DECLARE @genders GenderList;
INSERT INTO @genders (typeG)
VALUES ('Action'), ('Drama'), ('Science fiction');

EXEC InsertMovie --MOVIE, ACTOR, ActorMovie, GenderMovie, AUDIT
	1001,
	'Logan',
	'2h 17m',
	'2017-03-03',
	'James Mangold',
	'20th Century Studios',
	'https://m.media-amazon.com/images/I/71HCwLMPJVL.jpg',
	'In a future where mutants are nearly extinct, an elderly and weary Logan leads a quiet life. But when Laura, a mutant child pursued by scientists, comes to him for help, he must get her to safety.',
	@actors, --Actors List
	@genders --Gender List

--12.
DECLARE @actors ActorList;
INSERT INTO @actors (nameT, lastNameT, birthT)
VALUES ('Russell', 'Crowe', '1964-04-07'), 
       ('Joaquin', 'Phoenix', '1974-10-28'), 
	   ('Connie', 'Nielsen', '1965-07-03');
	   
DECLARE @genders GenderList;
INSERT INTO @genders (typeG)
VALUES ('Action'), ('Drama'), ('Adventure');

EXEC InsertMovie --MOVIE, ACTOR, ActorMovie, GenderMovie, AUDIT
	1001,
	'Gladiator',
	'2h 35m',
	'2000-05-05',
	'Ridley Scott',
	'Universal Pictures',
	'https://i.ebayimg.com/images/g/EoAAAOSw5htgqj0s/s-l1600.jpg',
	'A former Roman General sets out to exact vengeance against the corrupt emperor who murdered his family and sent him into slavery.',
	@actors, --Actors List
	@genders --Gender List

--13.
DECLARE @actors ActorList;
INSERT INTO @actors (nameT, lastNameT, birthT)
VALUES ('Al', 'Pacino', '1940-04-25'), 
       ('Marlon', 'Brando', '1924-04-03'), 
	   ('James', 'Cann', '1940-03-26');
	   
DECLARE @genders GenderList;
INSERT INTO @genders (typeG)
VALUES ('Action'), ('Drama');

EXEC InsertMovie --MOVIE, ACTOR, ActorMovie, GenderMovie, AUDIT
	1001,
	'The Godfather',
	'2h 55m',
	'1972-03-24',
	'Francis Ford Coppola',
	'Paramount Pictures',
	'https://m.media-amazon.com/images/M/MV5BM2MyNjYxNmUtYTAwNi00MTYxLWJmNWYtYzZlODY3ZTk3OTFlXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg',
	'Don Vito Corleone, head of a mafia family, decides to hand over his empire to his youngest son Michael. However, his decision unintentionally puts the lives of his loved ones in grave danger.',
	@actors, --Actors List
	@genders --Gender List

--14.
DECLARE @actors ActorList;
INSERT INTO @actors (nameT, lastNameT, birthT)
VALUES ('Tom', 'Berenger', '1949-05-31'), 
       ('Billy', 'Zane', '1966-02-24'), 
	   ('Aden', 'Young', '1971-11-30');
	   
DECLARE @genders GenderList;
INSERT INTO @genders (typeG)
VALUES ('Action');

EXEC InsertMovie --MOVIE, ACTOR, ActorMovie, GenderMovie, AUDIT
	1001,
	'Sniper',
	'1h 38m',
	'1993-01-29',
	'Luis Llosa',
	'TriStar Pictures',
	'https://m.media-amazon.com/images/M/MV5BZWUzOGNjMzItZmM5MC00NTQzLTk3YjQtZWMwZmRhOGJhZDczXkEyXkFqcGdeQXVyNzc5MjA3OA@@._V1_.jpg',
	'A veteran US Marine sniper is partnered with a rookie sniper as his spotter to take out a politician and a rebel leader in the jungles of Panama.',
	@actors, --Actors List
	@genders --Gender List

--15.
DECLARE @actors ActorList;
INSERT INTO @actors (nameT, lastNameT, birthT)
VALUES ('Will', 'Smith', '1968-09-25'), 
       ('Tommy', 'Lee Jones', '1946-09-15'), 
	   ('Tony', 'Shalhoub', '1953-10-09');
	   
DECLARE @genders GenderList;
INSERT INTO @genders (typeG)
VALUES ('Action'), ('Adventure'), ('Comedy');

EXEC InsertMovie --MOVIE, ACTOR, ActorMovie, GenderMovie, AUDIT
	1001,
	'Men in Black',
	'1h 38m',
	'1997-07-02',
	'Barry Sonnenfeld',
	'Columbia Pictures',
	'https://m.media-amazon.com/images/I/61ILcasnX7L.jpg',
	'A police officer joins a secret organization that polices and monitors extraterrestrial interactions on Earth.',
	@actors, --Actors List
	@genders --Gender List

/*****DRAMA*****/
--1.
DECLARE @actors ActorList;
INSERT INTO @actors (nameT, lastNameT, birthT)
VALUES ('Emile', 'Hirsch', '1985-03-13'), 
       ('Kristen', 'Stewart', '1990-04-09'), 
	   ('Vince', 'Vaughn', '1970-03-28');
	   
DECLARE @genders GenderList;
INSERT INTO @genders (typeG)
VALUES ('Drama'), ('Adventure');

EXEC InsertMovie --MOVIE, ACTOR, ActorMovie, GenderMovie, AUDIT
	1001,
	'Into the Wild',
	'2h 28m',
	'2007-09-21',
	'Sean Penn',
	'Paramount Vantage',
	'https://m.media-amazon.com/images/I/51jIDks7NAL._AC_UF894,1000_QL80_.jpg',
	'After graduating from Emory University, top student and athlete Christopher McCandless abandons his possessions, gives his entire $24,000 savings account to charity and hitchhikes to Alaska to live in the wilderness. Along the way, Christopher encounters a series of characters that shape his life.',
	@actors, --Actors List
	@genders --Gender List