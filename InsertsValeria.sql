
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