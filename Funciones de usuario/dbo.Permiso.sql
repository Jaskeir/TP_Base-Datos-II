CREATE FUNCTION dbo.Permiso(@permisorequerido int,@idUser int) --el suario tiene permiso para realizar la operacion devuelve 1 sino 0
RETURNS INT 
AS 
BEGIN 
DECLARE @AUX INT;
--Verificamos si encuentra algun usuario con ese ID, si encuentra asigna a AUX un 1 sino un 0 
set @AUX=(SELECT COUNT (IDUsuario) FROM Usuarios Where IDUsuario=@idUser)

 IF (@AUX =1 )--Si el usuario existe paso a verificar los permisos 

 BEGIN 
   SET @AUX  = (SELECT IdPermiso FROM Usuarios Where IDUsuario=@idUser); --Seteo Aux con el valor del permiso del usuario 
   IF (@AUX = @permisorequerido) --Comparo que el permiso requerido y el del usuario sean iguales
   BEGIN 
       SET @AUX =1; 
   END; 
   else
   BEGIN 
      SET @AUX =0; 
   END;
 end;
 RETURN @AUX; 
END;
