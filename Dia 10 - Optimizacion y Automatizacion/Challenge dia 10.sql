/*
-Crear una vista llamada "VistaEmpleadosProyectos" 

-La vista debe ser una consulta que muestre el nombre y apellido del empleado,
 junto con el proyecto al que esta asignado

-Utiliza las tablas Empleados, AsignacionesDeProyectos y Proyectos
*/

CREATE OR REPLACE VIEW VistaEmpleadosProyectos AS
SELECT 
    Empleados.nombre AS NombreEmpleado, 
    Empleados.apellido AS ApellidoEmpleado, 
    COALESCE(Proyectos.nombre, 'Sin Proyecto') AS NombreProyecto
FROM 
    Empleados
LEFT JOIN 
    AsignacionesDeProyectos ON Empleados.empleado_id = AsignacionesDeProyectos.empleado_id
LEFT JOIN 
    Proyectos ON AsignacionesDeProyectos.proyecto_id = Proyectos.proyecto_id;