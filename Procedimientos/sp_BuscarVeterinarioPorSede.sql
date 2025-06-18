CREATE PROCEDURE sp_BuscarVeterinarioPorSede  --CREAMOS PROSEDURE
    @IDSede INT  --PARAMETRO DE ENTRADA ID SEDE
AS
BEGIN
    SELECT 
        v.IDVeterinario,
        v.Nombre AS NombreVeterinario,           --SELECCIONAS COLUMNAS DE VARIAS TABLAS
        v.Dni,
        e.DescripcionEspecialidad,
        s.NombreSede
    FROM 
        VETERINARIOS v
    JOIN 
        TURNOS t ON v.IDVeterinario = t.IDVeterinario     --SE REALIZA CADENA DE JOIN DE VARIAS TABLAS
    JOIN 
        HORARIOS h ON t.IDHorario = h.IDHorario
    JOIN 
        SEDES s ON h.IDSede = s.IDSede
    JOIN 
        ESPECIALIDADES e ON v.IDEspecialidad = e.IDEspecialidad
    WHERE 
        s.IDSede = @IDSede     --FILTRAMOS POR SEDE
    GROUP BY 
        v.IDVeterinario, v.Nombre, v.Dni, e.DescripcionEspecialidad, s.NombreSede  --AGRUPAMOS
    ORDER BY 
        v.Nombre;     --ORDENAMOS POR NOMBRE
END;

-- PRUEBA PARA QUE DEVUELVA TODOS LOS ID SEDE 2

EXEC sp_BuscarVeterinarioPorSede @IDSede = 2;

