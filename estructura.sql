-- =====================================================
-- SISTEMA DE BASE DE DATOS PARA VETERINARIA "MI MEJOR AMIGO"
-- =====================================================
-- Estructura simplificada según requerimientos del taller

-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS veterinaria_database;
USE veterinaria_database;

;

-- =====================================================
-- TABLA: DUENOS
-- =====================================================
-- Almacena información de los dueños de mascotas
CREATE TABLE duenos (
    id_dueno INT AUTO_INCREMENT PRIMARY KEY,
    cedula VARCHAR(20) NOT NULL UNIQUE,
    nombre_completo VARCHAR(200) NOT NULL,
    telefono VARCHAR(20),
    direccion TEXT,
    INDEX idx_cedula (cedula)
);

-- =====================================================
-- TABLA: MASCOTAS
-- =====================================================
-- Información de las mascotas
CREATE TABLE mascotas (
    id_mascota INT AUTO_INCREMENT PRIMARY KEY,
    id_dueno INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    especie VARCHAR(50) NOT NULL,
    raza VARCHAR(100),
    edad INT,
    sexo ENUM('macho', 'hembra'),
    vacunada ENUM('si', 'no') DEFAULT 'no',
    FOREIGN KEY (id_dueno) REFERENCES duenos(id_dueno) ON DELETE CASCADE,
    INDEX idx_dueno (id_dueno),
    INDEX idx_nombre (nombre)
);

-- =====================================================
-- TABLA: SERVICIOS
-- =====================================================
-- Catálogo de servicios que ofrece la veterinaria
CREATE TABLE servicios (
    id_servicio INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio_base DECIMAL(10,2) NOT NULL,
    INDEX idx_nombre (nombre)
);

-- =====================================================
-- TABLA: VISITAS
-- =====================================================
-- Registro de visitas de mascotas a la veterinaria
CREATE TABLE visitas (
    id_visita INT AUTO_INCREMENT PRIMARY KEY,
    id_mascota INT NOT NULL,
    id_servicio INT NOT NULL,
    fecha_visita DATE NOT NULL,
    observaciones TEXT,
    FOREIGN KEY (id_mascota) REFERENCES mascotas(id_mascota) ON DELETE CASCADE,
    FOREIGN KEY (id_servicio) REFERENCES servicios(id_servicio) ON DELETE RESTRICT,
    INDEX idx_mascota (id_mascota),
    INDEX idx_servicio (id_servicio),
    INDEX idx_fecha (fecha_visita)
);

-- =====================================================
-- TABLA: TRATAMIENTOS
-- =====================================================
-- Tratamientos recetados en las visitas
CREATE TABLE tratamientos (
    id_tratamiento INT AUTO_INCREMENT PRIMARY KEY,
    id_visita INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    observaciones TEXT,
    FOREIGN KEY (id_visita) REFERENCES visitas(id_visita) ON DELETE CASCADE,
    INDEX idx_visita (id_visita)
);

-- =====================================================
-- COMENTARIOS EXPLICATIVOS
-- =====================================================
/*
ESTRUCTURA DE LA BASE DE DATOS SEGÚN REQUERIMIENTOS:

1. DUENOS: Información de los dueños de mascotas (cédula, nombre, teléfono, dirección)
2. MASCOTAS: Información de las mascotas (nombre, especie, raza, edad, sexo, vacunada)
3. SERVICIOS: Catálogo de servicios (nombre, descripción, precio base)
4. VISITAS: Registro de visitas de mascotas (mascota, servicio, fecha)
5. TRATAMIENTOS: Tratamientos recetados en las visitas (nombre, observaciones)

RELACIONES:
- Un dueño puede tener una o varias mascotas (1:N)
- Cada mascota pertenece a un solo dueño (N:1)
- En una visita se realiza un servicio (N:1)
- Una visita puede tener uno o más tratamientos (1:N)
- Un tratamiento está vinculado a una visita (N:1)
*/ 