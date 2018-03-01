drop TABLE UsoCFDI;
drop TABLE Donadores;
drop TABLE MetodoPago;
drop TABLE PlantillaDeCorreo;
drop TABLE Funcion;
drop TABLE Rol;
drop TABLE Usuario;
drop TABLE Noticia;
drop TABLE Comentario;
drop TABLE ArchivoMultimedia;
drop TABLE Thumbnail;
drop TABLE Evento;

--RELACIONES N-N

drop TABLE Donadores_UsoCFDI;
drop TABLE Donadores_MetodoPago;
drop TABLE Rol_Funcion;
drop TABLE Usuario_Rol;
drop TABLE Usuario_Noticia;

--------------------------------------Table creation----------------------------------------------

CREATE TABLE UsoCFDI
(
IdCFDI char(3) not null constraint pkIdCFDI PRIMARY KEY,
Nombre text
)

CREATE TABLE Donadores
(
RFC varchar(13),
Nombre varchar(50),
ApellidoPaterno varchar(50),
ApellidoMaterno varchar(50),
FechadeNacimiento DATETIME,
Direccion text,
Telefono varchar(15),
Email varchar(254) not null constraint pkEmail PRIMARY KEY,
Ocupacion varchar(100),
Validado bit
)

CREATE TABLE MetodoPago
(
IdMetodo char(20) not null constraint pkIdMetodo PRIMARY KEY,
Descripcion text
)

CREATE TABLE PlantillaDeCorreo
(
IdCorreo char(4) not null constraint pkIdCorreo PRIMARY KEY,
Asunto varchar(50),
Contenido text,
Fecha DATETIME
)

CREATE TABLE Funcion
(
IdFuncion char(4) not null constraint pkIdFuncion PRIMARY KEY,
Nombre text
)

CREATE TABLE Rol
(
IdRol char(3) not null constraint pkIdRol PRIMARY KEY,
Nombre text
)

CREATE TABLE Usuario
(
Username varchar(10) not null constraint pkUsername PRIMARY KEY,
Pswd varchar(20)
)

CREATE TABLE Noticia
(
IdNoticia char(5) not null constraint pkIdNoticia PRIMARY KEY,
Titulo text,
Cuerpo text,
Fecha DATETIME
)

CREATE TABLE Comentario
(
IdComentario char(7) not null constraint pkIdComentario PRIMARY KEY,
Comentario text,
Autor varchar(57),
Fecha DATETIME,
IdNoticia char(5)
)

CREATE TABLE ArchivoMultimedia
(
Filepath varchar(900) not null constraint pkFilepath PRIMARY KEY,
Nombre varchar(50),
Fecha DATETIME,
IdNoticia char(5),
ThumbnailUrl varchar(900)
)

CREATE TABLE Thumbnail
(
Thurl varchar(900) not null constraint pkThurl PRIMARY KEY
)

CREATE TABLE Evento
(
IdEvento char(4) not null constraint pkIdEvento PRIMARY KEY,
Nombre text,
Fecha DATETIME,
Lugar text,
Descripcion text
)

--RELACIONES N-N

CREATE TABLE Donadores_UsoCFDI
(
IdCFDI char(3) not null constraint fkIdCFDI FOREIGN KEY references UsoCFDI(IdCFDI),
Email varchar(254) not null constraint fkEmail FOREIGN KEY references Donadores(Email),
Fecha DATETIME
)

CREATE TABLE Donadores_MetodoPago
(
IdMetodo char(20) not null constraint fkIdMetodo FOREIGN KEY references MetodoPago(IdMetodo),
Email varchar(254) not null constraint fkCorreo FOREIGN KEY references Donadores(Email),
Fecha DATETIME,
Observaciones text
)

CREATE TABLE Rol_Funcion
(
IdFuncion char(4) not null constraint fkIdFuncion FOREIGN KEY references Funcion(IdFuncion),
IdRol char(3) not null constraint fkIdRol FOREIGN KEY references Rol(IdRol)
)

CREATE TABLE Usuario_Rol
(
Username varchar(10) not null constraint fkUsername FOREIGN KEY references Usuario(Username),
IdRol char(3) not null constraint fkRol FOREIGN KEY references Rol(IdRol),
Fecha DATETIME
)

CREATE TABLE Usuario_Noticia
(
IdNoticia char(5) not null constraint fkIdNoticia FOREIGN KEY references Noticia(IdNoticia),
Username varchar(10) not null constraint fkUser FOREIGN KEY references Usuario(Username),
Fecha DATETIME
)

---------------------------------------------DB FILL--------------------------------------------

SELECT *
FROM sys.tables