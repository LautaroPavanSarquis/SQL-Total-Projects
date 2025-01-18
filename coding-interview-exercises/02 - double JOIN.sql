/* Escribe una consulta SQL que seleccione el nombre del departamento y la suma total de horas 
asignadas a los proyectos por los empleados de ese departamento.

- Agrupación de Resultados: Los resultados deben estar agrupados por departamento.

- Orden de Resultados: Los resultados deben estar ordenados por el total de horas de mayor a menor.

Recuerda utilizar los siguientes alias para el resultado final: Nombre Departamento 
y Total Horas Asignadas
*/

SELECT 
    D.nombre AS "Nombre Departamento",
    SUM(AP.horas_asignadas) AS "Total Horas Asignadas"
FROM 
    departamentos D
JOIN 
    empleados E
ON 
    D.depto_id = E.depto_id
JOIN 
    asignacionesdeproyectos AP
ON 
    E.empleado_id = AP.empleado_id
GROUP BY 
    D.nombre
ORDER BY 
    "Total Horas Asignadas" DESC;