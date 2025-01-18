/* Enunciado:

Escribe una consulta SQL que seleccione el nombre y apellido de cada empleado, junto con el 
nombre del proyecto y las horas asignadas a ese proyecto.

Orden de Resultados: Los resultados deben estar ordenados primero por empleado y luego por las
 horas asignadas de manera descendente.

Presentación de Datos: Asegúrate de que cada línea del reporte muestre claramente el nombre 
del empleado, el nombre del proyecto, y las horas asignadas a ese proyecto.

Recuerda utilizar los siguientes alias para el resultado final: Nombre Empleado, 
Apellido Empleado, Nombre Proyecto y  Horas Asignadas
*/
select * from empleados;
select * from asignacionesdeproyectos;

SELECT 
    empleados.nombre AS "Nombre Empleado",
    empleados.apellido AS "Apellido Empleado",
    proyectos.nombre AS "Nombre Proyecto",
    asignacionesdeproyectos.horas_asignadas AS "Horas Asignadas"
FROM 
    empleados
JOIN 
    asignacionesdeproyectos 
ON 
    empleados.empleado_id = asignacionesdeproyectos.empleado_id
JOIN 
    proyectos 
ON 
    asignacionesdeproyectos.proyecto_id = proyectos.proyecto_id
ORDER BY 
    empleados.nombre ASC,
    asignacionesdeproyectos.horas_asignadas DESC;
