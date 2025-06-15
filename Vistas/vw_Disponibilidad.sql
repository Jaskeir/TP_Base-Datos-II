CREATE VIEW vw_Disponibilidad_Especialidades_Veterinarios AS
SELECT H.DiaSemana, H.HoraDesde, H.HoraHasta, H.IDSede, s.DireccionSede,H.IDEspecialidad,E.Nombre as Especialidad, E.DescripcionEspecialidad , V.IDVeterinario, V.Nombre as 'Nombre Veterinario'
FROM Horarios H 
INNER JOIN Sedes S ON H.IDSede = S.IDSede
INNER JOIN Especialidades E ON H.IDEspecialidad = E.IDEspecialidad
INNER JOIN Veterinarios V ON H.IDEspecialidad = V.IDEspecialidad;