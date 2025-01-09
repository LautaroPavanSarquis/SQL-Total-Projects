-- Creación de la base de datos EmpresaDB
CREATE DATABASE IF NOT EXISTS EmpresaDB;
USE EmpresaDB;

-- Creación de la tabla Departamentos
CREATE TABLE IF NOT EXISTS Departamentos (
    depto_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    ubicacion VARCHAR(255)
);

-- Creación de la tabla Empleados
CREATE TABLE IF NOT EXISTS Empleados (
    empleado_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    depto_id INT,
    FOREIGN KEY (depto_id) REFERENCES Departamentos(depto_id)
    ON DELETE SET NULL
);

-- Creación de la tabla Proyectos
CREATE TABLE IF NOT EXISTS Proyectos (
    proyecto_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT,
    fecha_inicio DATE,
    fecha_fin DATE
);

-- Creación de la tabla AsignacionesDeProyectos
CREATE TABLE IF NOT EXISTS AsignacionesDeProyectos (
    asignacion_id INT AUTO_INCREMENT PRIMARY KEY,
    proyecto_id INT,
    empleado_id INT,
    horas_asignadas INT NOT NULL,
    FOREIGN KEY (proyecto_id) REFERENCES Proyectos(proyecto_id),
    FOREIGN KEY (empleado_id) REFERENCES Empleados(empleado_id)
);

CREATE TABLE IF NOT EXISTS LogEmpleados (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    empleado_id INT,
    fecha_registro DATETIME,
    FOREIGN KEY (empleado_id) REFERENCES Empleados(empleado_id)
);