
-- Macros 
DELIMITER //

CREATE PROCEDURE AgregarEmpleado(
	IN _nombre varchar(255), 
	IN _apellido varchar(255), 
	IN _email VARCHAR(255),
    IN _depto_id INT   
    )

BEGIN
	INSERT INTO Empleados(nombre, apellido, email, depto_id) VALUES (_nombre, _apellido, _email, _depto_id);
END //

DELIMITER  ;

-- Transacciones 
BEGIN;
INSERT INTO asignacionesdeproyectos (proyecto_id, empleado_id, horas_asignadas) VALUES(5,1,10);
INSERT INTO asignacionesdeproyectos (proyecto_id, empleado_id, horas_asignadas) VALUES(5,2,15);

-- ACA IRIAN MAS ISERCIONES
-- ACA IRIA EL CODIGO PARA VALIDAR EL TOTAL DE HORAS
-- SI EL TOTAL EXCEDE, PODEMOS REVETIR AL SAVEPOINT

ROLLBACK TO PreValidacion;

-- -----------------------------------------------------------------------------

/*
CALL AgregarEmpleado( "Elena", "Torres", "elena.torres@gmail.com", "3");

select * from empleados;
*/