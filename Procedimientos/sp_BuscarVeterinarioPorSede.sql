CREATE PROCEDURE sp_BuscarVeterinarioPorSede
    @IDSede INT
AS
BEGIN
    SELECT 
        v.IDVeterinario,
        v.Nombre AS NombreVeterinario,
        v.Dni,
        e.DescripcionEspecialidad,
        s.NombreSede
    FROM 
        VETERINARIOS v
    JOIN 
        TURNOS t ON v.IDVeterinario = t.IDVeterinario
    JOIN 
        HORARIOS h ON t.IDHorario = h.IDHorario
    JOIN 
        SEDES s ON h.IDSede = s.IDSede
    JOIN 
        ESPECIALIDADES e ON v.IDEspecialidad = e.IDEspecialidad
    WHERE 
        s.IDSede = @IDSede
    GROUP BY 
        v.IDVeterinario, v.Nombre, v.Dni, e.DescripcionEspecialidad, s.NombreSede
    ORDER BY 
        v.Nombre;
END;

EXEC sp_BuscarVeterinarioPorSede @IDSede = 2;

SELECT * FROM dbo.TURNOS;
