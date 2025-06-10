CREATE VIEW vw_Clientes AS
SELECT C.DNI, C.Nombre, C.Domicilio, M.Nombre AS 'Nombre Mascota', M.Especie, T.Telefono, T.Observaciones
FROM Clientes C 
INNER JOIN Mascotas M ON d.IDDueños = m.IDDueños
INNER JOIN TelefonosCliente T ON M.IDMascota = T.IDMascota;
