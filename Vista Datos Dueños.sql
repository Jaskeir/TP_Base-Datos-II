CREATE VIEW VW_DUE�OS AS
SELECT
 d.DNI ,d.Nombre, d.Domicilio ,m.Nombre As 'Nombre Mascota',m.Especie,t.Telefono,t.Observaciones
FROM Due�os d 
INNER JOIN 
Mascotas m ON d.IDDue�os = m.IDDue�os
INNER JOIN 
TelefonosDue�os t ON m.IDMascota= t.IDMascota;