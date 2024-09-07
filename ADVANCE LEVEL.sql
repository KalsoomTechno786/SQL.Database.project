--find how much per customer spent  on artist and customer name ,artist name total spent
WITH BEST_SELLING AS (
SELECT artist.artist_id AS artist_id ,artist.name AS artist_name,
SUM(invoice_line.unit_price *invoice_line.quantity) AS total_sale
FROM invoice_line
JOIN track ON track.track_id=invoice_line. invoice_id
JOIN album ON album.album_id=track.track_id
JOIN artist ON artist.artist_id=album.album_id
GROUP BY artist_id
ORDER BY total_sale DESC
limit 1

)
SELECT customer.customer_id, customer.first_name,customer.last_name,
bsa.artist_name,
SUM(invoice_line.unit_price *invoice_line.quantity) AS total_spend
FROM invoice_line
JOIN customer ON customer.customer_id=invoice.customer_id
JOIN invoice_line ON invoice_line.invoice_id=invoice.invoice_id
JOIN track t ON t.track_id= invoice_line.track_id
JOIN album alb ON alb.album_id=t.track_id
JOIN best_selling_artist bsa ON bsa.artist_id=alb.artist_id
GROUP BY 1,2,3,4
ORDER BY 5 DESC;
