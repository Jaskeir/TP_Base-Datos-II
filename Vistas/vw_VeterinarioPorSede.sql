CREATE VIEW vw_VeterinarioPorSede AS
SELECT 
    v.IDVeterinario,
    v.Nombre AS NombreVeterinario,
    v.IDEspecialidad,
    s.IDSede,
    s.NombreSede
FROM 
    VETERINARIOS v
JOIN 
    TURNOS t ON v.IDVeterinario = t.IDVeterinario
JOIN 
    HORARIOS h ON t.IDHorario = h.IDHorario
JOIN 
    SEDES s ON h.IDSede = s.IDSede
GROUP BY 
    v.IDVeterinario, v.Nombre, v.IDEspecialidad, s.IDSede, s.NombreSede;