DELIMITER $$ 

CREATE TRIGGER RegistrarNuevoEmpleado
AFTER INSERT ON empleados
FOR EACH ROW
BEGIN
	INSERT INTO logempleados(empleado_id, fecha_registro) VALUES (NEW.empleado_id, NOW());
END$$

DELIMITER ;

INSERT INTO empleados(nombre, apellido, email) VALUES ("Juan", "Perez", "Juan.Perez@gmail.com");

SELECT * FROM logempleados;

