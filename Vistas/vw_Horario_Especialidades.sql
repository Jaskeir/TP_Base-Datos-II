CREATE VIEW vw_Horarios_Especialidades AS
SELECT H.DiaSemana, H.HoraDesde, H.HoraHasta, H.IDSede, s.DireccionSede,H.IDEspecialidad,E.Nombre as Especialidad, E.DescripcionEspecialidad
FROM Horarios H 
INNER JOIN Sedes S ON H.IDSede = S.IDSede
INNER JOIN Especialidades E ON H.IDEspecialidad = E.IDEspecialidad
