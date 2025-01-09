-- Creación de la base de datos BibliotecaDB
CREATE DATABASE IF NOT EXISTS BibliotecaDB;
USE BibliotecaDB;

-- Creación de la tabla Autores
CREATE TABLE IF NOT EXISTS Autores (
    IDAutor INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL,
    Nacionalidad VARCHAR(100)
);

-- Creación de la tabla Libros
CREATE TABLE IF NOT EXISTS Libros (
    IDLibro INT AUTO_INCREMENT PRIMARY KEY,
    Titulo VARCHAR(255) NOT NULL,
    IDAutor INT,
    AñoPublicacion YEAR,
    FOREIGN KEY (IDAutor) REFERENCES Autores(IDAutor)
    ON DELETE SET NULL
);

-- Creación de la tabla Lectores
CREATE TABLE IF NOT EXISTS Lectores (
    IDLector INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL,
    CorreoElectronico VARCHAR(255) UNIQUE NOT NULL
);

-- Creación de la tabla Prestamos
CREATE TABLE IF NOT EXISTS Prestamos (
    IDPrestamo INT AUTO_INCREMENT PRIMARY KEY,
    IDLibro INT,
    IDLector INT,
    FechaPrestamo DATE NOT NULL,
    FechaDevolucion DATE,
    FOREIGN KEY (IDLibro) REFERENCES Libros(IDLibro)
    ON DELETE SET NULL,
    FOREIGN KEY (IDLector) REFERENCES Lectores(IDLector)
    ON DELETE SET NULL
);