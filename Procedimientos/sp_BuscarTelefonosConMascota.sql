-- Busco Telefonos usando IDMascota
CREATE PROCEDURE sp_BuscarTelefonosConMascota(@Id int)AS
BEGIN
	SELECT Telefono, Observaciones FROM vw_Clientes
	WHERE IDMascota = @Id
END