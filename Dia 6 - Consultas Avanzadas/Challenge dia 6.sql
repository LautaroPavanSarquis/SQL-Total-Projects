/* Identificar las series mas exitosas en la base de datos

las series mas exitosas se definen por cantidad de episodios y rating promedio de IMDB

El resultado debe ser una tabla con al menos las siguientes columnas: titulo, cantidad de episodios,
rating promedio
*/

WITH EpisodiosPorSerie AS (
  SELECT 
    serie_id,
    COUNT(episodio_id) AS num_episodios,
    AVG(rating_imdb) AS promedio_imdb
  FROM Episodios
  GROUP BY serie_id
)

SELECT 
  s.titulo,
  e.num_episodios,
  e.promedio_imdb
FROM Series s
JOIN EpisodiosPorSerie e ON s.serie_id = e.serie_id
ORDER BY e.promedio_imdb DESC, e.num_episodios DESC;