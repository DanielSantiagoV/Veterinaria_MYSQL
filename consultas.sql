-- =====================================================
-- CONSULTAS SQL PARA VETERINARIA "MI MEJOR AMIGO"
-- =====================================================
-- Consultas que demuestran el uso de funciones SQL según requerimientos del taller

USE veterinaria_database;

-- =====================================================
-- 1. CREACIÓN DE TABLA A PARTIR DE CONSULTA
-- =====================================================
-- Crear tabla con mascotas vacunadas
CREATE TABLE mascotas_vacunadas AS
SELECT id_mascota, nombre, especie, raza, edad, sexo
FROM mascotas 
WHERE vacunada = 'si';

-- =====================================================
-- 2. ALIAS EN CAMPOS
-- =====================================================
-- Listar dueños con alias en campos
SELECT 
    cedula AS documento_identidad,
    nombre_completo AS nombre_dueno,
    telefono AS numero_contacto,
    direccion AS ubicacion
FROM duenos;

-- =====================================================
-- 3. ALIAS EN SUBCONSULTAS
-- =====================================================
-- Mascotas que han tenido más de una visita
SELECT m.nombre AS nombre_mascota, m.especie, m.raza
FROM mascotas m
WHERE m.id_mascota IN (
    SELECT v.id_mascota 
    FROM visitas v 
    GROUP BY v.id_mascota 
    HAVING COUNT(*) > 1
);

-- =====================================================
-- 4. FUNCIONES DE AGREGACIÓN - COUNT
-- =====================================================
-- Contar total de mascotas por especie
SELECT 
    especie,
    COUNT(*) AS total_mascotas
FROM mascotas 
GROUP BY especie;

-- =====================================================
-- 5. FUNCIONES DE AGREGACIÓN - AVG
-- =====================================================
-- Promedio de edad de mascotas por especie
SELECT 
    especie,
    AVG(edad) AS promedio_edad
FROM mascotas 
GROUP BY especie;

-- =====================================================
-- 6. FUNCIONES DE AGREGACIÓN - MAX
-- =====================================================
-- Mascota de mayor edad por especie
SELECT 
    especie,
    MAX(edad) AS edad_maxima
FROM mascotas 
GROUP BY especie;

-- =====================================================
-- 7. ALIAS EN FUNCIONES DE AGREGACIÓN
-- =====================================================
-- Estadísticas de mascotas con alias
SELECT 
    especie,
    COUNT(*) AS cantidad_mascotas,
    AVG(edad) AS edad_promedio,
    MAX(edad) AS edad_maxima,
    MIN(edad) AS edad_minima
FROM mascotas 
GROUP BY especie;

-- =====================================================
-- 8. CONCAT
-- =====================================================
-- Concatenar nombre y especie de mascotas
SELECT 
    CONCAT(nombre, ' - ', especie) AS mascota_especie,
    raza,
    edad
FROM mascotas;

-- =====================================================
-- 9. UPPER
-- =====================================================
-- Nombres de mascotas en mayúsculas
SELECT 
    UPPER(nombre) AS nombre_mayuscula,
    especie,
    raza
FROM mascotas;

-- =====================================================
-- 10. LOWER
-- =====================================================
-- Especies en minúsculas
SELECT 
    nombre,
    LOWER(especie) AS especie_minuscula,
    raza
FROM mascotas;

-- =====================================================
-- 11. LENGTH
-- =====================================================
-- Longitud de nombres de mascotas
SELECT 
    nombre,
    LENGTH(nombre) AS longitud_nombre,
    especie
FROM mascotas;

-- =====================================================
-- 12. SUBSTRING
-- =====================================================
-- Primeras 3 letras del nombre de mascotas
SELECT 
    nombre,
    SUBSTRING(nombre, 1, 3) AS primeras_letras,
    especie
FROM mascotas;

-- =====================================================
-- 13. TRIM
-- =====================================================
-- Nombres de mascotas sin espacios extra
SELECT 
    TRIM(nombre) AS nombre_limpio,
    especie,
    raza
FROM mascotas;

-- =====================================================
-- 14. ROUND
-- =====================================================
-- Precio redondeado de servicios
SELECT 
    nombre AS servicio,
    descripcion,
    ROUND(precio_base, 0) AS precio_redondeado
FROM servicios;

-- =====================================================
-- 15. IF EN CAMPOS
-- =====================================================
-- Clasificar mascotas por edad
SELECT 
    nombre,
    especie,
    edad,
    IF(edad < 2, 'Cachorro', IF(edad < 7, 'Adulto', 'Senior')) AS categoria_edad
FROM mascotas;

-- =====================================================
-- CONSULTAS ADICIONALES CON JOIN
-- =====================================================

-- 16. JOIN para mostrar dueños y sus mascotas
SELECT 
    d.nombre_completo AS dueno,
    m.nombre AS mascota,
    m.especie,
    m.raza
FROM duenos d
JOIN mascotas m ON d.id_dueno = m.id_dueno;

-- 17. JOIN para mostrar visitas con detalles
SELECT 
    m.nombre AS mascota,
    s.nombre AS servicio,
    v.fecha_visita,
    v.observaciones
FROM visitas v
JOIN mascotas m ON v.id_mascota = m.id_mascota
JOIN servicios s ON v.id_servicio = s.id_servicio;

-- 18. JOIN para mostrar tratamientos con detalles
SELECT 
    m.nombre AS mascota,
    s.nombre AS servicio,
    t.nombre AS tratamiento,
    t.observaciones
FROM tratamientos t
JOIN visitas v ON t.id_visita = v.id_visita
JOIN mascotas m ON v.id_mascota = m.id_mascota
JOIN servicios s ON v.id_servicio = s.id_servicio;

-- 19. ORDER BY
-- Mascotas ordenadas por edad descendente
SELECT 
    nombre,
    especie,
    edad,
    sexo
FROM mascotas 
ORDER BY edad DESC;

-- 20. GROUP BY con HAVING
-- Dueños con más de una mascota
SELECT 
    d.nombre_completo AS dueno,
    COUNT(m.id_mascota) AS total_mascotas
FROM duenos d
JOIN mascotas m ON d.id_dueno = m.id_dueno
GROUP BY d.id_dueno, d.nombre_completo
HAVING COUNT(m.id_mascota) > 1;

-- =====================================================
-- COMENTARIOS EXPLICATIVOS
-- =====================================================
/*
CONSULTAS IMPLEMENTADAS SEGÚN REQUERIMIENTOS:

FUNCIONES OBLIGATORIAS (15 consultas):
1. Creación de tabla a partir de consulta ✓
2. Alias en campos ✓
3. Alias en subconsultas ✓
4. COUNT (función de agregación) ✓
5. AVG (función de agregación) ✓
6. MAX (función de agregación) ✓
7. Alias en funciones de agregación ✓
8. CONCAT ✓
9. UPPER ✓
10. LOWER ✓
11. LENGTH ✓
12. SUBSTRING ✓
13. TRIM ✓
14. ROUND ✓
15. IF en campos ✓

CONSULTAS ADICIONALES (5 consultas):
16. JOIN entre dueños y mascotas ✓
17. JOIN entre visitas, mascotas y servicios ✓
18. JOIN entre tratamientos, visitas, mascotas y servicios ✓
19. ORDER BY ✓
20. GROUP BY con HAVING ✓

Todas las consultas demuestran el uso correcto de las funciones SQL
requeridas en el taller y proporcionan información útil sobre la
base de datos de la veterinaria.
*/ 