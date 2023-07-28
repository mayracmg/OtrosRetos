DELIMITER $$

  CREATE TRIGGER BI_Partidos
    BEFORE INSERT ON Partidos 
	FOR EACH ROW
BEGIN
    IF (NEW.Goles_Visita IS NULL) THEN
		SET NEW.Goles_Visita = 0;
	END IF;

	IF (NEW.Goles_Casa IS NULL) THEN
		SET NEW.Goles_Casa = 0;
	END IF;

	IF (NEW.Fecha_Partido IS NULL) THEN
		SET NEW.Fecha_Partido = SYSDATE();
	END IF;
END$$


DELIMITER $$

DROP TRIGGER IF EXISTS BU_Jugador;
CREATE TRIGGER BU_Jugador
    BEFORE UPDATE ON Jugador
	FOR EACH ROW
BEGIN
	DECLARE Posicion_Jugador integer;

    IF (NEW.Posicion IS NULL) THEN
		SELECT MAX(Posicion) + 1
		INTO Posicion_Jugador
		FROM Jugador 
		WHERE Codigo_Equipo = NEW.Codigo_Equipo;
	
		SET NEW.Posicion = Posicion_Jugador;
	END IF;

END$$

  
INSERT INTO Partidos (Goles_Visita) VALUES (1);
INSERT INTO Partidos (Goles_Casa) VALUES (2);
INSERT INTO Partidos (Goles_Visita, Goles_Casa) VALUES (3, 4);
INSERT INTO Partidos (Goles_Visita, Goles_Casa, Fecha_Partido) VALUES (5, 6, '2023-07-26 10:00');
INSERT INTO Partidos (Fecha_Partido) VALUES ('2023-07-26 10:00');

SELECT *
FROM Partidos;

UPDATE Jugador SET Posicion = NULL WHERE Codigo_Jugador = 1;
UPDATE Jugador SET Posicion = 4 WHERE Codigo_Jugador = 3;
