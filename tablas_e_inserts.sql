drop database if exists sistema;
CREATE DATABASE sistema;

use sistema;

create table Profesional (
	id INTEGER(11) NOT NULL auto_increment,
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
	id INTEGER(11) NOT NULL auto_increment,
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
	id INTEGER(11) NOT NULL auto_increment,
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
	id integer(11) NOT NULL auto_increment,
	cumplido BOOLEAN,
	descripcion VARCHAR(255),
	PRIMARY KEY(id)
);

create table Comida (
	id INTEGER(11) NOT NULL auto_increment,
	descripcion VARCHAR(255),
	PRIMARY KEY (id)
);

create table Comida_AC (
	id INTEGER(11) NOT NULL,
	id_comida INTEGER(11),
	proteinas FLOAT,
	carbohidratos FLOAT,
	vegetales FLOAT,
	PRIMARY KEY (id),
	FOREIGN KEY (id_comida) REFERENCES Comida(id)
);

create table Comida_DM (
	id INTEGER(11) NOT NULL,
	id_comida INTEGER(11),
	PRIMARY KEY (id),
	FOREIGN KEY (id_comida) REFERENCES Comida (id)
);

create table Colacion (
	id INTEGER(11) NOT NULL auto_increment,
	id_plan INTEGER(11),
	nombre VARCHAR(255),
	PRIMARY KEY (id),
	FOREIGN KEY (id_plan) REFERENCES Plan(id)
);

create table Bebida(
	id INTEGER(11) NOT NULL auto_increment,
	id_plan INTEGER(11),
	nombre VARCHAR(255),
	PRIMARY KEY (id),
	FOREIGN KEY (id_plan) REFERENCES Plan(id)
);

insert into Profesional values (1, 'Ignacio', 'Barrientos', '12395023845', 'Deportólogo', JSON_QUOTE('Hola mundo!'));
insert into Profesional values (2, 'Francisco', 'Barrientos', '1290837', 'Deportólogo', JSON_QUOTE('Ejemplo'));

insert into Paciente values (1, 'Ignacio', 'Franco', 20.2, 60.1, 'Masculino', 'Ciclismo');
insert into Paciente values (2, 'Alejandro', 'Moras', 24.3, 65.4, 'Masculino', 'Natación');

insert into Plan values (1,'Semanal', JSON_QUOTE('Sin observaciones'), 'Excelente');
insert into Plan values (2,'Mensual', JSON_QUOTE('No hizo los ejercicios solicitados'), 'Regular');

insert into Objetivo values (1, false, 'No tomar alcohol');
insert into Objetivo values (2, true, 'No tener un dia inactivo');

insert into Comida values (1,'Zanahoria');
insert into Comida values (2,'Lechuga');

insert into Comida_AC values (1,2, 100.0, 90.0, 87.0);
insert into Comida_DM values (2, 1);

insert into Colacion values (1, 1, 'Galletas de agua');
insert into Colacion values (2, 2, 'Avena');

insert into Bebida values (1,1, 'Leche');
insert into Bebida values (2,2, 'Agua');
