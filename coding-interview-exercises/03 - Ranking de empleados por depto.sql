/*
Escribe una consulta SQL que seleccione el nombre y apellido de cada empleado, junto con el total
de horas trabajadas y un ranking de empleados dentro de su departamento basado en las horas
trabajadas.

Funciones de Ventana: Utiliza la función de ventana RANK() para asignar un ranking a cada 
empleado en función de las horas trabajadas, agrupado por departamento.

Orden de Resultados: Los resultados deben estar ordenados por departamento y por ranking.

Recuerda utilizar los siguientes alias para el resultado final: Nombre, Apellido, 
Total Horas Trabajadas, Ranking Departamental
*/

SELECT 
    e.nombre AS Nombre,
    e.apellido AS Apellido,
    SUM(a.horas_asignadas) AS "Total Horas Trabajadas",
    RANK() OVER (PARTITION BY e.depto_id ORDER BY SUM(a.horas_asignadas) DESC) AS "Ranking Departamental"
FROM 
    Empleados e
JOIN 
    AsignacionesDeProyectos a ON e.empleado_id = a.empleado_id
GROUP BY 
    e.empleado_id, e.nombre, e.apellido, e.depto_id
ORDER BY 
    e.depto_id, "Ranking Departamental";