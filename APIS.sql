USE [IF5100_B84545]
GO

--DROP TABLE MOVIE
CREATE TABLE MOVIE
(
 idMovie INT NOT NULL PRIMARY KEY, 
 name VARCHAR(50) NOT NULL,
 duration VARCHAR(30) NOT NULL,
 year DATE NOT NULL,
 director VARCHAR(50) NOT NULL,
 distributor VARCHAR(50) NULL,
 img VARCHAR(2000) NOT NULL,
 description VARCHAR(2000) NULL,
 trailer VARCHAR(5000) NULL,
 punctuation FLOAT
)
------------------------------------------------------------
--DROP TABLE Icons
CREATE TABLE Icons
(
	idIcon INT IDENTITY PRIMARY KEY,
	nameIcon VARCHAR(50) NOT NULL,
	url VARCHAR(2000) NOT NULL
)

insert into Icons (nameIcon, url) values ('Bob Esponja', 'https://pbs.twimg.com/media/DZn9XAZXUAAd_vG.png');
insert into Icons (nameIcon, url) values ('Patricio', 'https://www.nicepng.com/png/detail/302-3026047_matching-icons-de-bob-esponja-y-patricio-.png');
insert into Icons (nameIcon, url) values ('Calamardo', 'https://i.pinimg.com/564x/76/da/57/76da57fc95ff4cad3b46e0ebfc90eac8.jpg');
insert into Icons (nameIcon, url) values ('Don Cangrejo', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLNY4RZgj055W1OEqErFO-AY4f0kjoP4hPy3zcE0CsiqZ4iagi1IaZWjJIR7fUkg6bDAk&usqp=CAU');
insert into Icons (nameIcon, url) values ('Planton', 'https://64.media.tumblr.com/ab726cfca692bce1cf08940a818d4a84/731712ec18e34a8d-6d/s400x600/c65cc97ec2654b975a949ed41f5cd6095f24eaab.png');
insert into Icons (nameIcon, url) values ('Arenita', 'https://cdn.shopify.com/s/files/1/0587/4086/7250/collections/sandyc.png?v=1637085320');
insert into Icons (nameIcon, url) values ('Gary', 'https://i.pinimg.com/236x/72/e9/76/72e97687d8e5f4a48f047a04bb296df2--gary-spongebob-spongebob-party.jpg');
insert into Icons (nameIcon, url) values ('Perlita', 'https://img.wattpad.com/982301dfce043ac98b92bba290fb8dfb16174be1/68747470733a2f2f73332e616d617a6f6e6177732e636f6d2f776174747061642d6d656469612d736572766963652f53746f7279496d6167652f59594e39654176723144784f75773d3d2d3233363439393531322e313433663262316332643766313831302e6a7067?s=fit&w=720&h=720');
insert into Icons (nameIcon, url) values ('Karen', 'https://i.pinimg.com/736x/66/89/33/668933835690203ceda790cb534008a0.jpg');
insert into Icons (nameIcon, url) values ('Señora Puff', 'https://beamartinez.files.wordpress.com/2009/11/17.gif');
insert into Icons (nameIcon, url) values ('Homero', 'https://i.pinimg.com/originals/f0/e5/12/f0e512b6670a56fde2bb17b58255cbb4.jpg');
insert into Icons (nameIcon, url) values ('Bart', 'https://i.pinimg.com/originals/44/29/65/4429657020ff72221bdea62ee2ac8e84.jpg');
insert into Icons (nameIcon, url) values ('Lisa', 'https://img.wattpad.com/3280aead2623b21322b707594c61336601efd795/68747470733a2f2f73332e616d617a6f6e6177732e636f6d2f776174747061642d6d656469612d736572766963652f53746f7279496d6167652f704f504436553953337454725f513d3d2d3636343933373731302e313536663130306138343365393438363539323831313631363432332e6a7067?s=fit&w=720&h=720');
insert into Icons (nameIcon, url) values ('Marge', 'https://i.pinimg.com/564x/49/a4/80/49a480aadebb34fc97c7e31d51d985ef--los-simpsons-homer-simpson.jpg');
insert into Icons (nameIcon, url) values ('Maggie', 'https://i.pinimg.com/564x/79/89/1a/79891a95bf29548a8120eab7c23e785e.jpg');
insert into Icons (nameIcon, url) values ('Ned Flanders', 'https://i.ytimg.com/vi/f6vVD7C-IWU/0.jpg');
insert into Icons (nameIcon, url) values ('Bola de Nieve', 'https://i.pinimg.com/564x/38/ba/b0/38bab0d71239a784f7ea1057482af8eb--los-simpsons-evergreen.jpg');
insert into Icons (nameIcon, url) values ('Ayudante de Santa', 'https://i.pinimg.com/originals/c7/73/fe/c773fe0e396c8f890d657de349ce0cf1.jpg');
insert into Icons (nameIcon, url) values ('Raffa', 'https://i.pinimg.com/474x/14/07/21/140721f39d0a62b4184d6036d997b343.jpg');
insert into Icons (nameIcon, url) values ('Milhouse', 'https://www.clarin.com/img/2020/07/12/4jeebcaZy_360x240__1.jpg');
insert into Icons (nameIcon, url) values ('Shrek', 'https://media1.orlandoweekly.com/orlando/imager/u/original/32670429/screen_shot_2022-10-12_at_2.40.31_pm.png');
insert into Icons (nameIcon, url) values ('Fiona', 'https://64.media.tumblr.com/755c94607b4c1e2026f96eb07b56820b/b1a361e498124a5d-62/s640x960/01fec568e74f15d9e7c81859a7821b5f5464849c.pnj');
insert into Icons (nameIcon, url) values ('Burro', 'https://i.pinimg.com/564x/14/3b/b5/143bb54804da15cc3a12b9a5be4d48b9.jpg');
insert into Icons (nameIcon, url) values ('Gato con Botas', 'https://i.pinimg.com/564x/a9/8c/8a/a98c8aa6f6a18083c82aa73d9f03fbf5--movies-for-kids-disney-movies.jpg');
insert into Icons (nameIcon, url) values ('Jengibre', 'https://i.pinimg.com/originals/6b/ba/2b/6bba2b493d254768eef8134fc858214a.jpg');
insert into Icons (nameIcon, url) values ('Pinocho', 'https://i.pinimg.com/736x/05/73/63/0573630c4c6d1c1cde55909fe02f0e59.jpg');
insert into Icons (nameIcon, url) values ('Encantador', 'https://pbs.twimg.com/media/EoXA92nXcAAXvmk.jpg');
insert into Icons (nameIcon, url) values ('Hada Madrina', 'https://pbs.twimg.com/media/EIsb4k6UcAAwvYt.jpg');
insert into Icons (nameIcon, url) values ('Dragona', 'https://i.pinimg.com/originals/31/74/c9/3174c99019cb80b19648418bd5a23c93.jpg');
insert into Icons (nameIcon, url) values ('Lobo', 'https://pbs.twimg.com/media/Fl_Uq5qXwAI91f7.jpg');
insert into Icons (nameIcon, url) values ('Chimuelo', 'https://64.media.tumblr.com/9378b60d3010a2340a5009ac804a2366/tumblr_mnpg3y7mYw1rjna76o1_500.gif');
insert into Icons (nameIcon, url) values ('Hipo', 'https://i.pinimg.com/564x/0d/05/61/0d056199f484156c3c4511dc43aac782.jpg');
insert into Icons (nameIcon, url) values ('Astrid', 'https://i.pinimg.com/736x/61/64/aa/6164aa17304f22cd006f7e792ad51b2b.jpg');
insert into Icons (nameIcon, url) values ('Estoico', 'https://www.cinemascomics.com/wp-content/uploads/2010/03/estoico.jpg');
insert into Icons (nameIcon, url) values ('Patán', 'https://i.pinimg.com/236x/99/9b/75/999b75a1a170029ff4cd4b06a8e119c5.jpg');
insert into Icons (nameIcon, url) values ('Brutilda', 'https://pbs.twimg.com/media/FoVCUE0XoAI-J68.jpg');
insert into Icons (nameIcon, url) values ('Bocón', 'https://dragonesdeberk.yolasite.com/resources/patade%20palo.png.opt374x448o0%2C0s374x448.png');
insert into Icons (nameIcon, url) values ('Patapez', 'https://www.saludofamoso.cl/wp-content/uploads/2022/04/WhatsApp-Image-2022-04-19-at-1.42.56-PM-10.jpeg');
insert into Icons (nameIcon, url) values ('Ant-Man', 'https://i.pinimg.com/originals/f3/61/bd/f361bd045b136f200ab8675b230bfd77.jpg');
insert into Icons (nameIcon, url) values ('The Wasp', 'https://i.pinimg.com/736x/17/27/ef/1727efe52c01a0eba356afd5746cdf75.jpg');
insert into Icons (nameIcon, url) values ('Iron-Man', 'https://everydaypower.com/wp-content/uploads/2020/02/Iron-Man-Quotes-From-The-Marvel-Icon.jpg');
insert into Icons (nameIcon, url) values ('Thor', 'https://pbs.twimg.com/media/DVAK6bNV4AA6eLq.jpg');
insert into Icons (nameIcon, url) values ('Capitan America', 'https://i.pinimg.com/originals/25/f7/7d/25f77de4478ca6d28eae8abd337a39cb.jpg');
insert into Icons (nameIcon, url) values ('Hulk', 'https://i.pinimg.com/736x/c5/58/c9/c558c94ff7cb1178883cdd6c7f57676e.jpg');
insert into Icons (nameIcon, url) values ('Viuda Negra', 'https://i.pinimg.com/736x/0a/90/62/0a90624f79258d47851cbcec1667224b.jpg');
insert into Icons (nameIcon, url) values ('Spider-Man', 'https://www.nicepng.com/png/detail/220-2209448_marvels-spider-man-spiderman-icon.png');
insert into Icons (nameIcon, url) values ('Doctor Strange', 'https://i0.wp.com/imgs.hipertextual.com/wp-content/uploads/2020/09/hipertextual-libro-que-leyendo-stan-lee-su-cameo-doctor-strange-no-es-casual-2020819727.jpg?fit=1200%2C800&quality=50&strip=all&ssl=1');
insert into Icons (nameIcon, url) values ('Bruja Escarlata', 'https://media.vandalsports.com/i/640x360/7-2022/202271815330_1.jpg');
insert into Icons (nameIcon, url) values ('Hawkeye', 'https://cdn-e360.s3-sa-east-1.amazonaws.com/hawkeye-este-es-el-curioso-error-de-continuidad-que-seguro-no-viste-large-8aOJ6lwi93.jpg');
insert into Icons (nameIcon, url) values ('Capitana Marvel', 'https://elspoilergeek.com/wp-content/uploads/2021/05/Lo-que-nos-revela-el-nuevo-titulo-de-Captain-Marvel-2.jpg.jpg');
insert into Icons (nameIcon, url) values ('Default', 'https://png.pngtree.com/element_origin_min_pic/00/00/06/12575cb97a22f0f.jpg');

