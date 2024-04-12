drop database if exists sistema;
CREATE DATABASE sistema;

use sistema;

create table Profesional (
	id INTEGER(11),
	nombre VARCHAR(30), 
	apellido VARCHAR(30), 
	matricula VARCHAR(255),
	especialidad ENUM(
		'Deportólogo'
	),
	descripcion JSON,
	PRIMARY KEY (id)
);

create table Paciente (
	id INTEGER(11),
	nombre VARCHAR(30),
	apellido VARCHAR(30),
	modelo_cintura FLOAT,
	peso_actual FLOAT,
	sexo ENUM (
		'Femenino',
		'Masculino'
	), -- Preguntar si es correcto
	disciplina ENUM (
		'Ciclismo',
		'Fútbol',
		'Natación',
		'Tennis',
		'Rugby'
	),
	PRIMARY KEY(id)
);

create table Plan (
	id INTEGER(11),
	periodo ENUM(
		'Semanal',
		'Quincenal',
		'Mensual'
	),
	observaciones JSON,
	calificación ENUM (
		'Excelente',
		'Buena',
		'Regular'
	),
	PRIMARY KEY(id)
);

create table Objetivo (
	id integer(11),
	cumplido BOOLEAN,
	descripcion VARCHAR(255),
	PRIMARY KEY(id)
);

create table Comida (
	id INTEGER(11),
	descripcion VARCHAR(255),
	PRIMARY KEY (id)
);

create table Comida_AC (
	id INTEGER(11),
	id_comida INTEGER(11),
	proteinas FLOAT,
	carbohidratos FLOAT,
	vegetales FLOAT,
	PRIMARY KEY (id),
	FOREIGN KEY (id_comida) REFERENCES Comida(id)
);

create table Comida_DM (
	id INTEGER(11),
	id_comida INTEGER(11),
	PRIMARY KEY (id),
	FOREIGN KEY (id_comida) REFERENCES Comida (id)
);

create table Colacion (
	id INTEGER(11),
	id_plan INTEGER(11),
	nombre VARCHAR(255),
	PRIMARY KEY (id),
	FOREIGN KEY (id_plan) REFERENCES Plan(id)
);

create table Bebida(
	id INTEGER(11),
	id_plan INTEGER(11),
	nombre VARCHAR(255),
	PRIMARY KEY (id),
	FOREIGN KEY (id_plan) REFERENCES Plan(id)
);
