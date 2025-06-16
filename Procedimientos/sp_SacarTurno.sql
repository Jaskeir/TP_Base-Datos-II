CREATE PROCEDURE sp_SacarTurno(@idUsuario int,@Mascota int ,@Horario int ,
	@Estado int ,@Veterinario int ,@FechaHora datetime ) 
AS
BEGIN --Comenzamos con el manejo de errores
  BEGIN TRY 
   DECLARE @AUX INT;

   Declare @PermisoRequerido int;
--solo pueden sacar turno los clientes
   set @PermisoRequerido=(select IDPermiso From Permisos where Nombre='Cliente');
   set @AUX =dbo.Permiso(@PermisoRequerido,@idUsuario)
--se chequea que exista el usuario y tenga los permisos
    IF (@AUX  =1 )
     BEGIN 
      DECLARE @DNIUser varchar(20);
	  DECLARE @DNIveterinario varchar(20);

      set @DNIUser=(select Dni from Clientes where IDUsuario=@idUsuario)
	  set @AUX=(SELECT COUNT (IDVeterinario) FROM VeterinarioS Where IDVeterinario=@Veterinario)
	  IF (@AUX=1)
	    BEGIN
	    set @DNIveterinario=(select Dni from Veterinarios where IDVeterinario=@Veterinario)
	     if (@DNIUser=@DNIveterinario)
          begin
           RAISERROR ('NO PUEDE SACAR UN TURNO PARA SI MISMO O EL VETERINARIO', 16, 1)
          end
	   END
	  ELSE
	   BEGIN
	     RAISERROR ('NO EXISTE UN VETERINARIO REGISTRADO CON ESE ID', 16, 1)
	   END

	  set @AUX=(SELECT COUNT (IDMascota) FROM Mascotas Where IDMascota=@Mascota)
	    IF (@AUX=0)
	     BEGIN
	       RAISERROR ('NO EXISTE UNA MASCOTA REGISTRADA CON ESE ID', 16, 1)
	     END
	  set @AUX=(SELECT COUNT (IDHorario) FROM Horarios Where IDHorario=@Horario)
	   IF (@AUX=0)
	     BEGIN
	       RAISERROR ('NO EXISTE EL HORARIO INDICADO', 16, 1)
	     END

      set @AUX=(SELECT COUNT (IDEstado) FROM Estados Where IDEstado=@Estado)
	   IF (@AUX=0)
	     BEGIN
	       RAISERROR ('NO EXISTE EL ESTADO INDICADO', 16, 1)
	     END
	
     end
   else
    begin
      RAISERROR ('EL USUARIO NO SE ENCUENTRA REGISTRADO O NO TIENE LOS PERMISOS PARA SACAR UN TURNO', 16, 1)
    end

	INSERT INTO Turnos (IDMascota,IDHorario ,IDEstado ,
	IDVeterinario,FechaHora)
	Values (@Mascota ,@Horario,@Estado,@Veterinario,@FechaHora)
 END TRY 
 BEGIN CATCH 
  PRINT ERROR_MESSAGE() 
 END CATCH 
END
