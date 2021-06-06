create database PruebaTecnica_CD;

create table TiposIdentificacion(id_tipo serial primary key, name varchar(20) not null);

create table Roles(id_rol serial primary key, nombre varchar(20) not null);

create table Personas(id_persona serial primary key, nombre text not null, apellidos
text not null, id_tipo int not null, identificacion text not null, correo text
not null, password text not null, celular text not null, id_rol int not null,
foreign key (id_tipo) references TiposIdentificacion(id_tipo) on delete cascade
on update cascade, foreign key (id_rol) references Roles(id_rol) on delete cascade
on update cascade);
