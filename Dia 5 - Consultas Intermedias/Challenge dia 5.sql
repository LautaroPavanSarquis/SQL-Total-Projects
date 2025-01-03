-- Escribe una consulta SQL que genere una lista de titulo de series cuyos episodios 
-- tienen un rating de IMDb superior a 8.

SELECT titulo 
FROM series
WHERE serie_id IN (
    SELECT serie_id 
    FROM episodios 
    WHERE rating_imdb > 8
)
;

select 
	nombre,
    year(fecha_nacimiento) as "Año Nacimiento",
	case
		when year(fecha_nacimiento) between 1946 and 1964 
        then "Baby Boomers"
		
        when year(fecha_nacimiento) between 1965 and 1980 
        then "Generación X"
      
		when year(fecha_nacimiento) between 1965 and 1980 
        then "Generación X"
        
        when year(fecha_nacimiento) between 1981 and 1996 
        then "Millennials"
        
        when year(fecha_nacimiento) between 1997 and 2012 
        then "Generación Z"
                
        Else "Silent Generation"
        
        End as Generacion
from actores
order by nombre
;

select 
titulo, 
año_lanzamiento,
	case
		when año_lanzamiento<2010
		then "Antigua"
		
		when año_lanzamiento>2010
		then "Reciente"
		
		end as año_lanzamiento
from series
;

SELECT 
    titulo,
    CAST(año_lanzamiento AS char ) AS "Año Lanzamiento"
FROM series;

/*
Utiliza una sub consulta para analizar la popularidad de distintos generos de series de Netflix db

Utiliza una sub consulta para identificar los 3 generos mas populares (en funcion de la cantidad de seires)

luego para cada uno de estos generos realiza una consulta principal que consulte el titulo de la serie, el año de lanzamiento y el rating de Imdb promedio

*/
-- Subconsulta para identificar los 3 géneros más populares
WITH GenerosPopulares AS (
    SELECT genero, COUNT(*) AS cantidad_series
    FROM Series
    GROUP BY genero
    ORDER BY cantidad_series DESC
    LIMIT 3
)

-- Consulta principal para los detalles de series de los géneros más populares
SELECT 
    s.titulo,
    s.año_lanzamiento,
    AVG(e.rating_imdb) AS rating_imdb_promedio,
    g.genero
FROM GenerosPopulares g
JOIN Series s ON s.genero = g.genero
JOIN Episodios e ON s.serie_id = e.serie_id
GROUP BY s.titulo, s.año_lanzamiento, g.genero
ORDER BY g.genero, rating_imdb_promedio DESC;

