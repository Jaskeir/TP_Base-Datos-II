--- Evita que dos usuarios tengan el mismo email. 

CREATE TRIGGER trg_ValidarEmailUnico
ON Usuarios
INSTEAD OF INSERT
AS
BEGIN
    -- Si el mail ya existe, se cancela
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN Usuarios u ON i.Email = u.Email
    )
    BEGIN
        RAISERROR('El email ya está registrado en el sistema.', 16, 1);
        RETURN;
    END

    -- Si no hay problema, inserta normalmente
    INSERT INTO Usuarios (IDPermiso, Email, Password)
    SELECT IDPermiso, Email, Password FROM inserted;
END;

------------------------------------------------------
--- Ejemplos para ver el funcionamiento del trigger
------------------------------------------------------
INSERT INTO Usuarios(IDPermiso, Email, Password)
VALUES (3, 'nuevo_usuario@vet.com', 'clave123');

