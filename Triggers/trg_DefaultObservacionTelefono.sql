--- Completa con el texto “Sin info” el campo Observaciones 
--- si el usuario no cargó nada cuando agregó un teléfono.

CREATE TRIGGER trg_DefaultObservacionTelefono
ON Telefonos
AFTER INSERT
AS
BEGIN
    -- Cambia los campos vacíos o nulos por 'Sin info'
    UPDATE Telefonos
    SET Observaciones = 'Sin info'
    WHERE Observaciones IS NULL OR Observaciones = '';
END;

------------------------------------------------------
--- Ejemplos para ver el funcionamiento del trigger
------------------------------------------------------

INSERT INTO Telefonos(IDUsuario, Telefono, Observaciones)
VALUES (1, '1122113344', NULL);