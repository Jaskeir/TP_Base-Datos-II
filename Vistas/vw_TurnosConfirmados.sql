--- Filtra la información para mostrar solo los turnos que están confirmados
Create View vw_TurnosConfirmados AS
Select
		t.IDturno,
		t.FechaHora,
		c.Nombre AS Cliente,
		m.Nombre AS Mascota,
		v.Nombre AS Veterinario
From Turnos t
Join Mascotas m on t.IDMascota = m.IDMascota
Join Clientes c on m.IDCliente = c.IDCliente
Join Veterinarios v on t.IDVeterinario = v.IDVeterinario
Join Estados e on t.IDEstado = e.IDEstado
Where e.Estado = 'Confirmado';