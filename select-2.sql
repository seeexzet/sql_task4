SELECT track_name, long FROM track 
WHERE long = (SELECT MAX(long) FROM track);

--количество исполнителей в каждом жанре

SELECT g.genre_name, COUNT(s.singer_name) FROM genre AS g
JOIN singergenre AS sg ON g.genre_id = sg.genre_id
JOIN singer AS s ON sg.singer_id = s.singer_id
GROUP BY g.genre_name
ORDER BY count(s.singer_id) DESC;

--Количество треков, вошедших в альбомы 2019–2020 годов.

SELECT a.album_year, COUNT(t.track_name) FROM album AS a
JOIN track AS t ON a.album_id = t.album_id
GROUP BY a.album_year
HAVING album_year=2019 OR album_year=2020;

-- Средняя продолжительность треков по каждому альбому.

SELECT a.album_name, AVG(t.long) FROM album AS a
JOIN track AS t ON a.album_id = t.album_id
GROUP BY a.album_name;

-- Все исполнители, которые не выпустили альбомы в 2020 году.

SELECT s.singer_name FROM singer AS s 
WHERE s.singer_name NOT IN (
    SELECT s.singer_name FROM singer AS s 
    JOIN singeralbum AS sa ON s.singer_id = sa.singer_id
    JOIN album AS a ON sa.album_id = a.album_id
    WHERE a.album_year = 2020
);

-- Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).

SELECT c.compilation_name FROM compilation AS c
JOIN compilationtrack AS ct ON ct.compilation_id = c.compilation_id
JOIN track AS t ON ct.track_id = t.track_id
JOIN album AS a ON t.album_id = a.album_id
JOIN singeralbum AS sa ON a.album_id = sa.album_id
JOIN singer AS s ON s.singer_id = sa.singer_id
WHERE s.singer_name = 'DJ Feel';

-- Названия альбомов, в которых присутствуют исполнители более чем одного жанра.

SELECT a.album_name FROM album AS a
JOIN singeralbum AS sa ON sa.album_id = a.album_id
JOIN singer AS s ON s.singer_id = sa.singer_id
JOIN singergenre AS sg ON sg.singer_id = s.singer_id
JOIN genre AS g ON g.genre_id = sg.genre_id
GROUP BY a.album_name
HAVING COUNT(g.genre_name) > 1
ORDER BY a.album_name

-- Наименования треков, которые не входят в сборники.

SELECT t.track_name FROM track AS t
LEFT JOIN compilationtrack AS ct ON t.track_id = ct.track_id
WHERE ct.track_id IS NULL

-- Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько.

SELECT s.singer_name FROM singer AS s
JOIN singeralbum AS sa ON s.singer_id = sa.singer_id
JOIN album AS a ON sa.album_id = a.album_id
JOIN track AS t ON t.album_id = a.album_id
GROUP BY s.singer_name, t.long
HAVING t.long = (SELECT MIN(long) FROM track)

-- Названия альбомов, содержащих наименьшее количество треков.

SELECT a.album_name FROM album AS a
JOIN track AS t ON t.album_id = a.album_id
WHERE t.album_id IN (
    SELECT album_id FROM track
    GROUP BY album_id
    HAVING COUNT(track_id) = (
        SELECT COUNT(track_id) FROM track
        GROUP BY album_id
        ORDER BY COUNT LIMIT 1
    )
)
ORDER BY a.album_name