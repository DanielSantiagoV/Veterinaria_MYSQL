-- =====================================================
-- DATOS DE PRUEBA PARA VETERINARIA "MI MEJOR AMIGO"
-- =====================================================
-- Datos simplificados según requerimientos del taller

USE veterinaria_database;

-- =====================================================
-- INSERTAR DUENOS (mínimo 5)
-- =====================================================
INSERT INTO duenos (cedula, nombre_completo, telefono, direccion) VALUES
('1234567890', 'María González López', '3001234567', 'Calle 123 #45-67, Bogotá'),
('2345678901', 'Carlos Rodríguez Pérez', '3109876543', 'Carrera 78 #12-34, Medellín'),
('3456789012', 'Ana Martínez Silva', '3155551234', 'Avenida 5 #23-45, Cali'),
('4567890123', 'Luis Fernández Torres', '3207778888', 'Calle 89 #67-12, Barranquilla'),
('5678901234', 'Carmen Vargas Ruiz', '3114445555', 'Carrera 15 #34-56, Cartagena');

-- =====================================================
-- INSERTAR SERVICIOS (mínimo 5)
-- =====================================================
INSERT INTO servicios (nombre, descripcion, precio_base) VALUES
('Consulta médica', 'Revisión general de la mascota por veterinario', 50000.00),
('Baño', 'Baño completo con shampoo especial para mascotas', 30000.00),
('Corte de uñas', 'Corte y limpieza de uñas', 15000.00),
('Desparasitación', 'Aplicación de desparasitante interno y externo', 25000.00),
('Vacunación', 'Aplicación de vacunas según calendario', 35000.00);

-- =====================================================
-- INSERTAR MASCOTAS (mínimo 10)
-- =====================================================
INSERT INTO mascotas (id_dueno, nombre, especie, raza, edad, sexo, vacunada) VALUES
(1, 'Luna', 'perro', 'Golden Retriever', 3, 'hembra', 'si'),
(1, 'Max', 'perro', 'Labrador', 2, 'macho', 'si'),
(2, 'Mittens', 'gato', 'Siamés', 1, 'hembra', 'no'),
(2, 'Rocky', 'perro', 'Pitbull', 4, 'macho', 'si'),
(3, 'Bella', 'perro', 'Poodle', 5, 'hembra', 'si'),
(3, 'Simba', 'gato', 'Persa', 2, 'macho', 'no'),
(4, 'Thor', 'perro', 'Husky', 3, 'macho', 'si'),
(4, 'Nina', 'gato', 'Maine Coon', 1, 'hembra', 'no'),
(5, 'Rex', 'perro', 'Pastor Alemán', 6, 'macho', 'si'),
(5, 'Milo', 'perro', 'Beagle', 2, 'macho', 'si');

-- =====================================================
-- INSERTAR VISITAS (mínimo 10)
-- =====================================================
INSERT INTO visitas (id_mascota, id_servicio, fecha_visita, observaciones) VALUES
(1, 1, '2024-01-15', 'Consulta de rutina, mascota en buen estado'),
(1, 2, '2024-01-20', 'Baño completo con tratamiento antipulgas'),
(2, 1, '2024-01-18', 'Revisión por cojera en pata trasera'),
(3, 4, '2024-01-22', 'Desparasitación interna y externa'),
(4, 5, '2024-01-25', 'Aplicación de vacuna antirrábica'),
(5, 3, '2024-01-28', 'Corte de uñas y limpieza de oídos'),
(6, 1, '2024-02-01', 'Consulta por problemas digestivos'),
(7, 2, '2024-02-05', 'Baño y corte de pelo'),
(8, 4, '2024-02-08', 'Desparasitación de rutina'),
(9, 5, '2024-02-12', 'Vacunación anual completa');

-- =====================================================
-- INSERTAR TRATAMIENTOS (mínimo 5)
-- =====================================================
INSERT INTO tratamientos (id_visita, nombre, observaciones) VALUES
(1, 'Vitaminas', 'Complejo vitamínico para fortalecer sistema inmune'),
(3, 'Antiinflamatorio', 'Medicamento para reducir inflamación en pata'),
(6, 'Antibiótico', 'Tratamiento para infección digestiva'),
(7, 'Probiótico', 'Suplemento para mejorar flora intestinal'),
(9, 'Antiparasitario', 'Medicamento para eliminar parásitos internos');

-- =====================================================
-- COMENTARIOS EXPLICATIVOS
-- =====================================================
/*
DATOS INSERTADOS:

DUENOS (5 registros):
- María González López
- Carlos Rodríguez Pérez  
- Ana Martínez Silva
- Luis Fernández Torres
- Carmen Vargas Ruiz

SERVICIOS (5 registros):
- Consulta médica ($50,000)
- Baño ($30,000)
- Corte de uñas ($15,000)
- Desparasitación ($25,000)
- Vacunación ($35,000)

MASCOTAS (10 registros):
- Luna (Golden Retriever, hembra, 3 años, vacunada)
- Max (Labrador, macho, 2 años, vacunada)
- Mittens (Siamés, hembra, 1 año, no vacunada)
- Rocky (Pitbull, macho, 4 años, vacunada)
- Bella (Poodle, hembra, 5 años, vacunada)
- Simba (Persa, macho, 2 años, no vacunada)
- Thor (Husky, macho, 3 años, vacunada)
- Nina (Maine Coon, hembra, 1 año, no vacunada)
- Rex (Pastor Alemán, macho, 6 años, vacunada)
- Milo (Beagle, macho, 2 años, vacunada)

VISITAS (10 registros):
- Diferentes tipos de servicios aplicados a las mascotas
- Fechas distribuidas entre enero y febrero de 2024
- Observaciones específicas para cada visita

TRATAMIENTOS (5 registros):
- Vitaminas para Luna
- Antiinflamatorio para Max
- Antibiótico para Simba
- Probiótico para Bella
- Antiparasitario para Nina
*/ 