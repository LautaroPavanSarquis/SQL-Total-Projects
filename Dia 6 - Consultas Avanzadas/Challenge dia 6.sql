/* CTE = Common table expression   

WITH < nombre_de_la_CTE> AS (SELECT * FROM Episodios)

Select * FROM <nombre_de_la_CPE>
*/

WITH ListaEpisodios AS (
SELECT serie_id, episodio_id, titulo FROM episodios
),

ListaSeries AS(
SELECT serie_id, descripcion FROM series
)

SELECT * FROM ListaEpisodios
LEFT JOIN ListaSeries
on ListaEpisodios.serie_id = ListaSeries.serie_id
; 

select * from episodios ;
select * from series ;

/*
Escribe una consulta SQL empleando una CTE para determinar la fecha del primer episodio 
transmitido de cada serie.

Debes seleccionar el título de cada serie y la fecha del primer episodio, presentando estos 
datos en dos columnas finales llamadas 'Título de la Serie' y 'Fecha del Primer Episodio'

Ordena los resultados por la fecha del primer episodio de forma ascendente
*/

WITH PrimerEpisodio AS (
    SELECT 
        serie_id, 
        MIN(fecha_estreno) AS fecha_primer_episodio
    FROM Episodios
    GROUP BY serie_id
)

SELECT 
    s.titulo AS "Título de la Serie", 
    pe.fecha_primer_episodio AS "Fecha del Primer Episodio"
FROM PrimerEpisodio pe
INNER JOIN Series s
ON pe.serie_id = s.serie_id
ORDER BY pe.fecha_primer_episodio ASC;

/*
Escribe una consulta SQL que utilice una CTE para seleccionar el número total de series 
lanzadas por año para un género específico, digamos "Ciencia ficción".

Ordena los resultados por año de lanzamiento
*/

WITH SeriesPorAño AS (
    SELECT 
        año_lanzamiento, 
        COUNT(serie_id) AS total_series
    FROM Series
    WHERE genero = 'Ciencia ficción'
    GROUP BY año_lanzamiento
)

SELECT 
    año_lanzamiento AS "Año de Lanzamiento",
    total_series AS "Total de Series"
FROM SeriesPorAño
ORDER BY año_lanzamiento;

