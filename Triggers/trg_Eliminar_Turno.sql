CREATE TRIGGER trg_Eliminar_Turno ON Turnos 
INSTEAD OF DELETE 
AS 
BEGIN 
 Declare @Cancelado int;
-- Se busca y asigna el ID que corresponde al estado Cancelado 
set @Cancelado = (SELECT IdEstado FROM Estados WHERE Estado= 'Cancelado');
UPDATE Turnos SET IDEstado = @Cancelado WHERE IDTurno IN (SELECT IDTurno FROM deleted);
END

