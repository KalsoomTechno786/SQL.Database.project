--we want to find out most popular genre music in each country and most popular genre 
--genre with highest purchase  amount.
WITH popular_genre AS (
SELECT COUNT( invoice_line.quantity)AS purchase_amount,customer.country,genre.name,genre.genre_id,
ROW_NUMBER() OVER(PARTITION BY customer.country ORDER BY (invoice_line.quantity)DESC) AS RowNo,
FROM invoice_line
JOIN invoice ON invoice.invoice_id=invoice_line.invoice_id
JOIN customer ON customer.customer_id=invoice.customer_id
JOIN track ON  track.track_id=invoice_line.track_id
JOIN genre ON genre.genre_id=track.genre_id
GROUP BY 2,3,4
ORDER BY 2 ASC,1 DESC
)
SELECT * FROM popular_genre;
)