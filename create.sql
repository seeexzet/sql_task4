CREATE TABLE IF NOT EXISTS Genre (
	genre_id SERIAL PRIMARY KEY,
	genre_name VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS Singer (
	singer_id SERIAL PRIMARY KEY,
	singer_name VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS SingerGenre (
	singer_id INTEGER REFERENCES Singer(singer_id),
	genre_id INTEGER REFERENCES Genre(genre_id),
	CONSTRAINT pk_sg PRIMARY KEY (singer_id, genre_id)
);

CREATE TABLE IF NOT EXISTS Album (
	album_id SERIAL PRIMARY KEY,
	album_name VARCHAR(60) NOT NULL,
	album_year integer
);

CREATE TABLE IF NOT EXISTS SingerAlbum (
	singer_id INTEGER REFERENCES Singer(singer_id),
	album_id INTEGER REFERENCES Album(album_id),
	CONSTRAINT pk_sa PRIMARY KEY (singer_id, album_id)
);

CREATE TABLE IF NOT EXISTS Track (
	track_id SERIAL PRIMARY KEY,
	track_name VARCHAR(60) NOT NULL,
	album_id INTEGER REFERENCES Album(album_id),
	long INTEGER
);

CREATE TABLE IF NOT EXISTS Compilation (
	compilation_id SERIAL PRIMARY KEY,
	compilation_name VARCHAR(60) NOT NULL,
	compilation_year INTEGER
);

CREATE TABLE IF NOT EXISTS CompilationTrack (
	compilation_id INTEGER REFERENCES Compilation(compilation_id),
	track_id INTEGER REFERENCES Track(track_id),
	CONSTRAINT pk_ct PRIMARY KEY (compilation_id, track_id)
);
