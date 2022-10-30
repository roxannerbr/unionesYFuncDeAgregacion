Micro desafío 1:

Utilizando la base de datos de películas queremos conocer, por un lado, los títulos y el
nombre del género de todas las series de la base de datos. 

SELECT series.title, genres.name FROM series INNER JOIN genres ON genre_id = genres.id;

Por otro, necesitamos listar los
títulos de los episodios junto con el nombre y apellido de los actores que trabajan en cada
uno de ellos

SELECT title, first_name, last_name FROM episodes INNER JOIN actor_episode ON episodes.id = episode_id INNER JOIN actors on actor_id= actor_id

MICRO DESAFIO 2:

Necesitamos obtener a todos los actores o actrices (mostrar nombre y apellido) que han trabajado en cualquier película de la saga de 
la Guerra de las galaxias, pero ¡cuidado!: debemos asegurarnos de que solo se muestre una sola vez cada actor/actriz.

SELECT DISTINCT first_name, last_name FROM actors INNER JOIN actor_movie ON actor_id = actors.id INNER JOIN movies ON movie_id = movies.id WHERE movies.title LIKE "%La Guerra de las galaxias%";

MICRO DESAFIO 3:

Debemos listar los títulos de cada película con su género correspondiente. En el caso de que no tenga género, mostraremos
una leyenda que diga "no tiene género".

SELECT movies.title, COALESCE(genres.name, "No tiene género") AS genres FROM movies LEFT JOIN genres ON genre_id = genres.id;

MICRO DESAFIO 4:

Necesitamos mostrar, de cada serie, la cantidad de días desde su estreno hasta su fin, con la particularidad de que 
a la columna que mostrará dicha cantidad la renombraremos: “Duración”.

SELECT title, DATEDIFF(end_date, release_date) AS Duración FROM series;

MICRO DESAFIO 5:

Listar los actores ordenados alfabéticamente cuyo nombre sea mayor a 6 caracteres.

SELECT first_name FROM actors WHERE LENGTH(first_name) > 6 ORDER BY first_name ASC;

Debemos mostrar la cantidad total de los episodios guardados en la base de datos.

SELECT COUNT(*) AS "Total" FROM episodes;

Para el siguiente desafío nos piden que obtengamos el título de todas las series y el total de temporadas que tiene cada una de ellas.

SELECT series.title, COUNT(seasons.id) AS seasons FROM series INNER JOIN seasons ON serie_id = series.id GROUP BY series.title;

Mostrar, por cada género, la cantidad total de películas que posee, siempre que sea mayor o igual a 3.

SELECT genres.name, COUNT(movies.id) AS movies FROM genres INNER JOIN movies ON genre_id = genres.id GROUP BY genres.name HAVING COUNT(movies.id) >= 3;





