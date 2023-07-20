USE Liga_Atletica;

INSERT INTO Equipo (Codigo_Equipo, Nombre_Equipo, Anio_Fundacion, Aforo, Nombre_Estadio, Ciudad)
VALUES (1, 'Python', 2000, 0, 'Mateo Flores', 'Guatemala');

INSERT INTO Equipo (Codigo_Equipo, Nombre_Equipo, Anio_Fundacion, Aforo, Nombre_Estadio, Ciudad)
VALUES (2, 'Java', 2001, 10, 'Machu Pichu', 'Peru');

INSERT INTO Equipo VALUES (3, 'Javascript', 2002, 20, 'Ciudad de Mexico', 'Mexico');

INSERT INTO Equipo VALUES (4, 'PHP', 2010, 30, 'San Salvador', 'El Salvador');

INSERT INTO Equipo (Nombre_Equipo, Anio_Fundacion, Aforo, Nombre_Estadio, Ciudad)
VALUES ('SQL', 2011, 40, 'San Jose', 'Costa Rica');

INSERT INTO Equipo (Nombre_Equipo, Anio_Fundacion, Aforo, Nombre_Estadio, Ciudad)
VALUES ('C#', 2012, 50, 'Roatan', 'Honduras');


INSERT INTO Jugador (Nombre, Fecha_Nacimiento, Posicion, Codigo_Equipo) VALUES ('Marta', '2020-01-01', 1, 1);
INSERT INTO Jugador (Nombre, Fecha_Nacimiento, Posicion, Codigo_Equipo) VALUES ('Maria', '2020-02-02', 2, 1);
INSERT INTO Jugador (Nombre, Fecha_Nacimiento, Posicion, Codigo_Equipo) VALUES ('Jenifer', '2020-03-03', 3, 2);
INSERT INTO Jugador (Nombre, Fecha_Nacimiento, Posicion, Codigo_Equipo) VALUES ('Andrea', '2020-04-04', 4, 2);
INSERT INTO Jugador (Nombre, Fecha_Nacimiento, Posicion, Codigo_Equipo) VALUES ('Alejandra', '2020-05-05', 5, 3);
INSERT INTO Jugador (Nombre, Fecha_Nacimiento, Posicion, Codigo_Equipo) VALUES ('Eliza', '2020-06-06', 6, 3);

INSERT INTO Presidente_Equipo (Nombre, Codigo_Equipo) VALUES ('Ana', 1);
INSERT INTO Presidente_Equipo (Nombre, Codigo_Equipo) VALUES ('Wendy', 2);
INSERT INTO Presidente_Equipo (Nombre, Codigo_Equipo) VALUES ('Karla', 3);
INSERT INTO Presidente_Equipo (Nombre, Codigo_Equipo) VALUES ('Elizabeth', 4);
INSERT INTO Presidente_Equipo (Nombre, Codigo_Equipo) VALUES ('Sofia', 5);
INSERT INTO Presidente_Equipo (Nombre, Codigo_Equipo) VALUES ('Merlina', 6);

INSERT INTO Partidos (Fecha_Partido) VALUES ('2021-07-01 10:00');
INSERT INTO Partidos (Fecha_Partido) VALUES ('2021-07-02 11:00');
INSERT INTO Partidos (Fecha_Partido) VALUES ('2021-07-03 12:00');
INSERT INTO Partidos (Fecha_Partido) VALUES ('2023-07-04 13:00');
INSERT INTO Partidos (Fecha_Partido) VALUES ('2023-07-05 14:00');
INSERT INTO Partidos (Fecha_Partido) VALUES ('2023-07-06 15:00');


INSERT INTO Partidos_Equipos VALUES (1, 1);
INSERT INTO Partidos_Equipos VALUES (1, 2);
INSERT INTO Partidos_Equipos VALUES (2, 3);
INSERT INTO Partidos_Equipos VALUES (2, 4);
INSERT INTO Partidos_Equipos VALUES (3, 5);
INSERT INTO Partidos_Equipos VALUES (3, 6);

INSERT INTO Goles (Momento_Gol, Codigo_Partido, Codigo_Equipo) VALUES ('2023-07-01 10:01', 1, 1);
INSERT INTO Goles (Momento_Gol, Codigo_Partido, Codigo_Equipo) VALUES ('2023-07-01 10:02', 1, 1);
INSERT INTO Goles (Momento_Gol, Codigo_Partido, Codigo_Equipo) VALUES ('2023-07-01 10:03', 2, 3);
INSERT INTO Goles (Momento_Gol, Codigo_Partido, Codigo_Equipo) VALUES ('2023-07-01 10:04', 2, 4);
INSERT INTO Goles (Momento_Gol, Codigo_Partido, Codigo_Equipo) VALUES ('2023-07-01 10:05', 2, 3);
INSERT INTO Goles (Momento_Gol, Codigo_Partido, Codigo_Equipo) VALUES ('2023-07-01 10:06', 3, 6);

# Muestre toda la informacion de los jugadores
SELECT *
FROM Jugadores;

#Muestre el nombre, nombre del estado y año de fundacion de todos los equipos
SELECT Nombre_Equipo, Nombre_Estadio, Anio_Fundacion
FROM Equipo;

# Muestre el nombre, nombre del estadio y ciudad de los equipos que tienen un año de fundacion menor al 2006.
SELECT Nombre_Equipo, Nombre_Estadio, Ciudad
FROM Equipo
WHERE Anio_Fundacion  < 2006;

# Muestre el total de goles en casa de los partidos.
SELECT SUM(Goles_Casa)
FROM Partidos;

# Muestre el total de goles en casa y goles de visita de los partidos.
SELECT SUM(Goles_Casa), SUM(Goles_Visita)
FROM Partidos;

# Muestre el promedio de goles en casa de los partidos.
SELECT AVG(Goles_Casa)
FROM Partidos;

# Muestre el promedio de goles de visita de los partidos.
SELECT AVG(Goles_Visita)
FROM Partidos;

# Muestre todos los partidos que se realizaron despues de junio del 2022.
SELECT *
FROM Partidos
WHERE Fecha_Partido >= '2022-07-01';

# Muestre en mayusculas el nombre y apellidos de los presidentes.
SELECT UPPER(Nombre), UPPER(Apellido)
FROM Presidente_Equipo;

# Muestre en mayusculas el nombre de los jugadores.
SELECT UPPER(Nombre)
FROM Jugador;

# Muestre los primeros 3 registros de la tabla jugadores.
SELECT *
FROM Jugador
LIMIT 3;

# Muestre los primeros 4 registros de la tabla equipo.
SELECT *
FROM Equipo
LIMIT 4;
