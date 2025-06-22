CREATE PROCEDURE sp_SacarTurno(@idUsuario int,@Mascota int ,@Horario int ,
	@Estado int ,@Veterinario int ,@FechaHora datetime ) 
AS
BEGIN 
  BEGIN TRY 
   DECLARE @AUX INT;

   DECLARE @PermisoRequerido INT;

   SET @PermisoRequerido=(SELECT IDPermiso FROM Permisos where Nombre='Cliente');
--solo pueden sacar turno los clientes
   SET @AUX =dbo.Permiso(@PermisoRequerido,@idUsuario);
--se chequea que exista el usuario y tenga los 

    IF (@AUX = 1)
     BEGIN 
      DECLARE @DNIUser varchar(20);
	  DECLARE @DNIveterinario varchar(20);

      SET @DNIUser = (SELECT Dni FROM Clientes where IDUsuario=@idUsuario);
	  
	  IF EXISTS (SELECT * FROM Veterinarios Where IDVeterinario=@Veterinario)
	    BEGIN
	    SET @DNIveterinario=(SELECT Dni FROM Veterinarios Where IDVeterinario = @Veterinario);
	     IF (@DNIUser = @DNIveterinario)
          BEGIN
           RAISERROR ('NO PUEDE SACAR UN TURNO PARA SI MISMO', 16, 1)
		    RETURN;
          END
	   END
	  ELSE
	   BEGIN
	     RAISERROR ('NO EXISTE UN VETERINARIO REGISTRADO CON ESE ID', 16, 1)
		 RETURN;
	   END

	 IF NOT EXISTS (SELECT * FROM Mascotas Where IDMascota = @Mascota)
	     BEGIN
	       RAISERROR ('NO EXISTE UNA MASCOTA REGISTRADA CON ESE ID', 16, 1)
		    RETURN;
	     END
	  
	   IF NOT EXISTS (SELECT * FROM Horarios Where IDHorario = @Horario)
	     BEGIN
	       RAISERROR ('NO EXISTE EL HORARIO INDICADO', 16, 1)
		   RETURN;
	     END
     
	  IF NOT EXISTS (SELECT * FROM Estados Where IDEstado = @Estado)
	     BEGIN
	       RAISERROR ('NO EXISTE EL ESTADO INDICADO', 16, 1)
		    RETURN;
	     END
	
	IF (@FechaHora<=GETDATE())
	    BEGIN
	       RAISERROR ('LA FECHA DEL TURNO NO ES VALIDA', 16, 1)
		    RETURN;
	     END
     end
	 
   ELSE
    BEGIN
      RAISERROR ('EL USUARIO NO SE ENCUENTRA REGISTRADO O NO TIENE LOS PERMISOS PARA SACAR UN TURNO', 16, 1)
	   RETURN;
    END

	INSERT INTO Turnos (IDMascota,IDHorario,IDEstado,IDVeterinario,FechaHora)
	VALUES (@Mascota,@Horario,@Estado,@Veterinario,@FechaHora)
 END TRY 
 BEGIN CATCH 
  PRINT ERROR_MESSAGE() 
 END CATCH 
END