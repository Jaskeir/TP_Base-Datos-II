--- Evita insertar un turno para la misma mascota en el mismo horario.
CREATE TRIGGER trg_EvitarTurnosDuplicados
ON Turnos
INSTEAD OF INSERT
AS
BEGIN
    -- Verificamos si ya existe un turno igual (misma mascota, horario y fecha)
    IF (
        SELECT COUNT(*) 
        FROM Turnos t
        JOIN inserted i ON t.IDMascota = i.IDMascota
                       AND t.IDHorario = i.IDHorario
                       AND t.FechaHora = i.FechaHora
    ) > 0
    BEGIN
        RAISERROR('Ya existe un turno para esta mascota en ese horario y fecha.', 16, 1);
        RETURN;
    END

    -- Si no hay conflicto, se permite el insert
    INSERT INTO Turnos (IDMascota, IDHorario, IDEstado, IDVeterinario, FechaHora)
    SELECT IDMascota, IDHorario, IDEstado, IDVeterinario, FechaHora
    FROM inserted;
END;

------------------------------------------------------
--- Ejemplos para ver el funcionamiento del trigger
------------------------------------------------------

SELECT * FROM Turnos;
-- Turno nuevo: distinto horario o mascota → debería funcionar
INSERT INTO Turnos (IDMascota, IDHorario, IDEstado, IDVeterinario, FechaHora)
VALUES (2, 2, 1, 2, '2025-07-01 10:00:00');

SELECT * FROM Turnos WHERE IDMascota = 2 AND IDHorario = 2 AND FechaHora = '2025-07-01 10:00:00';

-- Mismo que el IDTurno 1: debería FALLAR
INSERT INTO Turnos (IDMascota, IDHorario, IDEstado, IDVeterinario, FechaHora)
VALUES (1, 1, 1, 1, '2025-06-20T09:00:00');

-- Mismo horario, mismo día, pero otra mascota → debería funcionar
INSERT INTO Turnos (IDMascota, IDHorario, IDEstado, IDVeterinario, FechaHora)
VALUES (3, 1, 1, 1, '2025-me06-20T09:00:00');