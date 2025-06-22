CREATE FUNCTION dbo.Permiso(@permisorequerido int,@idUser int)
--si el suario no existe o no tiene permiso para realizar la operacion devuelve 0 sino 1
RETURNS INT 
AS 
BEGIN 
DECLARE @AUX INT;
IF NOT EXISTS(SELECT * FROM Usuarios Where IDUsuario = @idUser)
 BEGIN
	set @AUX=0;
	RETURN @AUX ;
 END
 SET @AUX  = (SELECT IDPermiso FROM Usuarios Where IDUsuario = @idUser); --Seteo del Aux con el valor del permiso del usuario 
   IF (@AUX = @permisorequerido) --Comparación de que el permiso requerido y el del usuario sean iguales
   BEGIN 
       SET @AUX = 1; 
   END; 
   ELSE
   BEGIN 
      SET @AUX = 0; 
   END;

 RETURN @AUX; 
END;