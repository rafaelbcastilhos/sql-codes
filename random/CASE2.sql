SELECT
	CASE WHEN imdb_score > 9.0 THEN 'Diamante'
	WHEN imdb_score BETWEEN 8.5 AND 9.0 THEN 'Ouro'
	ELSE 'Prata'
	END AS classificacao, COUNT(content_id)
FROM contents
GROUP BY classificacao;

SELECT title, total_seasons, 
	CASE WHEN total_seasons < 3 THEN 'Rápida'
	WHEN total_seasons BETWEEN 4 AND 6 THEN 'Intermediária'
	ELSE 'Longa'
	END AS duracao
FROM contents 
WHERE content_type = 1
ORDER BY title;

SELECT genres.name, SUM(contents.imdb_score_votes) AS soma,
	CASE WHEN SUM(contents.imdb_score_votes) > 35000000 THEN 'Top 1'
	WHEN SUM(contents.imdb_score_votes) BETWEEN 10000000 AND 35000000 THEN 'Top 2'
	ELSE 'Top 3' 
	END AS classificacao
FROM contents
INNER JOIN content_genres ON
(contents.content_id = content_genres.content_id)
INNER JOIN genres ON
(genres.genre_id = content_genres.genre_id)
GROUP BY genres.name
ORDER BY SUM(contents.imdb_score_votes) DESC;
