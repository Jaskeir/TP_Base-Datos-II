-------------------------------------------
----------------- VISTAS ------------------
-------------------------------------------
--Marianna
--vw_TurnosConfirmados
SELECT * FROM Turnos

SELECT * FROM vw_TurnosConfirmados
WHERE Cliente = 'Marcela Torres';

SELECT * FROM vw_TurnosConfirmados
ORDER BY FechaHora;

--------------------------------------------------------------------------------------------------------------------------
--Ezequiel
--vw_Horarios_Especialidades
select * from vw_Horarios_Especialidades

select DiaSemana,HoraDesde,HoraHasta,DireccionSede , Especialidad from vw_Horarios_Especialidades where IDEspecialidad=1
select Especialidad from  vw_Horarios_Especialidades where IDSede=2

--------------------------------------------------------------------------------------------------------------------------
--Tomas
--vw_VeterinarioPorSede
select * from vw_VeterinarioPorSede

select NombreSede from vw_VeterinarioPorSede where IDVeterinario=2

--------------------------------------------------------------------------------------------------------------------------
--Julian
--vw_Clientes
select * from vw_Clientes
select Telefono, Observaciones, Nombre Mascota from vw_Clientes where IDMascota=1

--------------------------------------------------------------------------------------------------------------------------
--Ezequiel
--dbo.Permisos
dbo.Permiso(@permisorequerido ,@idUser)

-------------------------------------------
---------- PROCEDIMIENTOS -----------------
-------------------------------------------
--Marianna
--sp_AltaHorario
select  * from Horarios
EXEC sp_AltaHorario
@idUsuario = 1,        
@DiaSemana = 'Martes',
@HoraDesde = '08:00',
@HoraHasta = '12:00',
@DuracionConsulta = 30,
@IDSede = 1,
@IDEspecialidad = 1;

--------------------------------------------------------------------------------------------------------------------------
--Ezequiel
--sp_SacarTurno
select * from Turnos 
EXEC sp_SacarTurno
@idUsuario=1,
@Mascota=2,
@Horario=2,
@Estado=1,
@Veterinario=1,
@FechaHora='2025-06-25T11:00:00.000'; 

--------------------------------------------------------------------------------------------------------------------------
--Tomas
-- sp_BuscarVeterinarioPorSede
EXEC sp_BuscarVeterinarioPorSede  @IDSede = 3

--------------------------------------------------------------------------------------------------------------------------
--Julian
--sp_BuscarTelefonosPorMascota
select * from Telefonos
EXEC sp_Telefonos @Id = 3

-------------------------------------------
--------------- TRIGGERS ------------------
-------------------------------------------
--Julian
--trg_ValidacionDatosTelefono
select * from Telefonos

INSERT INTO Telefonos(IDUsuario, Telefono, Observaciones)
       VALUES (3, '112296448','') -- Sin informacion
select * from Telefonos

INSERT INTO Telefonos (IDUsuario, Telefono, Observaciones)
	   VALUES (3, '1199887889', NULL); -- Numero repetido

--------------------------------------------------------------------------------------------------------------------------
--Marianna
--trg_EvitarTurnosDuplicados
select * from Turnos 
INSERT INTO Turnos (IDMascota, IDHorario, IDEstado, IDVeterinario, FechaHora)
VALUES (1, 1, 2, 2,'2025-06-10T09:00:00.000')

--------------------------------------------------------------------------------------------------------------------------
--Marianna
--trg_ValidarEmailUnico
select * from  Usuarios
INSERT INTO Usuarios (IDPermiso, Email, Clave)
VALUES (3, 'usuario@example7.com', 'lyz789');

--------------------------------------------------------------------------------------------------------------------------
--Tomas
-- trg_ValidarTurnoDentroDeHorario
INSERT INTO Turnos (IDMascota, IDHorario, IDEstado, IDVeterinario, FechaHora)
VALUES (1, 1, 2, 2,GETDATE())

--------------------------------------------------------------------------------------------------------------------------
--Ezequiel
--trg_Eliminar_Turno
select * from Turnos 
delete from Turnos where IDTurno = 10
--------------------------------------------------------------------------------------------------------------------------