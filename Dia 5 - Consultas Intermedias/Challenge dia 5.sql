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

