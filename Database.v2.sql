Create Database VETERINARIA
Go
Use VETERINARIA
Go

Create Table Sedes(
  IDSede int not null primary key identity(1, 1),
  Nombre varchar(50) not null,
  Direccion varchar(100) not null,
)
Go
Create Table Usuarios(
  IDUsuario int not null primary key identity (1, 1),
   Email varchar(100) not null,
  Password varchar(100) not null,
)
Go
Create Table Especialidades(
  IDEspecialidad int not null primary key identity(1, 1),
  Nombre varchar(20) not null,
  Descripcion varchar(150) not null,
)
Go

Create Table Horarios(
  IDHorario int not null primary key identity (1, 1),
  DiaSemana varchar(10) not null,
  HoraDesde time not null,
  HoraHasta time not null,
  IDSede int not null foreign key references Sedes(IDSede),
  IDEspecialidad int not null foreign key references Especialidades(IDEspecialidad),
  DuracionConsulta int not null,
)
Go

Create Table Veterinarios(
  IDVeterinario int not null primary key identity (1, 1),
  IDEspecialidad int not null foreign key references Especialidades(IDEspecialidad),
  IDUsuario int not null foreign key references Usuarios(IDUsuario),
  DNI varchar(8) not null,
  Nombre varchar(50) not null,
)
Go



Create Table TelefonosVeterinario(
  IDTelefonosVeterinario int not null primary key identity (1, 1), 
  IDVeterinario int not null foreign key references Veterinarios(IDVeterinario),
  Telefono varchar(20) not null,
  Observaciones varchar(20),
)
Go

Create Table Clientes(
    IDCliente int not null primary key identity (1, 1),
    IDUsuario int not null foreign key references Usuarios(IDUsuario),
    DNI varchar(8) not null,
    Nombre varchar(50) not null,
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

Create Table Estados(
  IDEstado int not null primary key identity (1, 1),
  Estado varchar (30) not null,
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




