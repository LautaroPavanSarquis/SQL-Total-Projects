USE EmpresaDB;

INSERT INTO Departamentos (nombre, ubicacion) VALUES
('Tecnología', 'Edificio Central'),
('Recursos Humanos', 'Edificio B'),
('Marketing', 'Edificio Central'),
('Ventas', 'Edificio C'),
('Finanzas', 'Edificio A'),
('Operaciones', 'Edificio C'),
('Soporte Técnico', 'Edificio B'),
('Investigación y Desarrollo', 'Edificio Central'),
('Innovación', 'Edificio Innovación'),
('Soporte Cliente', 'Edificio C'),
('Desarrollo de Producto', 'Edificio D'),
('Control de Calidad', 'Edificio E'),
('Logística', 'Edificio E');

INSERT INTO Empleados (nombre, apellido, email, depto_id) VALUES
('Juan', 'Pérez', 'juan.perez@email.com', 1),
('Ana', 'Gómez', 'ana.gomez@email.com', 2),
('Luis', 'Martínez', 'luis.martinez@email.com', 1),
('Sofía', 'Rodríguez', 'sofia.rodriguez@email.com', 3),
('Carlos', 'López', 'carlos.lopez@email.com', 4),
('Marta', 'Díaz', 'marta.diaz@email.com', 5),
('Pedro', 'González', 'pedro.gonzalez@email.com', 6),
('Lucía', 'Álvarez', 'lucia.alvarez@email.com', 7),
('Fernando', 'Ruiz', 'fernando.ruiz@email.com', 7);

INSERT INTO Proyectos (nombre, descripcion, fecha_inicio, fecha_fin) VALUES
('Proyecto Alpha', 'Desarrollo de sistema de gestión interna.', '2022-01-01', '2022-12-31'),
('Campaña de Marketing Digital', 'Campaña para redes sociales y buscadores.', '2022-03-15', '2022-08-30'),
('Expansión de Ventas', 'Estrategia de expansión de mercado en Asia.', '2022-05-01', '2023-04-30'),
('Optimización de Operaciones', 'Proyecto de mejora continua en operaciones.', '2022-02-01', '2022-09-30'),
("Rebranding de la Compañía", "Proyecto de marketing para actualizar la imagen de la marca.", "2022-10-01", "2023-03-30"),
("Optimización de la Cadena de Suministro", "Mejoras en logística para reducir costos y tiempos de entrega.", "2022-08-20", "2023-02-10");

INSERT INTO AsignacionesDeProyectos (proyecto_id, empleado_id, horas_asignadas) VALUES
(1, 8, 5),
(5, 7, 32),
(4, 6, 17),
(5, 1, 39),
(2, 6, 24),
(2, 4, 34),
(4, 4, 21),
(5, 2, 32),
(1, 2, 29),
(2, 7, 29),
(4, 1, 13);