--- permite que solo los administradores agreguen nuevos horarios en la base de datos
CREATE PROCEDURE sp_AltaHorario
  @idUsuario INT,                    -- ID del usuario que intenta crear el horario
  @DiaSemana VARCHAR(15),           -- Día de la semana (ej: Lunes)
  @HoraDesde TIME,                  -- Hora de inicio del horario
  @HoraHasta TIME,                  -- Hora de fin del horario
  @DuracionConsulta INT,           -- Duración de cada consulta en minutos
  @IDSede INT,                      -- Sede donde se dará el servicio
  @IDEspecialidad INT               -- Especialidad del horario (ej: Traumatología)
AS
BEGIN
  BEGIN TRY
    DECLARE @PermisoRequerido INT;  -- Guardamos el permiso necesario (Administrador)
    DECLARE @AUX INT;               -- Variable auxiliar para validaciones

    -- Obtenemos el ID del permiso "Administrador"
    SET @PermisoRequerido = (SELECT IDPermiso FROM Permisos WHERE Nombre = 'Administrador');

    -- Verificamos si el usuario tiene ese permiso usando la función dbo.Permiso
    SET @AUX = dbo.Permiso(@PermisoRequerido, @idUsuario);

    -- Si tiene permiso de administrador, sigue el proceso
    IF @AUX = 1
    BEGIN
        -- Verificamos si la sede existe
        IF NOT EXISTS (SELECT 1 FROM Sedes WHERE IDSede = @IDSede)
        BEGIN
            RAISERROR('La sede especificada no existe.', 16, 1);
            RETURN;
        END

        -- Verificamos si la especialidad existe
        IF NOT EXISTS (SELECT 1 FROM Especialidades WHERE IDEspecialidad = @IDEspecialidad)
        BEGIN
            RAISERROR('La especialidad especificada no existe.', 16, 1);
            RETURN;
        END

        -- Verificamos que no exista ya un horario igual (mismo día, hora, sede y especialidad)
        IF EXISTS (
            SELECT 1
            FROM Horarios
            WHERE DiaSemana = @DiaSemana
              AND HoraDesde = @HoraDesde
              AND HoraHasta = @HoraHasta
              AND IDSede = @IDSede
              AND IDEspecialidad = @IDEspecialidad
        )
        BEGIN
            RAISERROR('Ya existe un horario con esos parámetros.', 16, 1);
            RETURN;
        END

        -- Si todo está bien, insertamos el nuevo horario
        INSERT INTO Horarios (DiaSemana, HoraDesde, HoraHasta, DuracionConsulta, IDSede, IDEspecialidad)
        VALUES (@DiaSemana, @HoraDesde, @HoraHasta, @DuracionConsulta, @IDSede, @IDEspecialidad);
    END
    ELSE
    BEGIN
        -- Si no tiene permiso de administrador, se lanza un error
        RAISERROR('El usuario no tiene permiso de administrador.', 16, 1);
    END
  END TRY
  BEGIN CATCH
    -- Captura cualquier error y lo muestra
    PRINT ERROR_MESSAGE();
  END CATCH
END

 
 ------------------------------------------------------
--- Ejemplos para ver el funcionamiento 
------------------------------------------------------

-- Esto devuelve 1 si el usuario tiene el permiso
-- Reemplazá los valores por los que correspondan en tu base

DECLARE @idUsuario INT = 1;
DECLARE @idPermisoAdministrador INT;

-- Obtener ID del permiso llamado 'Administrador'
SELECT @idPermisoAdministrador = IDPermiso
FROM Permisos
WHERE Nombre = 'Administrador';

-- Llamar a la función Permiso
SELECT dbo.Permiso(@idPermisoAdministrador, @idUsuario) AS TienePermiso;

SELECT * FROM Sedes WHERE IDSede = 1;
SELECT * FROM Especialidades WHERE IDEspecialidad = 2;

EXEC sp_AltaHorario
  @idUsuario = 1,
  @DiaSemana = 'Lunes',
  @HoraDesde = '09:00',
  @HoraHasta = '12:00',
  @DuracionConsulta = 30,
  @IDSede = 1,
  @IDEspecialidad = 2;

SELECT *
FROM Horarios
WHERE DiaSemana = 'Lunes'
  AND HoraDesde = '09:00'
  AND HoraHasta = '12:00'
  AND IDSede = 1
  AND IDEspecialidad = 2;

