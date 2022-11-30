CREATE DATABASE LIBROS DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
use LIBROS;

CREATE TABLE grado(
	codigo_grado int NOT null AUTO_INCREMENT PRIMARY KEY,
    nombre varchar(50) not null
);

CREATE TABLE estudiante(
	carne int  NOT null AUTO_INCREMENT PRIMARY KEY,
  	nombre varchar(50) not null,
    apellido varchar(50) not null,
    direccion varchar(75) not null,
    teleforno int(8) ,
    email varchar(75),
    fechanac date not null,
    codigo_grado int not null
);
CREATE TABLE empleados(
	cod_empleado int NOT null AUTO_INCREMENT PRIMARY key,
    nombre varchar(50) not null,
    apellido varchar(50) not null,
    direccion varchar(75),
    email varchar(75) 
    
);

CREATE TABLE prestamos(
	cod_prestamos int NOT null AUTO_INCREMENT PRIMARY key,
    cod_libro int not null,
  	carne int  not null,
    fecha_prestamo date not null,
    fecha_devolucion date not null,
    cod_empleado int    
);


CREATE TABLE estados(
	cod_estado int NOT null AUTO_INCREMENT PRIMARY key,
    nombre varchar(50) not null
);

CREATE TABLE paises(
 	cod_pais int NOT null AUTO_INCREMENT PRIMARY key,
  	nombre varchar(50)
);


CREATE TABLE libros(
	codigo_libro int NOT null AUTO_INCREMENT PRIMARY KEY,
    codigo_autor int not null,
    codigo_editorial int not null,
    titulo varchar(50) not null,
    numero_paginas int(4) not null,
    tamanio float(4,2) not null,
    precio float(4,2) not null,
    estado int,
    edicion varchar(25)
 
);

CREATE TABLE editorial(
	codigo_editorial int NOT null AUTO_INCREMENT PRIMARY KEY,
    nombre varchar(50) not null,
    direccion varchar(75) not null,
    telefono int(80),
   email varchar(75)
    
);

CREATE TABLE autores(
	codigo_autor int NOT null AUTO_INCREMENT PRIMARY KEY,
    apellido_autor varchar(50) not null,
    nombre_autor varchar(50) NOT null,
    pais_origen int not null
      
);

ALTER TABLE estudiante
ADD CONSTRAINT pk_fk_cod_grado FOREIGN KEY (codigo_grado) REFERENCES grado(codigo_grado) on UPDATE CASCADE on DELETE CASCADE;

ALTER TABLE prestamos
ADD CONSTRAINT pk_fk_cod_estud FOREIGN KEY (carne) REFERENCES estudiante(carne) on UPDATE CASCADE on DELETE CASCADE;

ALTER TABLE prestamos
ADD CONSTRAINT pk_fk_cod_emp FOREIGN KEY (cod_empleado) REFERENCES empleados(cod_empleado) on UPDATE CASCADE on DELETE CASCADE;

ALTER TABLE prestamos
ADD CONSTRAINT pk_fk_cod_lib FOREIGN KEY (cod_libro) REFERENCES libros(codigo_libro) on UPDATE CASCADE on DELETE CASCADE;

ALTER TABLE libros
ADD CONSTRAINT pk_fk_cod_esta FOREIGN KEY (estado) REFERENCES estados(cod_estado) on UPDATE CASCADE on DELETE CASCADE;

ALTER TABLE libros
ADD CONSTRAINT pk_fk_cod_edit FOREIGN KEY (codigo_editorial) REFERENCES editorial(codigo_editorial) on UPDATE CASCADE on DELETE CASCADE;

ALTER TABLE libros
ADD CONSTRAINT pk_fk_cod_aut FOREIGN KEY (codigo_autor) REFERENCES autores(codigo_autor) on UPDATE CASCADE on DELETE CASCADE;

ALTER TABLE autores
ADD CONSTRAINT pk_fk_cod_pais FOREIGN KEY (	pais_origen) REFERENCES paises(cod_pais) on UPDATE CASCADE on DELETE CASCADE;