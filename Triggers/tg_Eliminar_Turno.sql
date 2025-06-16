CREATE TRIGGER tr_Eliminar_Turno ON Turnos 
INSTEAD OF DELETE 
AS 
BEGIN 
Declare @Cancelado int;
set @Cancelado = (select IdEstado from Estados where Estado= 'Cancelado');
UPDATE Turnos SET IDEstado = @Cancelado WHERE IDTurno IN (SELECT IDTurno FROM deleted);
END