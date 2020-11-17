CREATE FUNCTION contentMovies(INTEGER)
	RETURNS SETOF VARCHAR AS $$
		SELECT title FROM contents
		INNER JOIN content_actors ON
		(contents.content_id = content_actors.content_id)
		INNER JOIN actors ON
		($1 = content_actors.actor_id)
		WHERE contents.content_type = 2
		GROUP BY title;
	$$
LANGUAGE SQL;

SELECT * FROM contentMovies(3177);

CREATE FUNCTION countContentDirector(INTEGER)
	RETURNS INT8 AS $$
		SELECT COUNT(content_directors.director_id) FROM content_directors
		WHERE director_id = $1;
	$$
LANGUAGE SQL;

SELECT * FROM countContentDirector(1);
