--- Evita que un turno se agende fuera del rango horario permitido.
CREATE TRIGGER trg_ValidarTurnoDentroDeHorario
ON Turnos
AFTER INSERT
AS
BEGIN
    -- Verifica si el turno insertado está fuera del horario o mal posicionado según la duración
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN Horarios h ON i.IDHorario = h.IDHorario
        WHERE 
            CAST(i.FechaHora AS TIME) < h.HoraDesde OR              -- antes del inicio
            CAST(i.FechaHora AS TIME) >= h.HoraHasta OR             -- después del final
            DATEDIFF(MINUTE, h.HoraDesde, CAST(i.FechaHora AS TIME)) % h.DuracionConsulta <> 0  -- no respeta intervalo
    )
    BEGIN
        RAISERROR('El turno está fuera del horario o no respeta el intervalo de duración.', 16, 1);
        ROLLBACK;
    END
END;

------------------------------------------------------
--- Ejemplos para ver el funcionamiento del trigger
------------------------------------------------------

INSERT INTO Turnos (IDMascota, IDHorario, IDEstado, IDVeterinario, FechaHora)
VALUES (2, 1, 1, 1, '2025-06-30T08:30:00'); -- Lunes, cada 30 minutos desde 08:00 a 12:00

INSERT INTO Turnos (IDMascota, IDHorario, IDEstado, IDVeterinario, FechaHora)
VALUES (3, 1, 1, 1, '2025-06-30T08:10:00');
INSERT INTO Turnos (IDMascota, IDHorario, IDEstado, IDVeterinario, FechaHora)
VALUES (4, 1, 1, 1, '2025-06-30T12:30:00');