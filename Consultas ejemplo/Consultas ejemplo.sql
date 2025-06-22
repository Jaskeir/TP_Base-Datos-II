SELECT * FROM Turnos--m
SELECT * FROM vw_TurnosConfirmados
WHERE Cliente = 'Marcela Torres';
SELECT * FROM vw_TurnosConfirmados
ORDER BY FechaHora;
SELECT COUNT(*) FROM vw_TurnosConfirmados;
---------------------------------------------------------
select *from vw_Horarios_Especialidades--e

select DiaSemana,HoraDesde,HoraHasta,DireccionSede , Especialidad from vw_Horarios_Especialidades where IDEspecialidad=1
select Especialidad from  vw_Horarios_Especialidades where IDSede=2

---------------------------------------------------------
select *from vw_VeterinarioPorSede--t 

select NombreSede from vw_VeterinarioPorSede where IDVeterinario=2
-----------------------------------------
select * from vw_Clientes--j
select Telefono, Observaciones,Nombre Mascota from vw_Clientes where IDMascota=1
---------------------------------------------------------
dbo.Permiso(@permisorequerido ,@idUser)--e
--------------
--procedimiento alta horario--m
select  * from Horarios
EXEC sp_AltaHorario
  @idUsuario = 1,        
  @DiaSemana = 'Lunes',
  @HoraDesde = '08:00',
  @HoraHasta = '12:00',
  @DuracionConsulta = 30,
  @IDSede = 1,
  @IDEspecialidad = 1;

  ----------------------------------------------------
  --procedimiento SACA TURNO--e
  select * from Turnos 
  EXEC sp_SacarTurno
  @idUsuario=1,
  @Mascota=2,
  @Horario=2,
  @Estado=1,
  @Veterinario=1,
  @FechaHora='2025-06-20 09:00:00'; 
--------------------------------------------------------
-- sp_BuscarVeterinarioPorSede--t
 EXEC sp_BuscarVeterinarioPorSede  @IDSede=1

-------------------------------------------
--sp_Telefonos--j
 select * froM Telefonos
 EXEC sp_Telefonos @Id=3
-----------------------------------
--trg_DefaultObservacionTelefono--j
select * froM Telefonos
INSERT INTO Telefonos(IDUsuario, Telefono, Observaciones)
VALUES
	(1, '1123456795','')--no validamos duplicacion de telefonos
-------------------------------------
--trg_EvitarTurnosDuplicados--m
INSERT INTO Turnos (IDMascota, IDHorario, IDEstado, IDVeterinario, FechaHora)
VALUES (1, 1, 2, 2,'2025-06-20 09:00:00')
------------------------------------------
 --trg_ValidarEmailUnico--m
INSERT INTO Usuarios (IDPermiso, Email, Clave)
VALUES (2, 'usuario@example.com', 'xyz789');
--------------------------------------------
-- trg_ValidarTurnoDentroDeHorario p--j
INSERT INTO Turnos (IDMascota, IDHorario, IDEstado, IDVeterinario, FechaHora)
VALUES (1, 1, 2, 2,GETDATE())
-------------------------------------------
--tr_Eliminar_Turno--e
select * from Turnos 
delete from Turnos where IDTurno=17
---------------------------------------------


INSERT INTO Turnos (IDMascota, IDHorario, IDEstado, IDVeterinario, FechaHora)VALUES (2, 1, 2, 1, '2025-03-25T08:30:00');delete from Turnos where IDTurno=34DROP PROCEDURE sp_AltaHorario Drop TRIGGER sp_AltaHorario ON Horarios