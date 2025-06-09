Create Database VETERINARIA
Go
Use VETERINARIA
Go

Create Table Sedes(
  IDSede int not null primary key identity(1, 1),
  Direccion varchar(100) not null,
)
Go
Create Table Especialidades(
  IDEspecialidad int not null primary key identity(1, 1),
  Nombre varchar(20) not null,
  Descripcion varchar(150) not null
)
Go
Create Table Horarios(
  IDHorario int not null primary key identity (1, 1),
  Fecha datetime not null,
  HoraDesde time not null,
  HoraHasta time not null,
  IDSede int not null foreign key references Sedes(IDSede),
  IDEspecialidad int not null foreign key references Especialidades(IDEspecialidad)
)
Go


Create Table Veterinarios(
  IDVeterinario int not null primary key identity (1, 1),
  DNI varchar(8) not null,
  Nombre varchar(50) not null,
  Email varchar(80) not null
)
Go
Create Table HorariosVeterinaria(
	ID int not null primary key identity (1, 1),
  IDHorario int not null foreign key references Horarios(IDHorario),
  IDVeterinario int not null foreign key references Veterinarios(IDVeterinario)
)
Go

Create Table TelefonosVeterinarios(
  IDVeterinario int not null primary key references Veterinarios(IDVeterinario),
  Telefono varchar(20) not null,
)
Go

Create Table Dueños(
    IDDueños int not null primary key identity (1, 1),
    DNI varchar(8) not null,
    Nombre varchar(50) not null,
    Domicilio varchar(80) not null,
)
Go
Create Table Mascotas(
    IDMascota int not null primary key identity (1, 1),
    Nombre varchar(50) not null,
    Especie varchar(50) not null,
    IDDueños int not null foreign key references Dueños(IDDueños),
)
Go
Create Table TelefonosDueños(
    IDTelefono int not null primary key identity (1, 1),
    IDMascota int not null foreign key references Mascotas(IDMascota),
    Telefono varchar(10) not null,   
    Observaciones Varchar(20) not null,
   )
Go
Create Table Turnos(
  IDTurno int not null primary key identity (1, 1),
  Fecha datetime not null,
  IDVeterinario int not null foreign key references Veterinarios(IDVeterinario),
  IDMascota int not null foreign key references Mascotas(IDMascota),
  IDEspecialidad int not null foreign key references Especialidades(IDEspecialidad),
  IDTelefono int not null,
  Observaciones Varchar(20) not null
)


------------------------------------------------------------------------------------
--- COPIADO DE DRAW

Table ESPECIALIDADES {
	IDEspecialidad integer [ pk, increment, not null, unique ]
	DescripcionEspecialidad varchar [ not null ]
}

Table CLIENTES {
	IDCliente integer [ pk, increment, not null, unique ]
	IDUsuario integer [ not null ]
	Dni varchar [ not null ]
	Nombre varchar [ not null ]
	Domicilio varchar [ not null ]
	Email varchar [ not null ]
}

Table TELEFONOS_CLIENTE {
	IDTelefonoCliente integer [ pk, increment, not null, unique ]
	IDCliente integer [ not null ]
	Telefono varchar [ not null ]
	Observaciones varchar
}

Table MASCOTAS {
	IDCliente integer [ not null ]
	IDMascota integer [ pk, increment, not null, unique ]
	Nombre varchar [ not null ]
	Especie varchar [ not null ]
}

Table VETERINARIOS {
	IDVeterinario integer [ pk, increment, not null, unique ]
	IDUsuario integer [ not null ]
	Dni varchar [ not null ]
	Nombre varchar [ not null ]
	Email varchar [ not null ]
	IDEspecialidad integer [ not null ]
}

Table TELEFONOS_VETERINARIO {
	IDTelefonoVeterinario integer [ pk, increment, not null, unique ]
	IDVeterinario integer [ not null ]
	Telefono varchar [ not null ]
	Observaciones varchar
}

Table SEDES {
	IDSede integer [ pk, increment, not null, unique ]
	DireccionSede varchar [ not null ]
	NombreSede varchar [ not null ]
}

Table HORARIOS {
	IDHorario integer [ pk, increment, not null, unique ]
	DiaSemana varchar [ not null ]
	HoraDesde time [ not null ]
	HoraHasta time [ not null ]
	IDSede integer [ not null ]
	IDEspecialidad integer [ not null ]
	DuracionConsulta integer [ not null ]
}

Table TURNOS {
	IDTurno integer [ pk, increment, not null, unique ]
	IDMascotas integer [ not null ]
	IDHorario integer [ not null ]
	IDEstado integer [ not null ]
	FechaHora datetime [ not null ]
	IDVeterinario integer [ not null ]
}

Table USUARIOS {
	IDUsuario integer [ pk, increment, not null, unique ]
	Email varchar [ not null ]
	Contraseña varchar [ not null ]
}

Table ESTADOS {
	IDEstado integer [ pk, increment, not null, unique ]
	Estado varchar [ not null ]
}
