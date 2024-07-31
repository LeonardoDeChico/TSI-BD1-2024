4(
SELECT category.name AS category_name, SUM(products.amount) AS total_amount
FROM products products
JOIN categories category ON products.id_categories = category.id
GROUP BY category.name;
)

6 (
SELECT movies.id, movies.name
FROM movies movies
JOIN genres genres ON movies.id_genres = genres.id
WHERE genres.description = 'Action';
)