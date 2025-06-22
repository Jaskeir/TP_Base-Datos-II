CREATE VIEW vw_Clientes AS
SELECT C.DNI, C.Nombre, C.Domicilio, M.IDMascota ,M.Nombre AS 'Nombre Mascota', M.Especie, T.Telefono, T.Observaciones
FROM Clientes C 
INNER JOIN Mascotas M ON C.IDCliente = M.IDCliente
INNER JOIN Telefonos T ON C.IDUsuario = T.IDUsuario;--cambio a tabla TELEFONOS y se debe comparar el IDUsuario