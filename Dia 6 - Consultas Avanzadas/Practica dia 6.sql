select * from episodios ;
select * from series ;

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

/* Escribe una consulta SQL que seleccione todas las series, incluyendo su titulo y año_lanzamiento 
y utiliza la función de ventana ROW_NUMBER() para asignar un número secuencial a cada serie basado en 
su año de lanzamiento (ORDER BY año_lanzamiento DESC), de la más reciente a la más antigua, 
esta última columna debe tener el nombre: clasificacion_global*/

SELECT
	titulo,
	año_lanzamiento,
row_number() OVER (order by año_lanzamiento desc) as clasificacion_global
from series;

/* Escribe una consulta SQL que seleccione la temporada, el título del episodio, la fecha de estreno 
y utilice ROW_NUMBER() en combinación con PARTITION BY para asignar un ranking de episodios basado 
en su fecha de estreno (de más reciente a más antiguo DESC), está nueva columna deberá tener 
el nombre: ranking_temporada
*/

SELECT 
    temporada,
    titulo,
    fecha_estreno,
    ROW_NUMBER() OVER(PARTITION BY temporada ORDER BY fecha_estreno DESC) AS ranking_temporada
FROM episodios;

/* Escribe una consulta de SQL que genere un ranking de episodios para cada temporada de Stranger 
Things (serie_id = 2) basándose en las calificaciones de IMDb, de modo que puedas identificar 
los episodios mejor valorados dentro de cada temporada.
*/

SELECT 
    temporada,
    titulo,
    rating_imdb,
    ROW_NUMBER() OVER(PARTITION BY temporada ORDER BY rating_imdb DESC) AS "Ranking IMDb"
FROM episodios
where serie_id = 2;

/* Escribe una consulta SQL que asigne un rango a cada episodio, donde episodios con la misma 
calificación compartan el mismo rango.

Ordena los episodios desde el más alto hasta el  más bajo, según su calificación, 
asegurándote de gestionar correctamente los empates.

El resultado deberá mostrar el titulo, su rating_imdb y su rango de popularidad, 
está última columna deberá tener el siguiente alias: ranking_imdb
*/

SELECT 
    titulo,
    rating_imdb,
    RANK() OVER (ORDER BY rating_imdb DESC) AS ranking_imdb
FROM Episodios;

/* Escribe una consulta SQL utilizando la función DENSE_RANK() para clasificar los episodios 
por su duración utilizando la tabla Episodios

Deberás asegurarte de que los episodios con la misma duración reciban el mismo rango, y los rangos 
sigan una secuencia continua, sin huecos entre ellos, independientemente de los empates.

El objetivo es identificar cuáles son los episodios más largos de la base de datos y cómo 
se comparan entre sí en términos de duración.

El resultado deberá mostrar el titulo, su duracion y la nueva columna generada ranking_por_duracion
*/

SELECT 
    titulo,
    duracion,
    DENSE_RANK() OVER (ORDER BY duracion DESC) AS ranking_por_duracion
FROM Episodios
ORDER BY ranking_por_duracion;






























