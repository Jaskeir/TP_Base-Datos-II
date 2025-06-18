CREATE VIEW vw_VeterinarioPorSede AS  --Creamos Vista VW_VeterianoPorSede
SELECT 
    v.IDVeterinario,
    v.Nombre AS NombreVeterinario,
    v.IDEspecialidad,
    s.IDSede,
    s.NombreSede
FROM 
    Veterinarios v
JOIN Turnos t ON v.IDVeterinario = t.IDVeterinario
JOIN Horarios h ON t.IDHorario = h.IDHorario
JOIN sedes s ON h.IDSede = s.IDSede
GROUP BY 
    v.IDVeterinario, v.Nombre, v.IDEspecialidad, s.IDSede, s.NombreSede;


