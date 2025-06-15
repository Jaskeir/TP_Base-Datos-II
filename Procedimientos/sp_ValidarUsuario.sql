CREATE PROCEDURE sp_ValidarUsuario(@idUsuario int ) 
AS
BEGIN --Comenzamos con el manejo de errores
BEGIN TRY 
 DECLARE @AUX INT;
 --Verificamos si encuentra algun usuario con ese ID 
set @AUX=(SELECT COUNT (IDUsuario) FROM Usuarios Where IDUsuario=@idUsuario)

--Si no encuentra se informa que no es usuario existente 
 IF (@AUX =0 )
 BEGIN 
 RAISERROR ('EL USUARIO NO SE ENCUENTRA REGISTRADO', 16, 1)   
 end

 END TRY 
 BEGIN CATCH 
 PRINT ERROR_MESSAGE() 
 END CATCH 
 
 END

