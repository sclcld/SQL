USE Chinook;



-- Recuperate tutte le tracce che abbiano come genere “Pop” o “Rock”.  
SELECT 
	Track.Name,
    Genre.Name
    FROM Track
JOIN Genre ON Track.GenreID = Genre.GenreId 
WHERE Genre.Name = "Pop" OR Genre.Name = "Rock";

-- 2 Elencate tutti gli artisti e/o gli album che inizino con la lettera “A”. 
SELECT 
	Artist.Name,
    Album.Title    
    FROM Track
JOIN Album ON Track.AlbumID = Album.AlbumID
JOIN Artist ON Album.ArtistId = Artist.ArtistID;

-- 3 Elencate tutte le tracce che hanno come genere “Jazz” o che durano meno di 3 minuti.
SELECT Track.Name FROM Track
JOIN Genre ON Track.GenreId = Genre.GenreId
WHERE Track.Milliseconds < 180000 AND Genre.Name = "Jazz" ;

-- 4 Recuperate tutte le tracce più lunghe della durata media.
SELECT * FROM Track
WHERE Milliseconds > (SELECT AVG(Milliseconds) FROM Track);

-- 5 Individuate i generi che hanno tracce con una durata media maggiore di 4 minuti. 

SELECT
    Genre.Name,
    AVG(Track.Milliseconds) AS AvgDuration
FROM
    Track
JOIN
    Genre ON Track.GenreId = Genre.GenreId
GROUP BY
    Genre.Name
HAVING
    AVG(Track.Milliseconds) > 240000;
    
-- 6 Individuate gli artisti che hanno rilasciato più di un album. 
SELECT 
	Artist.Name,
    COUNT(Track.AlbumID) AS AlbumCount
FROM Track
JOIN Album ON Track.AlbumId = Album.AlbumId
JOIN Artist ON Album.ArtistId = Artist.ArtistId
GROUP BY Artist.Name
HAVING COUNT(Track.AlbumID) > 1;

-- 7 Trovate la traccia più lunga in ogni album. 
SELECT
	Album.Title AS Album,
    Track.Name AS Song,
    Track.Milliseconds AS DuratinInMs
FROM Album
JOIN
	Track ON Album.AlbumId = Track.AlbumId
JOIN (
		SELECT AlbumId, Max(Milliseconds) AS MaxLen
        FROM Track
        GROUP BY AlbumId)
       AS MaxTr 
       ON Track.AlbumId = MaxTr.AlbumId AND Track.Milliseconds = MaxTr.MaxLen;

-- 8 Individuate la durata media delle tracce per ogni album.
SELECT 
	Album.Title,
    AVG(Milliseconds) AS AvgLen
FROM Track
JOIN Album ON Track.AlbumId = Album.AlbumId
GROUP BY Album.Title;

-- 9 Individuate gli album che hanno più di 20 tracce e mostrate il nome dell’album e il numero di tracce in esso contenute.
SELECT 
	Album.Title,
	COUNT(Track.TrackId) AS TracksCount
FROM Track
JOIN Album ON Track.AlbumId = Album.AlbumId
GROUP BY Album.Title
HAVING TracksCount > 20;    