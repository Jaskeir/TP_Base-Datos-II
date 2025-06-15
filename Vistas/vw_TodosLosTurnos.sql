--- Muestra todos los turnos con información completa del cliente,
--- la mascota y el veterinario.

Create View vw_TodosLosTurnos AS
Select 
		t.IDTurno,				 -- Tomo el ID unico de turno
		t.FechaHora,			 -- Fecha y hora del turno
		c.Nombre as Cliente,	 -- nombre cliente que pidio el turno
		m.Nombre as Mascota,	 -- nombre mascota que sera atendida
		v.Nombre as Veterinario	 -- nombre veterinario que atndera
FROM Turnos t
Join Mascotas m on t.IDMascota = m.IDMascota
Join Clientes c on m.IDCliente = c.IDCliente
join Veterinarios v on t.IDVeterinario = v.IDVeterinario;
