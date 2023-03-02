INSERT INTO singer(singer_name)
VALUES('5sta Family'),
('DJ Feel'),
('Billie Eilish'),
('Imanbek'),
('Slot'),
('ST'),
('Юлия Савичева'),
('ATB');

INSERT INTO genre(genre_name)
VALUES('Pop'),
('Trance'),
('Rock'),
('Rap'),
('RnB');

INSERT INTO singergenre
VALUES(1, 1),
(1, 5),
(2, 1),
(2, 2),
(3, 1),
(4, 2),
(5, 3),
(6, 4),
(7, 1),
(8, 2);

INSERT INTO album(album_name, album_year)
VALUES('The concert', '2009'),
('Привет', '2006'),
('Снова вместе', '2018'),
('Moving melodies', '1999'),
('Мёртвые звёзды', '2006'),
('Поэт', '2018'),
('Where Do We Go', '2019'),
('Roses', '2020');

INSERT INTO singeralbum
VALUES(1, 3),
(2, 1),
(3, 7),
(4, 8),
(5, 5),
(6, 6),
(7, 2),
(8, 4);

INSERT INTO track(track_name, album_id, long) 
VALUES('Карусель', 3, 180),
('Фляга свистит', 3, 175),
('Тюльпаны', 3, 170),
('Three friends', 1, 250),
('Faded', 1, 280),
('Если в сердце живёт любовь', 2, 350),
('Surburn', 4, 400),
('9 PM', 4, 350),
('Две войны', 5, 320),
('Каренина', 6, 300),
('Сумасшедший русский', 6, 310),
('No time to die', 7, 320),
('Bad guy', 7, 325),
('Roses', 8, 330),
('Roses (remix)', 8, 340),
('My future', 7, 350);

INSERT INTO compilation(compilation_name, compilation_year) 
VALUES('Trance', '2019'),
('Русский', '2020'),
('Рэп', '2018'),
('Позитив', '2022'),
('Без слов', '2014'),
('Со словами', '2014'),
('Женский вокал', '2022'),
('Иностранное', '2022');

INSERT INTO compilationtrack 
VALUES(1, 4),
(1, 14),
(1, 15),
(2, 1),
(2, 2),
(2, 3),
(2, 6),
(2, 9),
(2, 10),
(2, 11),
(3, 10),
(3, 11),
(4, 12),
(5, 7),
(5, 4),
(6, 1),
(6, 9),
(7, 12),
(7, 9),
(7, 6),
(8, 12),
(8, 7),
(8, 8);