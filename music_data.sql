--Artist name who write most rock music 
SELECT * FROM track;
SELECT artist.artist_id,artist.name,COUNT(artist.artist_id)AS number_of_songs
FROM artist
JOIN album ON album.album_id=track.album_id
JOIN  artist ON artist.artist_id=album.artist_id
JOIN genre ON genre.genre_id=track.track_id
WHERE genre.name LIKE 'Rock'
GROUP BY artist.artist_id
ORDER BY number_of_songs
limit 10;
