--- Muestra qué especialidades se dictan en cada sede
--- usando la tabla Horarios como conector entre Sedes y Especialidades.
Create View vw_EspecialidadPorSede AS
Select
		s.NombreSede,					--- Nombre de la sede
		e.Nombre AS Especialidad		--- Nombre especialidad
From Horarios h                         --- Tomo los dato de la tabla Horario
Join Sedes s on h.IDSede = s.IDSede                           --- uno  la tabla sede
join Especialidades e on h.IDEspecialidad = e.IDEspecialidad  --- lo mismo con espescialidad
Group By s.NombreSede, e.Nombre;   --- Agrupo por sede y especialidad para que no se repitan










