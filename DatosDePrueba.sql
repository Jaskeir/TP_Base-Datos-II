Use VETERINARIA
Go

--SELECT * FROM Sedes

-- 1. PERMISOS
INSERT INTO Permisos(Nombre)
VALUES ('Administrador'), ('Veterinario'), ('Cliente'), ('Soporte');

-- 2. USUARIOS
INSERT INTO Usuarios(IDPermiso, Email, Clave)
VALUES	(1, 'admin1@vet.com', 'admin123'),
		(2, 'vet1@vet.com', 'vet123'),
		(2, 'vet2@vet.com', 'vet456'),
		(3, 'cliente1@gmail.com', 'cli123'),
		(3, 'cliente2@gmail.com', 'cli456'),
		(3, 'cliente3@gmail.com', 'cli789'),
		(1, 'admin2@vet.com', 'admin456'),
		(2, 'vet3@vet.com', 'vet789'),
		(3, 'cliente4@gmail.com', 'cli321'),
		(3, 'cliente5@gmail.com', 'cli654');

-- 3. SEDES
INSERT INTO Sedes(DireccionSede, NombreSede, Telefono)
VALUES	('Av. Rivadavia 1234', 'Sede Caballito', '1122334455'),
		('Av. Córdoba 4587', 'Sede Palermo', '1133445566'),
		('Av. Santa Fe 980', 'Sede Recoleta', '1144556677'),
		('Calle Mitre 200', 'Sede Lomas', '1122113344'),
		('Av. Belgrano 1500', 'Sede Congreso', '1155667788'),
		('Av. San Martín 784', 'Sede Devoto', '1133221100'),
		('Calle 12 Nº450', 'Sede La Plata', '2214455667'),
		('Figueroa Alcorta 789', 'Sede Núñez', '1177889900'),
		('Av. Callao 990', 'Sede Tribunales', '1199887766'),
		('Av. Independencia 345', 'Sede San Telmo', '1166554433');

-- 4. TELEFONOS
INSERT INTO Telefonos(IDUsuario, Telefono, Observaciones)
VALUES
	(1, '1123456789', 'Llamar a la tarde'),
	(2, '1134567890', 'Solo WhatsApp'),
	(3, '1145678901', 'Línea emergencia'),
	(7, '1189012345', 'Solo urgencias'),
	(8, '1190123456', 'Solo mensajes'),
	(4, '1156789012', 'Madre cliente'),
	(5, '1167890123', 'Hermana cliente'),
	(6, '1178901234', 'Padre cliente'),
	(9, '1101234567', 'Esposo cliente'),
	(10, '1112345678', 'Hija cliente');

-- 5. ADMINISTRADORES
INSERT INTO Administradores(IDUsuario, Nombre)
VALUES
	(1, 'Laura Fernández'),
	(7, 'Carlos Méndez');

-- 6. ESPECIALIDADES
INSERT INTO Especialidades(Nombre, DescripcionEspecialidad)
VALUES
	('Traumatología', 'Fracturas, lesiones óseas'),
	('Oftalmología', 'Problemas visuales en animales'),
	('Dermatología', 'Tratamiento de la piel'),
	('Odontología', 'Cuidado dental de mascotas'),
	('Cardiología', 'Enfermedades del corazón'),
	('Neurología', 'Sistema nervioso'),
	('Oncología', 'Tratamiento del cáncer'),
	('Nutrición', 'Planes alimentarios'),
	('Geriatría', 'Atención a animales mayores'),
	('Rehabilitación', 'Recuperación postoperatoria');

-- 7. VETERINARIOS
INSERT INTO Veterinarios(IDUsuario, Dni, Nombre, IDEspecialidad)
VALUES
	(2, '30111222', 'Dr. Juan Pérez', 1),
	(3, '30222333', 'Dra. Ana López', 2),
	(8, '30333444', 'Dr. Mario Ruiz', 3);

-- 8. HORARIOS
INSERT INTO Horarios(DiaSemana, HoraDesde, HoraHasta, DuracionConsulta, IDSede, IDEspecialidad)
VALUES
	('Lunes', '08:00', '12:00', 30, 1, 1),
	('Martes', '08:30', '12:30', 30, 2, 2),
	('Miércoles', '09:00', '13:00', 30, 3, 3),
	('Jueves', '08:00', '12:00', 20, 4, 4),
	('Viernes', '09:00', '13:00', 25, 5, 5),
	('Lunes', '14:00', '18:00', 30, 6, 6),
	('Martes', '15:00', '19:00', 30, 7, 7),
	('Miércoles', '14:30', '18:30', 30, 8, 8),
	('Jueves', '16:00', '20:00', 30, 9, 9),
	('Viernes', '15:00', '19:00', 30, 10, 10);

-- 9. CLIENTES
INSERT INTO Clientes(IDUsuario, Dni, Nombre, Domicilio)
VALUES
	(4, '12345678', 'Marcela Torres', 'Calle Falsa 123'),
	(5, '23456789', 'Luis Gómez', 'Av. Libertador 456'),
	(6, '34567890', 'Julia Martínez', 'Belgrano 789'),
	(9, '45678901', 'Ezequiel Rojas', 'Callao 1010'),
	(10, '56789012', 'Nadia Salas', 'Maipú 333');

-- 10. MASCOTAS
INSERT INTO Mascotas(IDCliente, Nombre, Especie)
VALUES
	(1, 'Toby', 'Perro'),
	(1, 'Michi', 'Gato'),
	(2, 'Coco', 'Perro'),
	(3, 'Luna', 'Gata'),
	(4, 'Simba', 'Gato'),
	(5, 'Rocky', 'Perro'),
	(2, 'Nina', 'Coneja'),
	(3, 'Thor', 'Perro'),
	(4, 'Pelusa', 'Gata'),
	(5, 'Bobby', 'Perro');

-- 11. ESTADOS
INSERT INTO Estados(Estado)
VALUES
	('Disponible'),
	('Confirmado'),
	('Cancelado'),
	('Reprogramado'),
	('Ausente');

-- 12. TURNOS
INSERT INTO Turnos(IDMascota, IDHorario, IDEstado, IDVeterinario, FechaHora)
VALUES
	(1, 1, 1, 1, '2025-06-20T09:00:00'),
	(2, 2, 2, 2, '2025-06-21T10:30:00'),
	(3, 3, 1, 3, '2025-06-22T11:00:00'),
	(4, 4, 3, 1, '2025-06-23T08:30:00'),
	(5, 5, 4, 2, '2025-06-24T09:45:00'),
	(6, 6, 1, 3, '2025-06-24T15:00:00'),
	(7, 7, 2, 1, '2025-06-25T15:45:00'),
	(8, 8, 1, 2, '2025-06-26T16:30:00'),
	(9, 9, 3, 3, '2025-06-27T17:15:00'),
	(10, 10, 1, 1, '2025-06-28T16:00:00');