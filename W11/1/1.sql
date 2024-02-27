SHOW DATABASES;

USE Chinook;

SHOW TABLES;

-- Cominciate facendo un’analisi esplorativa del database
SELECT COUNT(*) FROM Album;
SELECT * FROM Album LIMIT 10; 
DESCRIBE Album;
DESCRIBE Artist;
DESCRIBE Track;

-- Recuperate il nome di tutte le tracce e del genere associato. 
SELECT * FROM Genre;
SELECT 
	Track.Name,
    Genre.Name
FROM Track
JOIN Genre ON Track.GenreId = Genre.GenreId;

-- Recuperate il nome di tutti gli artisti che hanno almeno un album nel database. Esistono artisti senza album nel database?
SELECT DISTINCT Artist.Name FROM Artist
JOIN Album ON Artist.ArtistId = Album.ArtistId;

-- Recuperate il nome di tutte le tracce, del genere associato e della tipologia di media.
SELECT 
	Track.Name,
    Genre.Name,
    MediaType.Name
    FROM Track
JOIN Genre ON Track.TrackID = Genre.GenreID
JOIN MediaType ON Track.MediaTypeId = MediaType.MediaTypeId;

-- Elencate i nomi di tutti gli artisti e dei loro album.
SELECT 
	Artist.Name,
    Album.Title
    FROM Track
JOIN Album ON Track.AlbumId = Album.AlbumID
JOIN Artist ON Album.ArtistId = Artist.ArtistId;
