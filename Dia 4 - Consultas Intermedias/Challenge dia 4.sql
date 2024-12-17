-- ¿Qué géneros son más prevalentes en la base de datos NetflixDB? 
-- Genera una lista de los distintos géneros y la cantidad de series por cada uno.

SELECT series.genero,
count(*) as "Cantidad de Series"
FROM series
GROUP BY series.genero;
-------------------------    
-- RTA = Ciencia Ficcion
-------------------------
-------------------------------------------------------------------------------------
-- ¿Cuáles son las tres series con mayor rating IMDB y cuántos episodios tienen? 

SELECT 
    series.titulo AS "Titulo", 
    avg(episodios.rating_imdb) as IMDB_promedio
FROM 
    episodios
INNER JOIN 
    series 
ON 
    episodios.serie_id = series.serie_id
GROUP BY 
  series.serie_id, series.titulo
ORDER BY 
    Rating_IMDB_promedio desc
limit 3    
;
    
---------------------
-- RTA: Arcane 
---------------------
-------------------------------------------------------------------------------------
-- ¿Cuál es la duración total de todos los episodios para la serie "Stranger Things"? 
-- Este análisis te permitirá entender el compromiso temporal necesario para ver una serie completa.
SELECT 
    series.titulo AS "Titulo", 
    sum(episodios.duracion) as "Duracion Total en Minutos"
FROM 
    series
left JOIN 
    episodios 
ON 
    episodios.serie_id = series.serie_id     
WHERE series.titulo = 'Stranger Things';
