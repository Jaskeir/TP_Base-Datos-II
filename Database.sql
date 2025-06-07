Create Database VETERINARIA
Go
Use VETERINARIA
Go

Create Table Sedes(
  IDSede int not null primary key identity(1, 1),
  Direccion varchar(100) not null,
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

Create Table HorariosVeterinaria(
  IDHorario int not null primary key references Horarios(IDHorario),
  IDVeteriantio int not null foreign key references Veterinarios(IDVeteriantio)
)

Create Table Especialidades(
  IDEspecialidad int not null primary key identity(1, 1),
  Nombre varchar(20) not null,
  Descripcion varchar(150) not null
)
Go

Create Table Turnos(
  IDTurno int not null primary key identity (1, 1),
  Fecha datetime not null,
  IDVeteriantio int not null foreign key references Veterinarios(IDVeteriantio),
  IDMascota int not null foreign key references Mascotas(IDMascota),
  IDEspecialidad int not null foreign key references Especialidades(IDMascota),
  IDTelefono int not null,
  Observaciones Varchar(20) not null
)
Go

Create Table Veterinarios(
  IDVeteriantio int not null primary key identity (1, 1),
  DNI varchar(8) not null,
  Nombre varchar(50) not null,
  -- Domicilio varchar(80) not null, Nececito realmente el domicilio?
  Email varchar(80) not null
)
Go

Create Table TelefonosVeterinarios(
  IDVeteriantio int not null primary key references Veterinarios(IDVeteriantio),
  Telefono varchar(20) not null,
)
Go

Create Table Mascotas(
  IDMascota int not null primary key identity (1, 1),
  Nombre varchar(50) not null,
  Especie varchar(50) not null,
  --Habitat???
  IDDueño int not null foreign key references Dueños(IDDueño),
)
Go

Create Table Dueños(
  IDCliente int not null primary key identity (1, 1),
  DNI varchar(8) not null,
  Nombre varchar(50) not null,
  Domicilio varchar(80) not null,
  Email varchar(80) not null
)
Go

Create Table TelefonosDueños(
  IDDueño int not null primary key,
  Telefono varchar(20) not null,
)
Go
