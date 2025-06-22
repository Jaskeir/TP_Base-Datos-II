CREATE TRIGGER trg_ValidacionDatosTelefonoON TelefonosINSTEAD OF INSERTASBEGINdeclare @Observaciones varchar(20);	-- Validar si el teléfono ya existe en la tabla	IF EXISTS (		SELECT 1		FROM Telefonos t		JOIN inserted i ON t.Telefono = i.Telefono	)	BEGIN		RAISERROR('Ese número de teléfono ya está registrado.', 16, 1);		ROLLBACK TRANSACTION;		RETURN;	END	IF ((SELECT Observaciones FROM inserted) IS NULL OR (SELECT Observaciones FROM inserted) = '')
	   begin
	   SET @Observaciones = 'Sin información'
	   end
	   else
	   begin 
	   SET @Observaciones = (SELECT Observaciones FROM inserted )
	   end		INSERT INTO Telefonos(IDUsuario, Telefono, Observaciones)
VALUES
       ((SELECT IDUsuario FROM inserted),(SELECT Telefono FROM inserted ),@Observaciones)		END;