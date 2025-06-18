Create Database VETERINARIA
Go
Use VETERINARIA
Go

Create Table Sedes(
	IDSede int primary key not null identity(1,1),
	DireccionSede varchar(100) not null,
	NombreSede varchar(100) not null,
	Telefono varchar(50)
) 

Create table Permisos(
	IDPermiso int primary key not null identity(1,1),
	Nombre varchar(20) not null
)

Create Table Usuarios(
	IDUsuario int primary key not null identity(1,1),
	IDPermiso int  not null foreign key references Permisos(IDPermiso),
	Email varchar(100) not null,
	Clave varchar(50) not null
)

Create Table Telefonos(
	IDTelefono int not null primary key identity(1,1),
	IDUsuario int not null foreign key references Usuarios(IDUsuario),
	Telefono varchar(20) not null,
	Observaciones varchar(20)
)

Create Table Administradores(
	IDAdministrador int primary key not null identity(1,1),
	IDUsuario int not null foreign key references Usuarios(IDUsuario),
	Nombre varchar(50) not null
)

Create Table Especialidades(
	IDEspecialidad int not null primary key identity(1,1),
	Nombre varchar(20) not null,
	DescripcionEspecialidad varchar (100)
)

Create Table Veterinarios(
	IDVeterinario int primary key not null identity(1,1),
	IDUsuario int not null foreign key references Usuarios(IDUsuario),
	Dni varchar(50) not null,
	Nombre varchar(50),
	IDEspecialidad int not null foreign key references Especialidades(IDEspecialidad) 
)

Create Table Horarios(
	IDHorario int primary key not null identity(1,1),
	DiaSemana varchar(15) not null,
	HoraDesde time not null,
	HoraHasta time not null,
	DuracionConsulta int not null,
	IDSede int not null foreign key references Sedes(IDSede),
	IDEspecialidad int not null foreign key references Especialidades(IDEspecialidad)
)

Create Table Clientes(
	IDCliente int not null primary key identity(1,1),
	IDUsuario int not null foreign key references Usuarios(IDUsuario),
	Dni varchar(20) not null,
	Nombre varchar(50) not null,
	Domicilio varchar(100) not null
)

Create Table Mascotas(
	IDMascota int not null primary key identity(1,1),
	IDCliente int not null foreign key references Clientes(IDCliente),
	Nombre varchar(50) not null,
	Especie varchar(50) not null
)
   
Create Table Estados(
	IDEstado int not null primary key identity(1,1),
	Estado varchar(50) not null
)

Create Table Turnos(
	IDTurno int not null primary key identity(1,1),
	IDMascota int not null foreign key references Mascotas(IDMascota),
	IDHorario int not null foreign key references Horarios(IDHorario),
	IDEstado int not null foreign key references Estados(IDEstado),
	IDVeterinario int not null foreign key references Veterinarios(IDVeterinario),
	FechaHora datetime not null
)