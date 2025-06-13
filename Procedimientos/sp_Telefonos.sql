CREATE PROCEDURE sp_Telefonos( @Id int  )AS 
BEGIN 
SELECT Telefono, Observaciones FROM vw_Clientes 
WHERE IDMascota = @Id 
END