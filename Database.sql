Create Database VETERINARIA
Go
Use VETERINARIA
Go

Create Table Sedes(
  IDSede int not null primary key identity(1, 1),
  Nombre varchar(50) not null,
  Direccion varchar(100) not null
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
  DiaSemana varchar(10) not null,
  HoraDesde time not null,
  HoraHasta time not null,
  IDSede int not null foreign key references Sedes(IDSede),
  IDEspecialidad int not null foreign key references Especialidades(IDEspecialidad)
  DuracionConsulta int not null
)
Go

Create Table Veterinarios(
  IDVeterinario int not null primary key identity (1, 1),
  IDEspecialidad int not null foreign key references Especialidades(IDEspecialidad),
  IDUsuario int not null foreign key references Usuarios(IDUsuario),
  DNI varchar(8) not null,
  Nombre varchar(50) not null,
  Email varchar(80) not null
)
Go

Create Table HorariosVeterinaria( -- Deberia existir esta tabla?
  ID int not null primary key identity (1, 1),
  IDHorario int not null foreign key references Horarios(IDHorario),
  IDVeterinario int not null foreign key references Veterinarios(IDVeterinario)
)
Go

Create Table TelefonosVeterinario(
  IDTelefonosVeterinario int not null primary key identity (1, 1), 
  IDVeterinario int not null foreign key references Veterinarios(IDVeterinario),
  Telefono varchar(20) not null,
)
Go

Create Table Clientes(
    IDCliente int not null primary key identity (1, 1),
    IDUsuario int not null foreign key references Usuarios(IDUsuario),
    DNI varchar(8) not null,
    Nombre varchar(50) not null,
    Email varchar(100) not null,
    Domicilio varchar(80) not null
)
Go
Create Table TelefonosCliente(
    IDTelefonosCliente int not null primary key identity (1, 1),
    IDCliente int not null foreign key references Clientes(IDCliente),
    Telefono varchar(15) not null,
    Observaciones varchar(20),
   )
Go
Create Table Mascotas(
    IDMascota int not null primary key identity (1, 1),
    IDCliente int not null foreign key references Clientes(IDCliente),
    Nombre varchar(50) not null,
    Especie varchar(50) not null
)
Go

Create Table Turnos(
  IDTurno int not null primary key identity (1, 1),
  IDVeterinario int not null foreign key references Veterinarios(IDVeterinario),
  IDMascota int not null foreign key references Mascotas(IDMascota),
  IDHorario int not null foreign key references Horarios(IDHorario),
  IDEstado int not null foreign key references Estados(IDEstado),
  FechaYHora datetime not null
)

Create Table Usuarios(
  IDUsuario int not null primary key identity (1, 1),
  Password varchar(100) not null
)

Create Table Estados(
  IDEstado int not null primary key identity (1, 1),
  Estado varchar (30) not null
)

-----------------------------------
---	COPIADO DE DRAW		--- 
-----------------------------------
Table SEDES {
	IDSede integer [ pk, increment, not null, unique ]
	DireccionSede varchar [ not null ]
	NombreSede varchar [ not null ]
}

Table ESPECIALIDADES {
	IDEspecialidad integer [ pk, increment, not null, unique ]
	DescripcionEspecialidad varchar [ not null ]
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
	IDMascota integer [ pk, increment, not null, unique ]
	IDCliente integer [ not null ]
	Nombre varchar [ not null ]
	Especie varchar [ not null ]
}

Table TURNOS {
	IDTurno integer [ pk, increment, not null, unique ]
	IDVeterinario integer [ not null ]
	IDMascotas integer [ not null ]
	IDHorario integer [ not null ]
	IDEstado integer [ not null ]
	FechaHora datetime [ not null ]
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
