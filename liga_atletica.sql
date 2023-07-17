CREATE DATABASE Liga_Atletica;

USE Liga_Atletica;

CREATE TABLE Equipo(
	Codigo_Equipo INT NOT NULL AUTO_INCREMENT,
	Nombre_Equipo VARCHAR(100),
	Anio_Fundacion YEAR,
	Aforo INT,
	Nombre_Estadio VARCHAR(100),
	Ciudad VARCHAR(100),
	PRIMARY KEY PK_Equipo (Codigo_Equipo)
);

CREATE TABLE Presidente_Equipo (
	Codigo_Presidente INT NOT NULL AUTO_INCREMENT,
	Nombre VARCHAR(50),
	Apellido VARCHAR(50),
	DNI VARCHAR(20),
	Fecha_Nacimiento DATE,
	Anio_Presidente YEAR,
	Codigo_Equipo INT NOT NULL,
	PRIMARY KEY PK_Presidente_Equipo (Codigo_Presidente),
	FOREIGN KEY FK_Equipo_Presidente (Codigo_Equipo) REFERENCES Equipo(Codigo_Equipo)
);

CREATE TABLE Jugador (
	Codigo_Jugador INT NOT NULL AUTO_INCREMENT,
	Nombre VARCHAR(50),
	Fecha_Nacimiento DATE,
	Posicion INT,
	Codigo_Equipo INT NOT NULL,
	PRIMARY KEY (Codigo_Jugador),
	FOREIGN KEY (Codigo_Equipo) REFERENCES Equipo(Codigo_Equipo)
);

CREATE TABLE Partidos (
	Codigo_Partido INT NOT NULL AUTO_INCREMENT,
	Goles_Visita INT,
	Goles_Casa INT,
	Fecha_Partido DATETIME,
	PRIMARY KEY (Codigo_Partido)
);

CREATE TABLE Partidos_Equipos (
	Codigo_Partido INT NOT NULL,
	Codigo_Equipo INT NOT NULL,
	PRIMARY KEY (Codigo_Partido, Codigo_Equipo),
	FOREIGN KEY (Codigo_Equipo) REFERENCES Equipo(Codigo_Equipo),
	FOREIGN KEY (Codigo_Partido) REFERENCES Partidos(Codigo_Partido)
);

CREATE TABLE Goles (
	Momento_Gol DATETIME NOT NULL,
	Codigo_Partido INT NOT NULL,
	Descripcion_Gol VARCHAR(200),
	Codigo_Equipo INT NOT NULL,
	PRIMARY KEY (Codigo_Partido, Momento_Gol),
	FOREIGN KEY (Codigo_Equipo) REFERENCES Equipo(Codigo_Equipo),
	FOREIGN KEY (Codigo_Partido) REFERENCES Partidos(Codigo_Partido)
);
